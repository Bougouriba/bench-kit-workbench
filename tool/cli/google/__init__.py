import os
import sys
import click
import re
from collections import namedtuple
from apis.google.drive import itis,GoogleDrive
from apis.google.sheets import GoogleSheets,GoogleCellRange
from apis.google import authorize_to_gapi
import cli

class GoogleUtilities(object):
    # can cache google-specific variables here - for example, the credentials
    # and the authorized driver and service

    def __init__(self,kisia_context):
        self.credentials = None
        self.sheets = None
        self.drive = None
        self.itis = itis
        self.config = kisia_context.config
        self.output = kisia_context.output
        self.abort = kisia_context.abort
        self.dpm = kisia_context.dpm

    def allow_only_one(self,*args):
        arglist = list(args)
        msg = arglist.pop()
        found = False
        for arg in arglist:
            if arg != None:
                if found:
                    raise Exception(msg)
                found = True

    def require_at_least_one(self,*args):
        arglist = list(args)
        msg = arglist.pop()
        found = False
        for arg in arglist:
            if arg != None:
                found = True
        if not found:
            raise Exception(msg)

pass_google_util = click.make_pass_decorator(GoogleUtilities)
class SubCommand(cli.BaseCommand):
    pass
@click.command(cls=SubCommand)
@cli.pass_application
@click.pass_context
def cli(ctx,app):
    """
    Read/Write Google Assets.

    \b
    These commands support scripted access to a pool of google
    assets, which include:
      * Google Auth Mgmt
      * Google Documents
        - support for transation to/from HTML
        - support for transation to/from JSON (internal structure)
      * Google Sheets
        - range editing (upload to replace, and download to JSON)
            - values
            - conditional-formatting
            - formulas
        - sheet/document management
            - delete a sheet
            - clear an entire document
            - copy one or more sheets, from one or more documents
              to a single document
        - json coupling
            - download one more more sheets, from one or more documents
              to a single JSON file
            - assert a document structure from a JSON file, making each
              identified document match the specification
      * Google Presentations (not yet supported)
      * Conventional Mime-Types
        - basic upload/download with simple mime-type handling

    \b
    These commands are integrated with the workspace configuration
    system.  We'll get to this
      - talk about docptrs
      - talk about resource sets
      - coupling of login w/ config & environment

    \b
    Internal JSON file formats
      - 2D JSON
        - Value Data
        - Conditional Formatting Data
        - Formula Data
      - JSON Google Sheet Data Model (multiple Document/Worksheet)
      - JSON Google Doc Structural Map

    """
    # this is passed to every command in this section as the first
    # argument, it contains the support functions.
    ctx.obj = GoogleUtilities(ctx.parent.obj)

    # these will come from the config, for now they are here only
    ctx.obj.secrets_file=ctx.parent.obj.config.getGoogleSecretsPath()
    ctx.obj.token_file=ctx.parent.obj.config.getGoogleTokenPath()

    if not os.path.exists(ctx.obj.secrets_file):
        raise click.UsageError("Unable to use google api, must obtain secrets file and put at %s" % ctx.obj.secrets_file)

    # automatically login for everything except login/logout
    if not ctx.invoked_subcommand in ['login','logout']:
        ctx.obj.credentials = authorize_to_gapi(
            secrets_file=ctx.obj.secrets_file,
            token_file=ctx.obj.token_file
        )
        ctx.obj.sheets = GoogleSheets(ctx.obj.credentials)
        ctx.obj.drive = GoogleDrive(ctx.obj.credentials)
