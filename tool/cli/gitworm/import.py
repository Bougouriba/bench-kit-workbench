import click
import cli
from . import pass_util
import json
from services.gitworm import GitUpdateContext

@click.command('import')
@click.option("--load","input_",
    #required=True,
    type=cli.JsonData(),
    default="-",
    help="path to JSON file to import")
@click.option("--prune","prune_",
    is_flag=True,
    default=False,
    help="delete anything not in input")
@click.option("--message","commit_message_",
    required=True,
    help="path to file")
@pass_util
@cli.pass_application
def cli(app,util,input_,prune_,commit_message_,**kwargs):
    """
    Import from single json file and store it in gitworm.
    """
    update_context = GitUpdateContext(commit_message_)
    if prune_:
        util.worm.assert_model(update_context,input_)
    else:
        util.worm.merge_model(update_context,input_)
