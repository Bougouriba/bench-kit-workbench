import os
import sys
import click
from cli import Context,SubCommand,pass_context,CONTEXT_SETTINGS

class EcosystemInteractConsumeSSIDCLI(SubCommand):
    cmd_context = "eco.interact.consume.SSID"

@click.command(cls=EcosystemInteractConsumeSSIDCLI, context_settings=CONTEXT_SETTINGS)
@pass_context
def cli(ctx, path):
    """
    SelfSovereign.ID
    """
