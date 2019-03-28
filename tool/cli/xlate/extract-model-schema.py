import click
from cli import JsonData
import json
from slugify import slugify

@click.command('extract-model-schema')
@click.option('--from','load_',
    required=True,
    type=JsonData(),
    default="-",
    help='input data'
    )
@click.pass_obj
def cli(ctx,load_):
    """
    Extract Schema
    """

    data = list(load_)

    schema = {}

    for submodel in data:
        id = submodel[0]
        name = submodel[1]
        records = submodel[2]
        record = records[0]
        for key in record.keys():
            skey = slugify(key)
            if skey in schema:
                schema[skey].append(name)
            else:
                schema[skey]=[name]

    print(json.dumps(schema,sort_keys=True,indent=4))
