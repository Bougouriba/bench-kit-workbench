import os
import sys
import click
from cli import Context,SubCommand,pass_context,CONTEXT_SETTINGS

class EcosystemInteractConsumePersonalDataCLI(SubCommand):
    cmd_context = "eco.interact.consume.pd"

@click.command(cls=EcosystemInteractConsumePersonalDataCLI, context_settings=CONTEXT_SETTINGS)
@pass_context
def cli(ctx, path):
    """
    personaldata.io
    """
