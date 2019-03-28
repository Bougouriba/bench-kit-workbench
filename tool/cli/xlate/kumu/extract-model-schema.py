import click
from cli import JsonData
import json
from slugify import slugify
from json import JSONEncoder

class LocalEncoder(JSONEncoder):
    def default(self, o):
        if type(o) in [list,set]:
            return list(o)
        return o.__dict__

#def from_json(json_object):
#    if 'fname' in json_object:
#        return Model(json_object['fname'])

def jsonify(data):
    return json.dumps(data,indent=4,sort_keys=True,cls=LocalEncoder)



class Attribute(object):
    def __init__(self,slug):
        self.occurances = set()
        self.slug = slug

    def form_alias(self,key,sheet):
        doc_name = sheet.document_name
        sheet_name = sheet.sheet_name
        return doc_name + "/" + sheet_name + "/" + key

    def encounter(self,key,sheet):
        fqan = self.form_alias(key,sheet)
        self.occurances.add(fqan)


class Schema(object):
    def __init__(self):
        self.element_types = {}
        self.attributes = {}

    class ElementType(object):

        def __init__(self,d,s,r):
            self.document_scope = d
            self.sheet_scope = s
            self.row_type = r

        def encounter_record(self,row_num,record,document,sheet):
            pass

class KumuModel(object):
    def __init__(self):
        self.elements = {}
        self.sheets = []
        self.ignored_sheets = []
        self.schema = Schema()

    def identify_sheets_in_model(self,data):
        for submodel in data:
            id = submodel['doc_id']
            doc_name = submodel['doc_name']
            sheet_name = submodel['sheet_name']
            records = submodel['records']
            sheet = Sheet(id,doc_name,sheet_name,records)
            if sheet.ignored:
                self.ignored_sheets.append(sheet)
            else:
                self.sheets.append(sheet)

    def encounter_element(self,document_scope,sheet_scope,vslug,row,sheet,record):
        type_key = document_scope +"/" + sheet_scope +"/"+ vslug;
        if type_key in self.schema.element_types.keys():
            element_type = self.schema.element_types[type_key]
        else:
            element_type = self.schema.ElementType(document_scope,sheet_scope,vslug)
            self.schema.element_types[type_key] = element_type

        element_type.encounter_record(row,record,None,None)

    def scan_for_elements(self):
        for sheet in self.sheets:
            if sheet.type == Sheet.ELEMENT:
                document_scope = slugify(sheet.document_name)
                sheet_scope = slugify(sheet.sheet_name)
                if 'type' not in sheet.column_map.keys():
                    print("Missing type column in ",sheet.document_name,sheet.sheet_name)
                else:
                    type_col = sheet.column_map['type']
                    row = 1
                    for record in sheet.data:
                        row = row + 1
                        type_value = record[type_col]
                        vslug = slugify(type_value)
                        self.encounter_element(document_scope,sheet_scope,vslug,row,sheet,record)


    def scan_for_attributes_and_build_column_map(self):
        # calculate union of all attributes
        for sheet in self.sheets:
            if len(sheet.data) == 0:
                print("Empty Records in ",sheet.document_name,sheet.sheet_name)
            else:
                record = sheet.data[0]
                for key in record.keys():
                    skey = slugify(key)
                    sheet.column_map[skey]=key
                    if skey in ['type','label','from','to'] :
                        if skey == 'label':
                            if sheet.type != Sheet.CONNECTION :
                                sheet.type = Sheet.ELEMENT
                        if skey in ['from','to']:
                            sheet.type = Sheet.CONNECTION
                    else:
                        if skey in self.schema.attributes.keys():
                            attr = self.schema.attributes[skey]
                        else:
                            attr = Attribute(skey)
                            self.schema.attributes[skey] = attr
                        sheet.attribute_map[key] = attr
                        attr.encounter(key,sheet)

        for sheet in self.sheets:
            cols = list(sheet.column_map.values())
            cols.sort()

            if len(cols) == 0:
                print("No columns in",sheet.document_name,sheet.sheet_name)
            if not 'type' in sheet.column_map:
                print("Missing type code in",sheet.document_name,sheet.sheet_name,cols)

class Sheet(object):
    ELEMENT = 1
    OTHER = 0
    CONNECTION = 2
    def __init__(self,docid,docname,sheet_name,data):
        self.docid = docid
        self.sheet_name = sheet_name
        self.document_name = docname
        self.data = data
        self.type = Sheet.OTHER
        self.ignored = "(ignore)" in sheet_name
        # maps column headers in sheet to slug names
        self.column_map = {}
        self.attribute_map = {}

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

    model = KumuModel()

    model.identify_sheets_in_model(load_)
    model.scan_for_attributes_and_build_column_map()
    model.scan_for_elements()

    print(jsonify(model.schema))
