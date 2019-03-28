import click
#from . import GoogleFileId,GoogleSheetIdOrName, GoogleSheetUrl, GoogleCellRange, GoogleCellId

@click.command('range-patch', short_help='Copy a 2D array of values into a sheet.')
@click.option("--fileid","fileid_",
    #type=GoogleFileId(),
    help="FileId of existing file")
@click.option("--sheet","sheet_",
    #type=GoogleSheetIdOrName(),
    help="sheet id or name")
@click.option("--url","url_",
    #type=GoogleSheetUrl(),
    help="complete url of existing file")
@click.option("--values","values_",
    help="path to file")
@click.option("--metadata","metadata_",
    help="path to file")
@click.option("--cell","cell_",
    #type=GoogleCellId(),
    help="name of cell in upper left")
@click.pass_obj
def cli(google_cli_context, fileid_,sheet_,url_,values_,cell_,metadata_):
    """
    Upload a rectangle of JSON data to a specific point in an existing sheet.

    \b
    Examples:
    ---------------------------------------------
    # when processing from a script iterating over file ids
    range-patch --fileid <GoogleFileId>
                --sheet <GoogleSheetIdOrName>
                --cell <GoogleCellId>
                --values <pathToExisting2DJsonFile>

    \b
    # when cutting/pasting a url from a browser
    range-patch --url <GoogleSheetUrlId>
                --cell <GoogleCellId>
                --values <pathToExisting2DJsonFile>

    \b
    # updating the conditional formatting of a range
    range-patch --url <GoogleSheetUrlId>
                --cell <GoogleCellId>
                --metadata <pathToExisting2DJsonFileOfCellMetadata>

    \b
    Arguments:
    ---------------------------------------------
    fileid -> is the file id of the gsheet document, it must exist or an
              error is printed.
    sheet  -> this is the string name of the sheet or the sheet id
    url    -> this is the full url, including fileid and sheet id
    cell   -> A1 or B77 and so forth
    values -> Path to existing file containing specific JSON (data rectangle of values)
    mnetadata   -> Path to existing file containing specific JSON (data rectangle of metadata)

    """
