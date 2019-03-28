import os
import sys
import click
from cli import SubCommand,pass_application

class EcosystemModelEventsCLI(SubCommand):
    cmd_context = "eco.model.events"

@click.command(cls=EcosystemModelEventsCLI)
@pass_application
def cli(ctx, path):
    """
    Events are things that happen.
    """
