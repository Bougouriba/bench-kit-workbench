import os
import sys
import click
import cli

class DocPtrUtilities(object):
    """
    This is available within all docptr commands
    """
    def __init__(self,dpm,name_):
        self.dpm = dpm
        self.name = name_
        self.resolved = None
        if name_ != None:
            self.resolved = self.dpm.resolveDocPtr(name_)


pass_docptr_util = click.make_pass_decorator(DocPtrUtilities)
class SubCommand(cli.BaseCommand):
    pass
@click.command(cls=SubCommand)
@click.option('--name','name_',
    help="name of the docptr in scope"
    )
@cli.pass_application
@click.pass_context
def cli(ctx,app,name_):
    """
    Manage DocPtrs, which describe a document which can be referenced
    using a short-form document name, and is either out there, on the
    internet (e.g. a google spreadsheet) or is local.  Docptrs maintain
    information about how to access each type of file.

    """
    # this is passed to every command in this section as the first
    # argument, it contains the support functions.
    ctx.obj = DocPtrUtilities(app.dpm,name_)

    # automatically login for everything except login/logout
    #if not ctx.invoked_subcommand in ['list']:
    #    if name_ == None:
    #        raise click.UsageError("--name is required")
