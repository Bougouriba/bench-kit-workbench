import click
import cli
from .. import pass_util as pass_ecosystem_util

class ConsumeUtilities(object):
    """
    Load information into the KISIA model
    """
    def __init__(self,eco):
        self.eco = eco

pass_util = click.make_pass_decorator(ConsumeUtilities)
class SubCommand(cli.BaseCommand):
    pass
@click.command(cls=SubCommand)
@pass_ecosystem_util
@cli.pass_application
@click.pass_context
def cli(ctx,app,util):
    """
    Consume information from ecosystem endpoints.  Endpoint names are
    docptrs.....
        link to docptrs generic doc
        types : DID Service Endpoint, URL, Repo, Etc.....

    When you state "Consume <X>" you reach out to data source <X>, and engage
    an accessor, which uses *your* authority on the named services to
    access information.  This provides a real-world, up-to-date, active
    api bridge - which can be improved as identity-tech matures.

    The intent of a "consume" command is always an update to the data record,
    which is always attached to a context, and it is always based upon a query
    into the environment.



    We understand
    the query, in this case, to be both named and parametric.  The query
    execution then collects and reports the

    When you execute the consume command, you must provide an explanation
    as to why.
    which has whatever logic it needs and tries to integrate with
    the local authentication

    The result of a "consume" command is an update to the local
    data record, and as such, it requires a statement of "intention".

    Thinking in terms of a cheque from days of old, the "intention"
    is the specified words, and the attached log-records are the expression
    of that intent.  The signature upon the check is applied provided that
    the intent-calculation responds w/o error.

    Running the "tool eco consume" command should be considered like
    drawing upon a bank, but instead of currency offering a data-expression.
    Don't be quick to turn this into a "smart contract" - instead, just
    watch the ceremony....

    You first declare an intent to receive-information:
        <wrapper provider=X >
            you request the information from a <provider> of that information
            the provider responds (or errors)
        </wrapper>
        where wrapper

    \b
    Business Consume Tasks
      - manage information about a business
      - record the sponsoring of an event
      - manage records of business partnerships

    \b
    Legal Consume Tasks
      - manage information about recent legislation

    \b
    Technology Consume Tasks
      - manage information about a standard
      - manage information about a signficant repository
    """
    ctx.obj = ConsumeUtilities(util)
