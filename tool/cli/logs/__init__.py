import os
import sys
import click
from cli import SubCommand,pass_application

class LogCLI(SubCommand):
    cmd_context="logs"

@click.command(cls=LogCLI)
@pass_application
def cli(ctx, path):
    """
    View, export and clear semantic log data.
    """
