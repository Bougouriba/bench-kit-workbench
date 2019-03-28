import os
import sys
import click
from cli import SubCommand,pass_application

class EcosystemModelLegalCLI(SubCommand):
    cmd_context = "eco.model.legal"

@click.command(cls=EcosystemModelLegalCLI)
@pass_application
def cli(ctx, path):
    """
    Not sure how to decompose this...
    """
