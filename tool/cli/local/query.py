import click
from cli import JsonData, pass_application
from . import pass_local_util
from gql import gql, Client
from gql.transport.requests import RequestsHTTPTransport


@click.command('query')
@click.option('--from','load_',
    required=False,
    type=JsonData(),
    help='input data'
    )
@pass_local_util
@pass_application
def cli(app,util,load_):
    """
    Run Test Query
    """
    _transport = RequestsHTTPTransport(
        url='http://localhost:4000/graphql',
        use_json=True,
    )

    client = Client(
        transport=_transport,
        fetch_schema_from_transport=True,
    )
    query = gql("""
    {
        hello
    }
    """)
    print(client.execute(query))
