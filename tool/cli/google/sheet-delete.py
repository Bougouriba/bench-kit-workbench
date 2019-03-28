import click
from cli import GoogleSheetTarget

@click.command('sheet-delete', short_help='Delete a sheet from a gsheet document.')
@click.option("--sheet", "target",
    type=GoogleSheetTarget(),
    required=True)
@click.pass_obj
def cli(google_cli_context, target):
    """
    Delete a sheet from a gsheet document.

    \b
    Examples:
    ---------------------------------------------
    sheet-delete --sheet <GoogleSheetFile>

    """
    # this will let us move the CLI logic out of the API, and help
    # decouple the CLI parsing from the API access
    target.validate_against_api(google_cli_context,sheet_must_exist=True)

    google_cli_context.sheets.delete(target.fileid, target.sheetname)
