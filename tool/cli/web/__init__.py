import os
import sys
import click
from cli import SubCommand,pass_application

class FetchCLI(SubCommand):
    cmd_context="web"

@click.command(cls=FetchCLI)
@pass_application
def cli(ctx, path):
    """
    Work with non-API based web sources.
    """
