import os
import sys
import click
from cli import SubCommand,pass_application

class EcosystemInteractCLI(SubCommand):
    cmd_context = "eco.interact"

@click.command(cls=EcosystemInteractCLI)
@pass_application
def cli(ctx):
    """
    Produce and consume information from well known systems.
    """
