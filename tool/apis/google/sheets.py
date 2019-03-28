"""
Google Sheets API Bridge.

Terminology: a spreadsheet contains sheets.
"""

import random
import string
import gspread
import json

class GoogleCellRange(object):

    def __init__(self,start_col,start_row,end_col,end_row):
        self.start_col = start_col
        self.start_row = start_row
        self.end_col = end_col
        self.end_row = end_row

    @property
    def string(self):
        return "%s%s:%s%s" % (self.start_col,self.start_row,self.end_col,self.end_row)

    @property
    def start_col_index(self):
        return self._index_of(self.start_col)

    @property
    def end_col_index(self):
        return self._index_of(self.end_col)

    @property
    def width(self):
        return self.end_col_index - self.start_col_index + 1

    @property
    def height(self):
        return self.end_row - self.start_row + 1

    def _index_of(self,value):
        if len(value) == 1:
            return ord(value[0])-ord('A') + 1
        elif len(value) == 1:
            return (26*(ord(value[0])-ord('A')))+(ord(value[1])-ord('A')) + 1
        else:
            raise Exception("Only one and two character rows are supported")

class GoogleSheets(object):
    def __init__(self,credentials):
        """
        Returns an authenticated gspread client object.
        """
        class Credentials (object):
            def __init__ (self, access_token=None):
                self.access_token = access_token
        self.gc= gspread.authorize(Credentials(credentials.token))


    def values_for_range(self,fileid, sheet, range_):
        """Returns a 2D list of spreadsheet values
        Args:
            fileid: fileid.
            sheet: Can be a sheet name or id.
            range_: a cell range
        """
        worksheet = self.gc.open_by_key(fileid).worksheet(sheet)
        col = 0
        row = 0
        values = [ [ '' for i in range(range_.width) ] for j in range(range_.height) ]
        for cell in worksheet.range(range_.string):
            row = values[cell.row - range_.start_row]
            row[cell.col - range_.start_col_index] = cell.value
        return values

    def formulas_for_range(self,fileid, sheet, range_):
        """Returns a 2D list of spreadsheet values
        Args:
            fileid: fileid.
            sheet: Can be a sheet name or id.
            range_: a cell range
        """
        worksheet = self.gc.open_by_key(fileid).worksheet(sheet)
        col = 0
        row = 0
        values = [ [ '' for i in range(range_.width) ] for j in range(range_.height) ]
        for row_index in range(range_.height):
            sheet_row_index = row_index + range_.start_row
            col_index = 0
            for value in worksheet.row_values(sheet_row_index,value_render_option='FORMULA'):
                if col_index >= range_.start_col_index and col_index <= range_.end_col_index:
                    values[row_index][col_index] = value
                col_index = col_index + 1
        return values

    def conditional_formatting_for_range(self,fileid, sheet, range_):
        """Returns a 2D list of spreadsheet values
        Args:
            fileid: fileid.
            sheet: Can be a sheet name or id.
            range_: a cell range
        """
        sheet = self.gc.open_by_key(fileid)
        meta = sheet.fetch_sheet_metadata()
        print(json.dumps(meta,indent=4,sort_keys=True))

    def all_values(self,fileid, sheet):
        """Returns a 2D list of spreadsheet values
        Args:
            fileid: fileid.
            sheet: Can be a sheet name or id.
        """
        worksheet = self.gc.open_by_key(fileid).worksheet(sheet)
        return worksheet.get_all_values()

    def get_all_records(self,fileid, sheet):
        """
        Returns a list of dictionaries, all of them having the
        contents of the spreadsheet with the head row as keys and
        each of these dictionaries holding the contents of subsequent
        rows of cells as values.

        From: https://gspread.readthedocs.io/en/latest/api.html

        Args:
            fileid: fileid.
            sheet: Can be a sheet name or id.
        """
        worksheet = self.gc.open_by_key(fileid).worksheet(sheet)
        return worksheet.get_all_records()

    def delete(self,file_id, sheet=None):
        """Deletes the given sheet in the given spreadsheet.
        Args:
            file_id: The spreadsheet id
            sheet: The sheet name or id.
        """
        spreadsheet = self.gc.open_by_key(file_id)
        for worksheet in spreadsheet.worksheets():
            if str(worksheet.title) == str(sheet) or str(worksheet.id) == str(sheet):
                spreadsheet.del_worksheet(worksheet)

    def find_sheet_by_id(self,file_id,sheet_id):
        gspreadsheet = self.gc.open_by_key(file_id)
        for worksheet in gspreadsheet.worksheets():
            if worksheet.id == sheet_id:
                return worksheet

    def find_sheet_by_name(self,file_id,sheetname):
        gspreadsheet = self.gc.open_by_key(file_id)
        for worksheet in gspreadsheet.worksheets():
            if worksheet.title == sheetname:
                return worksheet

    def open_sheet_by_id(self,file_id):
        return self.gc.open_by_key(file_id)

    def empty_spreadsheet_and_return_placeholder(self,file_id):
        gspreadsheet = self.gc.open_by_key(file_id)
        placeholder_sheet_name = ''.join(random.choices(string.ascii_uppercase + string.digits, k=10))
        placeholder_sheet = gspreadsheet.add_worksheet(placeholder_sheet_name,1,1)
        for worksheet in gspreadsheet.worksheets():
            if worksheet.id != placeholder_sheet.id:
                gspreadsheet.del_worksheet(worksheet)
        return placeholder_sheet
