import click
import cli
from . import pass_util
import json

@click.command('export')
@click.option("--save","output_",
    #required=True,
    type=click.File('w'),
    default="-",
    help="path to JSON file to export")
@pass_util
@cli.pass_application
def cli(app,util,output_):
    """
    Export gitworm to a single json file.
    """
    json.dump(util.worm.load_model(),output_,indent=4,sort_keys=True)
