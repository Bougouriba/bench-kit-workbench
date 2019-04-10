"""
Support for ipython based development.
"""


from services.config import KISIA_Config
from apis.google import authorize_to_gapi
from apis.google.sheets import GoogleSheets
from apis.google.drive import GoogleDrive

class ipython_context(object):
    def __init__(self):
        self.config = KISIA_Config("/tmp/kisia");
        google_credentials = authorize_to_gapi(
            secrets_file=self.config.getGoogleSecretsPath(),
            token_file=self.config.getGoogleTokenPath()
            )
        self.sheets = GoogleSheets(google_credentials)
        self.drive = GoogleDrive(google_credentials)

config = None
drive = None
sheets = None

def initialize_interpreter_state():
    """
    Initialize the application environment and establish global variables
    to support ipython scripting.
    """
    global sheets
    global drive
    global config
    c = ipython_context()
    sheets = c.sheets
    config = c.config
    drive = c.drive
