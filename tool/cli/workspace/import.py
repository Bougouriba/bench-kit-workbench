import click
import os
from cli import pass_application
from . import pass_workspace_util

@click.command('info')
@click.option('--from',"from_",
    required=True,
    type=click.File(
        exists=True,
        readable=True
        ),
    help='Copy the data into the workspace',
    )
@click.option('--from-path',"from_path_",
    required=True,
    type=click.File(
        exists=True,
        readable=True
        ),
    help='Copy the data into the workspace',
    )
@click.option('--to-path',"to_path_",
    required=True,
    type=click.Path(exists=False),
    help='Target file in the workspace',
    )
@click.option('--as',"as_",
    required=True,
    type=click.STRING,
    help='Docptr',
    )
@pass_workspace_util
@pass_application
def cli(app,util,from_,from_path_,to_path_,as_,**kwargs):
    """
    Import file from path
    """
