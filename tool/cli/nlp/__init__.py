import os
import sys
import click
from cli import SubCommand,pass_application

class NLPCLI(SubCommand):
    cmd_context="nlp"

@click.command(cls=NLPCLI)
@pass_application
def cli(ctx, path):
    """Apply NLP logic."""
