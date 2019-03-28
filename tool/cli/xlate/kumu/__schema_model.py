import click
from cli import JsonData
import json
from slugify import slugify

class Attribute(object):

    def __init__(self,descriptor):
        self.required = set()
        self.definition = set()
        self.slug = slug

class ElementType(object):

    def __init__(self,d,s,r):
        self.attributes = d
        self.sheet_scope = s
        self.row_type = r

    def encounter_record():
        pass


class Schema(object):
    def __init__(self):
        self.element_types = {}
        self.attributes = {}


    def enounterElementType(self,row_num,record,document,sheet)
        return Schema.ElementType(document.name,sheet.name,)
