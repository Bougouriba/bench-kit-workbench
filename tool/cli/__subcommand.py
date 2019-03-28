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
import pkgutil
## Python 3.0+
#from abc import ABCMeta, abstractmethod
import importlib

from services import Application

pass_application = click.make_pass_decorator(Application)

class BaseCommand(click.MultiCommand):

    def list_commands(self, ctx):
        rv = []
        mod = importlib.import_module(self.__class__.__module__)
        pkg = importlib.import_module(mod.__package__)
        folder = pkg.__path__[0]
        for filename in os.listdir(folder):
            # get files of the form <dir>/<command>.py
            if filename.endswith('.py') and \
               not filename.startswith('__'):
                rv.append(filename[:-3])
            # find directories
            if os.path.isdir(os.path.join(folder,filename)) and \
               not filename.startswith('__'):
                rv.append(filename)
        rv.sort()
        return rv

    def get_command(self, ctx, name):
        mod = importlib.import_module(self.__class__.__module__)
        pkg = importlib.import_module(mod.__package__)
        package_name = pkg.__name__ + "." + name
        try:
            mod = importlib.import_module(package_name)
            mod.cli.name = name
        except ModuleNotFoundError as E:
            raise click.UsageError("Command not found: %s" % package_name[4:])
        except ImportError as E:
            raise E
        #print("RETURNING",mod.cli.name,mod.cli)
        return mod.cli

####
class SubCommand(BaseCommand):
    pass
