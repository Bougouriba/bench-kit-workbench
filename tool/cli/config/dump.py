import click
import json
from cli import pass_application
from . import pass_config_util


@click.command('dump', short_help='Save the current snapshot as JSON.')
@click.option("--save", "save_",
    type=click.File('w',lazy=True,atomic=True),
     help="path to file, or - for stdout",
     default="-",
     required=False)
@pass_config_util
@pass_application
def cli(app,config_util,save_):
    """
    """
    json.dump(app.config.data,save_,indent=3,sort_keys=True)
