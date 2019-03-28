import os
import sys
import click
from cli import SubCommand,pass_application

class EcosystemFocusCLI(SubCommand):
    cmd_context = "eco.focus"

@click.command(cls=EcosystemFocusCLI)
@pass_application
def cli(ctx):
    """
    Perform focused ecosystem level tasks.  Focused tasks manpipulate
    the KISIA model through filters that help maintain the integraty
    of the global map.

    \b
    Business Focus Tasks
      - manage information about a business
      - record the sponsoring of an event
      - manage records of business partnerships

    \b
    Legal Focus Tasks
      - manage information about recent legislation

    \b
    Technology Focus Tasks
      - manage information about a standard
      - manage information about a signficant repository
    """
    pass
