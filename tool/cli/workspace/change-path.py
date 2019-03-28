import click
import os
from cli import pass_application
from . import pass_workspace_util

@click.command('change-path')
@click.option('--path',"path_",
    required=True,
    type=click.Path(
        dir_okay=True,
        file_okay=False,
        exists=True,
        readable=True,
        writable=True
        ),
    help='Source from which to load the data as JSON, - for stdin',
    )
@pass_workspace_util
@pass_application
def cli(app,util,path_,**kwargs):
    """
    Change workspace path in the configuration
    """
    old_path = app.config.workspace.changePath(path_)
