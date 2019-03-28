import click
from cli import JsonData,pass_application
from . import pass_config_util

@click.command('load', short_help='Replace the existing configuration with another.')
@click.option('--new-config','new_config_',
    required=True,
    type=JsonData(),
    default="-",
    help='input data'
    )
@pass_config_util
@pass_application
def cli(app,config_util,new_config_):
    """
    Replace the existing configuration with another
    """
    app.config.data = new_config_
    app.config.save()
