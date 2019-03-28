import click
from cli import pass_application
from . import pass_docptr_util

@click.command('clear')
#@common_json_output_options
@pass_docptr_util
@pass_application
def cli(app,util,**kwargs):
    """
	Erase all docptrs.
    """
    ptrs = list(util.dpm.listActiveDocPtrs())
    for ptr in ptrs:
        util.dpm.retire(ptr)
