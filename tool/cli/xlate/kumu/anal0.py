import click
from cli import JsonData,pass_application
from . import *

@click.command('extract-model-schema')
@click.option('--from','load_',
    required=True,
    type=JsonData(),
    default="-",
    help='input data'
    )
@pass_xlate_kumu_util
@pass_application
def cli(app,util,load_):
    """
    Extract Schema
    """

    submodel = SubModel('sovrin',load_)

    possible = list()
    for sheet in submodel.element_sheets():
        if 'type' not in sheet.column_sets.keys():
            print("Missing type on %s/%s" % (sheet.doc_name,sheet.name))
        else:
            types = sheet.column_sets['type']
            doc_name = sheet.doc_name
            sheet_name = sheet.name
            for type in types:
                if type == sheet_name:
                    #print("%s -/- %s" % (doc_name,sheet_name))
                    possible.append((doc_name,sheet_name))
                else:
                    #print("%s -/- %s -/- %s" % (doc_name,sheet_name,type))
                    possible.append((doc_name,sheet_name,type))

    term_map = dict()
    for p in possible:
        for x in list(p)[1:]:
            s = term_map.get(x,set())
            s.add(p)
            term_map[x] = s

    print(util.jsonify(term_map))
