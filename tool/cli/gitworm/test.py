import click
import cli
from . import pass_util
from services.gitworm import GitUpdateContext

@click.command('test')
@pass_util
@cli.pass_application
def cli(app,util):
    """
    Dump information about gitworm
    """
    A = dict({
        'name':'A'
    })
    B = dict({
        'name':'B'
    })
    C = dict({
        'name':'C'
    })
    A['pointer']=B
    B['pointer']=B
    C['pointer']=B
    model = [A,B,C]
    update_context = GitUpdateContext("write1")

    util.worm.assert_model(update_context,model)

    newModel = util.worm.load_model()

    print([m['name'] for m in model])
    print([m['name'] for m in newModel])

    update_context = GitUpdateContext("write2")
    A['pointer']=C
    B['pointer']=None
    C['pointer']=A
    util.worm.assert_model(update_context,[B,C,A,A,B,C])

    newModel = util.worm.load_model()
    print([m['name'] for m in newModel])

    #print([id(m) for m in newModel])
