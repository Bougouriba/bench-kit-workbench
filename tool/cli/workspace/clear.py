import click
import os
from cli import pass_application
from . import pass_workspace_util

@click.command('clear')
@pass_workspace_util
@pass_application
def cli(app,util,**kwargs):
    """
    Erase all workspace contents and workspace docptrs
    """
    click.echo("Not yet implemented")
