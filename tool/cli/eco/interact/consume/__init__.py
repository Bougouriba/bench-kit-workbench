import os
import sys
import click
from cli import SubCommand,pass_application

class ConsumeCLI(SubCommand):
    cmd_context="eco.interact.consume";

@click.command(cls=ConsumeCLI)
@pass_application
def cli(ctx, path):
    """
    Load information into the KISIA model
    """
