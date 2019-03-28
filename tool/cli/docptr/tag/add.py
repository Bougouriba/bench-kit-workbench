import click
from cli import pass_application


@click.command('add')
@click.option('--name','name_',
    required=True,
    help="name of docptr")
@click.option('--tag','tag_',
    required=True,
    help="tag to add")
@pass_application
def cli(ctx,name_,tag_):
    """
    Add a tag to a docptr.
    """
    ptr = ctx.config.resolveDocPtr(name_)
    if not ptr:
        raise click.BadParameter("Can not find docptr %s" % name_)
    if not tag_ in ptr.tags:
        ptr.tags.append(tag_)
        ctx.config.assertDocPtr(ptr)
    ctx.config.save()
