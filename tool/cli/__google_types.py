import os
import sys
import click
import re
from collections import namedtuple
from cli import SubCommand,pass_application
from apis.google.drive import itis,GoogleDrive
from apis.google.sheets import GoogleSheets,GoogleCellRange
from apis.google import authorize_to_gapi

class GoogleDriveFolderId(click.ParamType):
    name = 'Google-drive-folder-id'
    help = "Google Drive Folder or docptr."

    def convert(self, value, param, ctx):
        if itis.folderid(value):
            return value
        else:
            ptr = ctx.parent.obj.dpm.resolveDocPtr(value,type='gfolder')
            if ptr == None:
                raise click.BadParameter('could not parse value (%s) or locate docptr of type "gfolder" with that name.' % value)
            return ptr.folder_id

class GoogleDriveFile(click.ParamType):
    name = 'Google-drive-file'
    help = "Google Drive File. Format url-or-fileid"

    def convert(self, value, param, ctx):
        if itis.fileurl(value):
            # file is a google drive url
            urlinfo = itis.fileurl(value)
            return urlinfo['fileid']
        else:
            if itis.fileid(value):
                return value
            else:
                ptr = ctx.parent.obj.config.resolveDocPtr(value)
                if ptr == None:
                    raise click.BadParameter('could not parse value (%s) or locate docptr' % value)
                if not ptr.type in ['gsheet','gdoc','gfile']:
                    raise click.BadParameter('(%s) is a document of type (%s), require gsheet,gdoc or gfile' % (value,ptr.type))
                return ptr.file

class GoogleSheetTarget(click.ParamType):
    name = 'Google-sheet-file'
    help = "Spreadsheet target. Format url-or-fileid[:sheetname] (sheetname overrides sheet value from url)"

    def __init__(self):
        self.fileid = None
        self.sheetname = None
        self.gid = None

    def convert(self, value, param, ctx):
        if itis.fileurl(value):
            # file is a google drive url
            urlinfo = itis.fileurl(value)
            fileid = urlinfo['fileid']
            # try to extract :sheetname from url type value
            sheetname = re.match(r':?(.*)', urlinfo['suffix']).group(1) or None
            if not sheetname and urlinfo['gid']:
                self.gid = int(urlinfo['gid'])
                # url suffix doesn't contain :sheetname but gid is present - this
                # will be resolved once all the cli parsing stuff is done and after
                # we have activated the API - this removes the API calls from the
                # syntactic CLI validation.
        else:
            # file must be an id
            try:
                splitted = value.split(':', 1)
                fileid = splitted[0]
                sheetname = splitted[1]
                try:
                    self.gid = int(sheetname)
                    sheetname = None
                except ValueError as E:
                    self.gid = None
            except IndexError:
                sheetname = None
            if not itis.fileid(fileid):
                ptr = ctx.parent.obj.config.resolveDocPtr(fileid)
                if ptr == None:
                    raise click.BadParameter('could not parse value (%s) or locate docptr' % value)
                if ptr.type != 'gsheet':
                    raise click.BadParameter('(%s) is a document of type (%s), require gsheet' % (value,ptr.type))
                fileid = ptr.file
                sheetname = ptr.sheet
        self.fileid = fileid
        self.sheetname = sheetname
        return self

    # this is called by CLI to do API-based validation of the CLI - we know,
    # at this point, that the API is valid, because it is handed in to us as
    # google_cli_context, rather than relying on background global state.
    def validate_against_api(self,google_cli_context,sheet_must_exist=False):

        # if we give an integer, we assume the sheet must exist
        if self.gid != None:
            worksheet = google_cli_context.sheets.find_sheet_by_id(self.fileid,self.gid)
            if worksheet == None:
                raise click.BadParameter('sheet with id "%s" not found' % (self.gid))
            self.sheetname = worksheet.title
        else:
            # this is one way to test for a sheet that needs to exist
            if sheet_must_exist and self.sheetname:
                self.gid = google_cli_context.sheets.find_sheet_by_name(self.fileid,self.sheetname)

                if self.gid == None:
                    spreadsheet = google_cli_context.sheets.open_sheet_by_id(self.fileid)
                    sheets = []
                    for worksheet in spreadsheet.worksheets():
                        sheets.append(worksheet.title)
                    raise click.BadParameter('sheet "%s" found, options are %s' % (self.sheetname,sheets))

        if not self.sheetname:
            raise click.BadParameter('must contain a sheet')

class GoogleCellRangeOption(click.ParamType):
    name = 'Cell-Range'

    def __init__(self):
        self.all = False
        self._range = None

    @property
    def range(self):
        return self._range

    def convert(self, value, param, ctx):
        """
        checks to see that the string is a valid cell range
        """
        if value == 'all':
            self.all = True
        else:
            regex = r'(?P<col>[A-Z]+)(?P<row>\d+)'
            splitted = value.split(":",1);
            if len(splitted) == 2:
                start = re.match(regex, splitted[0]).groupdict()
                end = re.match(regex, splitted[1]).groupdict()
                if start == None or end == None:
                    raise click.BadParameter("'%s' is not a valid range" % value)
                start_col = start['col']
                start_row = int(start['row'])
                end_col = end['col']
                end_row = int(end['row'])
                self._range = GoogleCellRange(start_col,start_row,end_col,end_row)
            else:
                index = re.match(regex, value).groupdict()
                if index == None:
                    raise click.BadParameter("'%s' is not a valid cell" % value)
                start_col = index['col']
                start_row = int(index['row'])
                end_col = index['col']
                end_row = int(index['row'])
                self._range = GoogleCellRange(start_col,start_row,end_col,end_row)
        return self
