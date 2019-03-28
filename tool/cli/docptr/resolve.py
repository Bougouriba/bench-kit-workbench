import click
from cli import common_table_output_options,pass_application
from . import pass_docptr_util


@click.command('resolve')
@click.option('--using','using_',
            required=True,
            help='what to resolve')
@common_table_output_options
@pass_docptr_util
@pass_application
def cli(app,util,using_,**kwargs):
    """
    Resolve a model definition
    """
    result = util.dpm.resolveUsing(using_)
    if result != None or len(result) > 0:
        result = [x.jsonify() for x in result]
    app.output.dump_dictlist(result,"No docpointers found")
