import click
from cli import GoogleDriveFile

@click.command('sheet-list', short_help='List sheets in a gsheet document.')
@click.option("--doc ","fileid_",
    type=GoogleDriveFile(),
    required=True,
    help="FileId or url of existing file")
@click.pass_obj
def cli(google_cli_context, fileid_):
    """
    List sheets in a gsheet document

    \b
    Examples:
    ---------------------------------------------
    sheet-list --sheet <GoogleDocFile>

    """
    spreadsheet = google_cli_context.sheets.open_sheet_by_id(fileid_)
    sheets = []
    for worksheet in spreadsheet.worksheets():
        sheets.append(worksheet.title)
    print(sheets)
