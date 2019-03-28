import json
from slugify import slugify

class Sheet(object):
    EMPTY              = 0
    ELEMENT            = 1
    ELEMENT_EXTENSION  = 2
    CONNECTION         = 3
    OTHER              = 4
    def __init__(self,document,sheet_name,records):
        self.doc_id = document.id
        self.doc_name = document.name
        self.name = sheet_name

        self.col_slug_to_original_name_map = {}

        self.type = None
        self.records = None
        self.column_vectors = {}
        self.column_sets = {}
        self.warnings = []
        if records == None or len(records) == 0:
            self.type = Sheet.EMPTY
            self.records = None
        else:
            example_record = records[0]
            for column_name in example_record.keys():
                column_slug = slugify(column_name)
                self.col_slug_to_original_name_map[column_slug] = column_name
            self.records = records

            for record in records:
                for column_name,value in list(example_record.items()):
                    column_slug = slugify(column_name)
                    if not column_slug in self.column_vectors.keys():
                        self.column_vectors[column_slug] = list()
                        self.column_sets[column_slug] = set()
                    col_vec = self.column_vectors[column_slug]
                    col_set = self.column_sets[column_slug]
                    if str(value).strip() == "":
                        value = None
                    col_vec.append(value)
                    col_set.add(value)

            row_id = 1
            for record in records:
                record['__row_id'] = row_id
                row_id += 1

            if 'from' in self.col_slugs or 'to' in self.col_slugs:
                self.type = Sheet.CONNECTION
                if 'to' not in self.col_slugs:
                    self.warning("Connection sheet missing 'to' column")
                if 'from' not in self.col_slugs:
                    self.warning("Connection sheet missing 'from' column")
            else:
                if 'label' in self.col_slugs:
                    if 'type' in self.col_slugs:
                        self.type = Sheet.ELEMENT
                    else:
                        self.type = Sheet.ELEMENT_EXTENSION
                else:
                    self.type = Sheet.OTHER

        self.ignored = "(ignore)" in sheet_name

    def warnings(self,msg,*args):
        msg = "%s/%s : %s" % (self.document.name,self.name,msg)
        print(msg,*args)
        self.warnings.append(msg % args)

    @property
    def empty(self):
        return self.type == Sheet.EMPTY

    @property
    def col_slugs(self):
        return self.col_slug_to_original_name_map.keys()

    @property
    def original_col_keys(self):
        return self.col_slug_to_original_name_map.values()


class Document(object):
    def __init__(self,name,id):
        self.name = name
        self.id = id

        self.sheet_map = {}

    def encounter_sheet(self,sheet_name,records):
        sheet = Sheet(self,sheet_name,records)
        self.sheet_map[sheet_name] = sheet
        return sheet

    @property
    def sheet_names(self):
        return self.sheet_map.keys()
    @property
    def sheets(self):
        return self.sheet_map.values()

    def element_sheets(self,include_ignored=False,include_empty=False):
        return list(filter(lambda x: (include_ignored or not x.ignored) and (include_empty or not x.empty) and (x.type in [Sheet.ELEMENT]),self.sheets))

    def element_and_element_extension_sheets(self,include_ignored=False,include_empty=False):
        return list(filter(lambda x: (include_ignored or not x.ignored) and (include_empty or not x.empty) and (x.type in [Sheet.ELEMENT, Sheet.ELEMENT_EXTENSION]),self.sheets))

    def connection_sheets(self,include_ignored=False,include_empty=False):
        return list(filter(lambda x: (include_ignored or not x.ignored) and (include_empty or not x.empty) and x.type in [Sheet.CONNECTION],self.sheets))

class Descriptor(object):
    def __init__(self,data):
        self.doc_id = data['doc_id']
        self.doc_name = data['doc_name']
        self.records = data['records']
        self.sheet_name = data['sheet_name']

class SubModel(object):

    # name is the docptr tag
    def __init__(self,name_tag,input):
        self.name_tag = name_tag

        # map of document names -> Document
        self.document_name_map = {}
        self.document_id_map = {}

        for x in input:
            self.encounter_sheet_descriptor(Descriptor(x))

    def encounter_sheet_descriptor(self,descriptor):
        if descriptor.doc_name in self.document_name_map:
            doc = self.document_name_map[descriptor.doc_name]
        else:
            doc = Document(descriptor.doc_name,descriptor.doc_id)
            self.document_name_map[doc.name] = doc

        self.document_id_map[doc.id] = doc

        doc.encounter_sheet(descriptor.sheet_name,descriptor.records)

    @property
    def document_names(self):
        return self.document_name_map.keys()
    @property
    def document_ids(self):
        return self.document_id_map.keys()
    @property
    def documents(self):
        return self.document_name_map.values()

    def element_sheets(self,include_ignored=False,include_empty=False):
        result = list()
        for doc in self.documents:
            result.extend(list(doc.element_sheets(include_ignored=include_ignored,include_empty=include_empty)))
        if len(result) == 0:
            return None
        return result

    def element_and_element_extension_sheets(self,include_ignored=False,include_empty=False):
        result = list()
        for doc in self.documents:
            result.extend(list(doc.element_and_element_extension_sheets(include_ignored=include_ignored,include_empty=include_empty)))
        if len(result) == 0:
            return None
        return result

    def connection_sheets(self,include_ignored=False,include_empty=False):
        result = list()
        for doc in self.documents:
            result.extend(list(doc.connection_sheets(include_ignored=include_ignored,include_empty=include_empty)))
        if len(result) == 0:
            return None
        return result
