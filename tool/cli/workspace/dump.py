import click
import os
from cli import pass_application,common_json_output_options,JsonData
from . import pass_workspace_util

@click.command('dump')
@click.option('--from',"from_",
    required=True,
    type=JsonData(),
    help='Source from which to load the data as JSON, - for stdin',
    )
@common_json_output_options
@pass_workspace_util
@pass_application
def cli(app,util,from_,**kwargs):
    """
    Dump workspace document as json
    """
    data = from_
    app.output.dump_json_data(data)
