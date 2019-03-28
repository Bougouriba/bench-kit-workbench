import click
from cli import GoogleDriveFile

@click.command('basic-upload', short_help='Simple upload command (for script support).')
@click.option("--folder","folder_",
    type=GoogleDriveFile(),
    help="FileId of existing file")
@click.option("--load","load_",
    type=click.File('rb'),
    help="path to file")
@click.option("--type","type_",
    required=True,
    default=None,
    help="type of data to upload")
@click.option("--from","from_",
    help="docptr, when we get around to those")
@click.pass_obj
def cli(google_cli_context, folder_,load_,from_,type_):
    """
    Upload a file.

    This is intended to serve as a primitive for use within scripts
    and to integrate basic file motion for supporting documents, other
    than sheets and google docs (or google slides, etc.)

    These are identified by a simple mime-type, which is guessed by
    file extension if not stated explicitly.
    """
    # this will politely abort if both are used
    google_cli_context.allow_only_one(save_,to_,"Either --load or --from, not both")

    # this will politely abort if none is used
    google_cli_context.require_at_least_one(save_,to_,"Either --load or --from must be used")
