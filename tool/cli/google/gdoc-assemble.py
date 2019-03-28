import click
from cli import GoogleDriveFile


@click.command('gdoc-assemble', short_help='Assemble a google doc from a structure.')
@click.option("--doc","fileid_",
    type=GoogleDriveFile(),
    required=True,
    help="FileId or url of existing file")
@click.option("--from","from_",
    help="docptr, when we get around to those")
@click.pass_obj
def cli(google_cli_context, fileid_,from_):
    """
    Given a JSON file in the format provided by gdoc-desctructure

    """
