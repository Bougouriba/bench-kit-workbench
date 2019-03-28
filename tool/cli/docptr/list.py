import click
from cli import common_table_output_options,pass_application
from . import pass_docptr_util

@click.command('list', short_help='List all docptrs.')
@click.option('--include','include_',
    required=False,
    default='active-only',
    type=click.Choice(['all', 'retired-only','active-only']),
    help='Include Only Retired or All')
@click.option('--type','type_',
    help="Type to include"
    )
@common_table_output_options
@pass_docptr_util
@pass_application
def cli(app,util,include_,type_,**kwargs):
    """
    Report list of document pointers in various formats and apply various
    filters.
    """
    if include_ == 'all':
        data = app.dpm.listActiveDocPtrs() + app.dpm.listRetiredDocPtrs()
    else:
        if include_ == 'active-only':
            data = app.dpm.listActiveDocPtrs()
        else:
            data = app.dpm.listRetiredDocPtrs()
    data = list(data)
    if type_ != None:
        data = list(filter(lambda x: x.typecode==type_,data))
    data = list(map(lambda x: x.jsonify(),data))
    app.output.dump_dictlist(data,"No docpointers found")
