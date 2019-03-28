import click
from cli import GoogleDriveFile


@click.command('gdoc-assert', short_help='Make a google doc look like a local doc')
@click.option("--doc","fileid_",
    type=GoogleDriveFile(),
    required=True,
    help="FileId or url of existing file")
@click.option("--load","load_",
    type=click.File('r'),
    help="path to file")
@click.option("--from","from_",
    help="docptr, when we get around to those")
@click.pass_obj
def cli(google_cli_context, fileid_,load_,from_):
    """
    Upload a google doc.
    """
    data = load_.read()
    google_cli_context.drive.replace_gdoc_from_html(fileid_,data)
