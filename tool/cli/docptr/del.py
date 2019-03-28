import click
from cli import pass_application
from . import pass_docptr_util

@click.command('del', short_help='Remove a document from consideration.')
@pass_docptr_util
@pass_application
def cli(app,util,**kwargs):
    """
	Simply report the current configuration used by default.
    """
    """Add docptrs"""
    if util.name == None:
        app.abort("--name is required")

    if util.resolved == None:
        app.abort("The docptr %s does not exist" % util.name)

    util.dpm.retire(util.resolved)
