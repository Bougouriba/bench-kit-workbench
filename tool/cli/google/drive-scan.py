import click
import json
from . import pass_google_util
from cli import common_table_output_options,pass_application,GoogleDriveFolderId
from slugify import slugify
from apis.google.docptr import GoogleSpreadsheetPointer, GoogleDocPointer, GoogleFolderPointer, GoogleWorksheetPointer

@click.command('drive-scan', short_help='List spreadsheet documents in folder.')
@click.option("--folder", "folder",
    type=GoogleDriveFolderId(),
    required=True)
@click.option("--depth", "depth",
    type=click.INT,
    default=10000,
    required=False)
@click.option("--type","type",
    type=click.Choice(['spreadsheet','document','folder','worksheet']),
    default=None,
    help="filter for type")
@common_table_output_options
@click.option('--docptrs',"docptrs_",
    is_flag=True,
    default=False,
    help="Create docptrs"
    )
@click.option('--tag',"tags_",
    multiple=True,
    help="Initial tags to provide"
    )
@pass_google_util
@pass_application
def cli(app,util, folder,depth,type,docptrs_,tags_,**kwargs):
    """
    Scan google folder recursively and map sheets
    """
    type_to_locate = type
    if type == 'worksheet':
        type_to_locate = 'spreadsheet'
    results = util.drive.get_children(folder,depth=depth,type=type_to_locate)
    if type == 'worksheet':
        spreadsheets = list(results)
        results = []
        for document in spreadsheets:
            document_id = document['id']
            document_name = document['name']
            document_slug = slugify(document_name)
            sheet = util.sheets.open_sheet_by_id(document_id)
            for worksheet in sheet.worksheets():
                results.append({
                    'folderPath':document['folderPath'],
                    'document_id':document_id,
                    'document_name':document_name,
                    'mimeType':document['mimeType'],
                    'sheet_name':worksheet.title
                })
    output = app.output
    output.set_table_data_from_dict_list(results)
    output.output()


    if docptrs_:
        if tags_ == None:
            tags_ = ['all']
        if type in ['spreadsheet','document','folder']:
            for elt in results:
                id = elt['id']
                name = elt['name']
                slug = slugify(name)
                if type == 'spreadsheet':
                    ptr = GoogleSpreadsheetPointer(slug,id,tags_)
                elif type == 'document' :
                    ptr = GoogleDocPointer(slug,id,tags_)
                else:
                    ptr = GoogleFolderPointer(slug,id,tags_)

                util.dpm.assertDocPtr(ptr)
        else:
            idmap = {}
            for elt in spreadsheets:
                id = elt['id']
                name = elt['name']
                slug = slugify(name)
                ptr = GoogleSpreadsheetPointer(slug,id,tags_)
                util.dpm.assertDocPtr(ptr)

            for elt in results:
                id = elt['document_id']
                document_name = elt['document_name']
                sheet_name = elt['sheet_name']
                document_slug = slugify(document_name)
                sheet_slug = slugify(sheet_name)
                ptr = GoogleWorksheetPointer(slugify(document_slug+"-"+sheet_slug),id,sheet_name,tags=tags_,document_name=document_name,doc_docptr=document_slug)
                util.dpm.assertDocPtr(ptr)
