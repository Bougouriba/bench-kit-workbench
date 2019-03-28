import os
import sys
import click
from cli import SubCommand,pass_application

class EcosystemModelCLI(SubCommand):
    cmd_context = "eco.model"

@click.command(cls=EcosystemModelCLI)
@pass_application
def cli(ctx):
    """
    Work directly with model elements
    """
