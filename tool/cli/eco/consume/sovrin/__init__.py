import os
import sys
import click
from cli import Context,SubCommand,pass_context,CONTEXT_SETTINGS

class EcosystemInteractConsumeSovrinCLI(SubCommand):
    cmd_context = "eco.interact.consume.Sovrin"

@click.command(cls=EcosystemInteractConsumeSovrinCLI, context_settings=CONTEXT_SETTINGS)
@pass_context
def cli(ctx, path):
    """
    Sovrin
    """
