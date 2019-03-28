import click
import json
from cli import GoogleSheetTarget, GoogleCellRangeOption

@click.command('range-download', short_help='Copy a 2D array of values out of a sheet.')
@click.option("--sheet", "target",
    type=GoogleSheetTarget(),
    required=True)
@click.option("--range", "range",
    required=True,
    type= GoogleCellRangeOption(),
    help="cell range (eg. A1:B2)")
@click.option("--save", "save",
    type=click.File('w',lazy=True),
     help="path to file, or - for stdout",
     required=True)
@click.option("--type","type",
    type=click.Choice(['values','formula']),
    default="values",
    help="type of data to download (values or formula)")
@click.pass_obj
def cli(google_cli_context, target, save, range,type):
    """
    Download a rectangle of JSON data from a specific point in an existing sheet.

    \b
    Examples:
    ---------------------------------------------
    # when processing from a script iterating over file ids
    range-download --sheet <GoogleSheetFile>
                   --range arbitrary-string
                   --save <writeableFilePath>
                   --type <type>

    \b
    # when cutting/pasting a url from a browser, name sure that the
    # sheet name is appended in addition to the sheet id if present
    range-download --save <GoogleSheetFile>
                   --range <GoogleRangeId>
                   --save -
                   --type <type>
    """

    # this will let us move the CLI logic out of the API, and help
    # decouple the CLI parsing from the API access
    target.validate_against_api(google_cli_context,sheet_must_exist=True)

    api = google_cli_context.sheets

    if type == 'values':
        if range.all:
            values = api.all_values(target.fileid,target.sheetname)
        else:
            values = api.values_for_range(target.fileid, target.sheetname, range.range)
    else:
        if range.all:
            raise Exception("Downloading formula values requires explicit range, 'all' not supported")
        values = api.formulas_for_range(target.fileid, target.sheetname, range.range)
    json.dump(values,save,indent=4,sort_keys=True)
