import click
from cli import common_table_output_options,pass_application
from . import pass_workspace_util

@click.command('docptrs', short_help='List all workspace docptrs.')
@common_table_output_options
@pass_workspace_util
@pass_application
def cli(app,util,**kwargs):
    """
    Report list of document pointers in various formats and apply various
    filters.
    """
    data = list(app.dpm.listActiveDocPtrs())
    data = list(filter(lambda x: x.typecode=="workspace-file",data))

    data = list(map(lambda x: x.jsonify(),data))
    app.output.dump_dictlist(data,"No docpointers found")
