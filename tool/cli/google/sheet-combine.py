import click
from cli import GoogleDriveFile

@click.command('sheet-combine', short_help='Combine multiple sheets into one.')
@click.option("--sheet","fileid_",
    type=GoogleDriveFile(),
    required=True,
    help="FileId or url of existing file")
@click.option("--using","using_",
    required=True,
    help="Named list of sheets defining a model")
@click.pass_obj
def cli(google_cli_context, fileid_,using_):
    """
    Combine one or more sheets, from one or more documents, into a single
    document which contains just those sheets.

    The target document must exist ahead of time, but any contents will be
    deleted.
    """
    sample = google_cli_context.config.resolveUsing(using_)
    if not sample:
        raise click.BadParameter("Can not find definition for %s" % using_)

    sample = [
        ('1uciOI6bhjUYn67HxSR3KmMyesnfpFeyrCtw-P9dyuq4','Sheet1'),
        ('1uciOI6bhjUYn67HxSR3KmMyesnfpFeyrCtw-P9dyuq4','Sheet2'),
        ('1uciOI6bhjUYn67HxSR3KmMyesnfpFeyrCtw-P9dyuq4','Sheet4')
    ]
    api = google_cli_context.sheets
    placeholder = api.empty_spreadsheet_and_return_placeholder(fileid_)

    target = api.open_sheet_by_id(fileid_)
    for id,name in sample:
        source_sheet = api.find_sheet_by_name(id,name)
        values = source_sheet.get_all_values()
        newsheet = target.add_worksheet(source_sheet.title,source_sheet.row_count,source_sheet.col_count)
        # TODO copy values

    target.del_worksheet(placeholder)
