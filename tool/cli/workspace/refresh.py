import click
import os
from cli import pass_application
from . import pass_workspace_util

@click.command('refresh')
@pass_workspace_util
@pass_application
def cli(app,util,**kwargs):
    """
    Update external documents in the workspace from external sources.
    """
    click.echo("Not yet implemented")
