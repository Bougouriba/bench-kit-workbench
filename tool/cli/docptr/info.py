import click
import json
from cli import common_table_output_options,pass_application
from . import pass_docptr_util

@click.command('info')
#@common_json_output_options
@pass_docptr_util
@pass_application
def cli(app,util,**kwargs):
    """
    Dump info of docptr
    """
    if util.name == None:
        app.abort("Must provide --name option")

    if util.resolved:
        data = util.resolved.jsonify()
        print(json.dumps(data,indent=4,sort_keys=True))
    else:
        click.echo("No docptr named %s found" % util.name)
