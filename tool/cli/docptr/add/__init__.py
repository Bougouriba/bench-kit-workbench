import os
import sys
import click
import cli
from .. import pass_docptr_util

class DocPtrAddUtilities(object):
    """
    This is available within all docptr commands
    """
    def __init__(self,util,update,tags):
        self.util = util
        self.update = update
        if tags == None:
            tags = ['all']
        self.tags = tags

    def handle(self,newptr):
        newptr.tags = self.tags
        if self.util.resolved != None:
            if self.util.update:
                self.util.dpm.assertDocPtr(newptr)
            else:
                click.echo("The docptr %s already exists, and --update was not provided")
        else:
            self.util.dpm.assertDocPtr(newptr)


pass_docptradd_util = click.make_pass_decorator(DocPtrAddUtilities)
class SubCommand(cli.BaseCommand):
    pass
@click.command(cls=SubCommand)
@click.option('--update',"update_",
    is_flag=True,
    default=False,
    help="update an existing docptr"
    )
@click.option('--tag',"tags_",
    multiple=True,
    help="Initial tags to provide"
    )
@pass_docptr_util
@cli.pass_application
@click.pass_context
def cli(ctx,app,util,update_,tags_):
    """Add docptrs"""
    if util.name == None:
        click.UsageError("--name is required")

    ctx.obj = DocPtrAddUtilities(util,update_,tags_)
