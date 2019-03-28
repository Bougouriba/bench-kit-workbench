import click
import re
from cli import GoogleDriveFile

@click.command('google-doc')
@click.option('--fileid','fileid',
    type=GoogleDriveFile(),
    required=True
    )
@click.pass_obj
def cli(ctx,fileid):
    """
    Add a google doc as a docptr
    """
    ctx.handle(GoogleDocPointer(ctx.util.name,fileid))
