import click
from bs4 import BeautifulSoup
from cli import GoogleDriveFile


@click.command('gdoc-destruture', short_help='Break a google doc into text blobs.')
@click.option("--doc","fileid_",
    type=GoogleDriveFile(),
    required=True,
    help="FileId or url of existing file")
@click.option("--to","to_",
    help="docptr, when we get around to those")
@click.pass_obj
def cli(google_cli_context, fileid_,to_):
    """
    Analyze a gdoc and decompose it into a hierarchy of text blobs and store
    the result in a JSON file.
    """
    html = google_cli_context.drive.get_file_content(fileid_,mime_type='text/html')
    soup = BeautifulSoup(html, features='html.parser')
    # NOTE: css selectors in bs4: https://stackoverflow.com/questions/24801548
    strip = lambda string: string.strip('\xa0').replace('\xa0', ' ').strip()

    #TODO - the task here is to try to identify the heading structure and
    #organize the data as text blobs in a hierarchy - e.g. 1=blob1, 1.1=blob2
    #1.2=blob3,2=blob4,3=blob5,3.1=blob6
    print(soup.body)
