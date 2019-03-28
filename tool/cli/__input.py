"""
This is the main entry point for the application.

It defines a Parent Context object which defines the workspace, as well as
utility functions.
"""
import os
import sys
import click
import traceback
import functools
import json
from services import Application

# some utility option types - use with type=<type> in command definitions
class InputFileOption(click.File):
    """
    A file that is read-only, must exist, and contains valid JSON.  This
    also supports '-' as a filename for reading.
    """
    def __init__(self):
        super().__init__('r')
        self.classification = None

    def convert(self, value, param, ctx):
        app = ctx.find_object(Application)
        self.classification = app.classifyPath(value)
        # pass None and std pipes through
        if value == None or value == '-':
            return super().convert(value,param,ctx)
        else:
            return super().convert(self.classification.absolute_path,param,ctx)

    @property
    def abspath(self):
        if self.classification == None:
            return None
        return self.classification.absolute_path

# some utility option types - use with type=<type> in command definitions
class JsonData(InputFileOption):
    """
    A file that is read-only, must exist, and contains valid JSON.  This
    also supports '-' as a filename for reading.
    """
    def __init__(self):
        super().__init__()

    def convert(self, value, param, ctx):
        try:
            result = super().convert(value,param,ctx)
            return json.load(result)
        except ValueError as E:
            self.fail('%s does not contain valid JSON:%s' % (self.abspath,E), param, ctx)
