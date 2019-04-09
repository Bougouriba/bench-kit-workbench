import os
import sys
import click
from cli import SubCommand,pass_application

class ProduceCLI(SubCommand):
    cmd_context="eco.interact.produce";

@click.command(cls=ProduceCLI)
@pass_application
def cli(ctx, path):
    """
    Publish information from the KISIA model
    """
