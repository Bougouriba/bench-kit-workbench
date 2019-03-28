import os
import sys
import click
import cli
from cli.docptr import pass_docptr_util

class DocPtrTagUtilities(object):
    """
    This is available within all docptr commands
    """
    def __init__(self,util):
        self.util = util

pass_docptrtag_util = click.make_pass_decorator(DocPtrTagUtilities)
class SubCommand(cli.BaseCommand):
    pass
@click.command(cls=SubCommand)
@pass_docptr_util
@cli.pass_application
@click.pass_context
def cli(ctx,app,util):
    """Manage Tags on DocPtrs"""
    ctx.obj = DocPtrTagUtilities(util)
