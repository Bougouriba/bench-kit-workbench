import click
from cli import SubCommand,pass_application

from json import JSONEncoder

from .__sheet_model import *

class XlateKumuUtilities(object):
    """
    This is available within all xlate commands
    """
    def __init__(self):
        pass

    class LocalEncoder(JSONEncoder):
        def default(self, o):
            if type(o) in [list,set]:
                return list(o)
            return o.__dict__

    def jsonify(self,data):
        return json.dumps(data,indent=4,sort_keys=True,cls=XlateKumuUtilities.LocalEncoder)

pass_xlate_kumu_util = click.make_pass_decorator(XlateKumuUtilities)
class XlateKumuCLI(SubCommand):
    cmd_context = "xlate.kumu"

@click.command(cls=XlateKumuCLI)
@pass_application
@click.pass_context
def cli(ctx,app):
    """Translate between workspace resident JSON data models."""
    ctx.obj = XlateKumuUtilities()
