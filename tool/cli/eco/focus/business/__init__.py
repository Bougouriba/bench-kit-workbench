import os
import sys
import click
from cli import Context,SubCommand,pass_context,CONTEXT_SETTINGS

class EcoBusinessCLI(SubCommand):
    cmd_context = "eco.focus.business"

@click.command(cls=EcoBusinessCLI, context_settings=CONTEXT_SETTINGS)
@pass_context
def cli(ctx, path):
    """
    Manipulate information about the business aspects of SSI.
    """
