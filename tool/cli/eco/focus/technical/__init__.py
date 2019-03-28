import os
import sys
import click
from cli import Context,SubCommand,pass_context,CONTEXT_SETTINGS

class LogCLI(SubCommand):
    def get_cmd_context(self):
        return "Log"

@click.command(cls=LogCLI, context_settings=CONTEXT_SETTINGS)
@pass_context
def cli(ctx, path):
    """
    Manipulate information about the technical aspects of SSI.
    """
