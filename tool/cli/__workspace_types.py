import os
import sys
import click
import re
from collections import namedtuple
from cli import SubCommand,pass_application
from apis.google.drive import itis,GoogleDrive
from apis.google.sheets import GoogleSheets,GoogleCellRange
from apis.google import authorize_to_gapi

class WorkspaceFolderId(click.ParamType):
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

class WorkspaceFileId(click.ParamType):
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
