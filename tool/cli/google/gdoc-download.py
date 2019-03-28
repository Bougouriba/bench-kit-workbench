import click
from cli import GoogleDriveFile

@click.command('gdoc-download', short_help='Download a google doc.')
@click.option("--doc","fileid_",
    type=GoogleDriveFile(),
    required=True,
    help="FileId or url of existing file")
@click.option("--save", "save_",
    type=click.File('wb',lazy=True,atomic=True),
     help="path to file, or - for stdout",
     required=False)
@click.option("--type","type_",
    default="text/html",
    help="type of data to download")
@click.option("--to","to_",
    help="docptr, when we get around to those")
@click.pass_obj
def cli(google_cli_context, fileid_,save_,type_,to_):
    """
    Download a google doc in a specified format.  Standard gdoc
    types can be used....  should we have aliases, like --type html
    or --type pdf?

    """

    # this will politely abort if both are used
    google_cli_context.allow_only_one(save_,to_,"Either --save or --to, not both")

    # this will politely abort if none is used
    google_cli_context.require_at_least_one(save_,to_,"Either --save or --to must be used")

    # fetch the file
    data = google_cli_context.drive.get_file_content(fileid_,mime_type=type_)

    # save it dependeing upon required parameters
    if save_:
        save_.write(data)
    else:
        raise Exception("Saving to docptrs not yet supported")
