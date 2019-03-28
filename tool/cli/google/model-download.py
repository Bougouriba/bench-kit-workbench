import click
import gspread
import json
import traceback
from cli import common_json_output_options, pass_application
from . import pass_google_util

@click.command('model-download', short_help='Sheet model download.')
@click.option("--using","using_",
    required=True,
    help="Named list of sheets defining a model")
@common_json_output_options
@pass_google_util
@pass_application
def cli(app,util, using_,**kwargs):
    """
    Download one or more sheets, from one or more documents, and combine
    them into a single JSON file format.  Only values are downloaded.
    """
    #
    ## this will politely abort if both are used
    #util.allow_only_one(save_,to_,"Either --save or --to, not both")
    #
    ## this will politely abort if none is used
    #util.require_at_least_one(save_,to_,"Either --save or --to must be used")
    #

    model_sheets = app.dpm.resolveUsing(using_)
    if not model_sheets:
        raise click.BadParameter("Can not find definition for %s" % using_)

    data = []
    for sheet in model_sheets:
        if sheet.typecode == 'gworksheet':
            fileid = sheet.document_id
            sheetname = sheet.sheet_key
            try:
                values = util.sheets.get_all_records(fileid,sheetname)
                print("Loaded:",sheet.document_name,":",sheetname)
                data.append(dict(
                    doc_id = fileid,
                    doc_name = sheet.document_name,
                    sheet_name = sheetname,
                    records = values
                    ))
            except IndexError:
                click.echo("No Data in %s:%s" % (sheet.document_name,sheetname))
            except gspread.exceptions.WorksheetNotFound:
                app.abort("Unable to process sheet %s:%s, worksheet not found" % (fileid,sheetname))
            except Exception as E:
                traceback.print_exc()
                app.abort("Unable to process sheet %s:%s, reason = %s" % (fileid,sheetname,E))

    app.output.dump_json_data(data)
