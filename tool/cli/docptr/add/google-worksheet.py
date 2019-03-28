import click
from cli import  GoogleSheetTarget
from apis.google.docptr import GoogleWorksheetPointer

@click.command('google-worksheet')
@click.option('--sheet','sheet_',
    type=GoogleSheetTarget()
    )
@click.pass_obj
def cli(ctx,sheet_):
    """
    Add a google sheet as a docptr
    """
    ctx.handle(
        GoogleWorksheetPointer(ctx.util.name,sheet_.fileid,sheet_.sheetname)
    )
