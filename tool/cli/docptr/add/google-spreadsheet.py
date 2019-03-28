import click
from cli import  GoogleSheetTarget
from apis.google.docptr import GoogleSpreadsheetPointer

@click.command('google-spreadsheet')
@click.option('--file','file_',
    type=GoogleSheetTarget()
    )
@click.pass_obj
def cli(ctx,file_):
    """
    Add a google spreadsheet as a docptr
    """
    ctx.handle(
        GoogleSpreadsheetPointer(ctx.util.name,file_.fileid)
    )
