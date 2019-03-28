import os
import sys
import click
from cli import SubCommand,pass_application

class EcosystemCLI(SubCommand):
    cmd_context = "eco"

@click.command(cls=EcosystemCLI)
@pass_application
def cli(ctx):
    """
    Perform ecosystem level tasks.
    """
