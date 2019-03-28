import click
from cli import JsonData,pass_application
from . import pass_config_util


@click.command('path', short_help='Report the current configuration directory.')
@pass_config_util
@pass_application
def cli(app,config_util):
    """
    Report the current configuration directory
    """
    print(app.config.config_path)
