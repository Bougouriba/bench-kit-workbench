import click
from cli import GoogleDriveFile

@click.command('basic-download', short_help='Simple download command (for script support).')
@click.option("--doc","fileid_",
    type=GoogleDriveFile(),
    required=True,
    help="FileId or url of existing file")
@click.option("--save", "save_",
    type=click.File('w',lazy=True,atomic=True),
     help="path to file, or - for stdout",
     required=True)
@click.option("--type","type_",
    default="text/html",
    help="type of data to download")
@click.option("--to","to_",
    help="docptr, when we get around to those")
@click.pass_obj
def cli(google_cli_context, fileid_,save_,type_,to_):
    """
    Download a file.

    This is intended to serve as a primitive for use within scripts
    and to integrate basic file motion for supporting documents, other
    than sheets and google docs (or google slides, etc.)

    These are identified by a simple mime-type, which is guessed by
    file extension if not stated explicitly.
    """
    # this will politely abort if both are used
    google_cli_context.allow_only_one(save_,to_,"Either --save or --to, not both")

    # this will politely abort if none is used
    google_cli_context.require_at_least_one(save_,to_,"Either --save or --to must be used")


    data = google_cli_context.drive.get_file_content(fileid_,mime_type=type)
    save.write(data)
