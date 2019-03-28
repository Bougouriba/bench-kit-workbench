"""
This is the main entry point for the application.

It defines a Parent Context object which defines the workspace, as well as
utility functions.
"""
import click
from services import Application
from . import SubCommand

# Documentation here http://click.palletsprojects.com/en/7.x/api/#click.Context
CONTEXT_SETTINGS = dict(
    auto_envvar_prefix='KT_'
    )

@click.command(cls=SubCommand, context_settings=CONTEXT_SETTINGS)
#TODO bind to ENV variable, default to ~/.config or some such
@click.option('--config-path',
                required=False,
                type=click.Path(
                    file_okay=False,
                    dir_okay=True,
                    writable=True,
                    resolve_path=True
                    ),
                help='Changes the configuration environment.')
@click.option('-v', '--verbose', is_flag=True,
              help='Enables verbose mode.')
@click.pass_context
def cli(ctx, verbose, config_path):
    """
    CLI utilities for interacting with the identity-tech ecosystem.
    """
    #print("AUTO COMPLETE?")
    ctx.obj = Application(ctx,verbose,config_path)
