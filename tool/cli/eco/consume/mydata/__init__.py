import os
import sys
import click
from cli import Context,SubCommand,pass_context,CONTEXT_SETTINGS

class EcosystemInteractConsumeMyDataCLI(SubCommand):
    cmd_context = "eco.interact.consume.MyData"

@click.command(cls=EcosystemInteractConsumeMyDataCLI, context_settings=CONTEXT_SETTINGS)
@pass_context
def cli(ctx, path):
    """
    MyData
    """
