import click
from cli import GoogleDriveFile
from apis.google.docptr import GoogleDrivePointer

@click.command('google-file')
@click.option('--fileid','fileid',
    type=GoogleDriveFile(),
    required=True
    )
@click.option('--mime-type','mimetype',
    required=True
    )
@click.pass_obj
def cli(ctx,fileid,mimetype):
    """
    Add an arbitary file (not gdoc or gsheet)
    """
    ctx.handle(GoogleDrivePointer(ctx.util.name,fileid,mimetype))
