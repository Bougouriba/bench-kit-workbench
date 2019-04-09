import os
import sys
import click
from cli import Context,SubCommand,pass_context,CONTEXT_SETTINGS

class EcosystemInteractConsumeDIFCLI(SubCommand):
    cmd_context = "eco.interact.consume.dif"

@click.command(cls=EcosystemInteractConsumeDIFCLI, context_settings=CONTEXT_SETTINGS)
@pass_context
def cli(ctx, path):
    """
    Decentralized Identity Foundation
    """
