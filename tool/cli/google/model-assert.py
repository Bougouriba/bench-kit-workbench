import click


@click.command('model-assert', short_help="Make google sheets look like the input.")
@click.option("--using","using_",
    help="Named list of sheets defining a model")
@click.option("--load","load_",
    help="path to file")
@click.option("--from","from_",
    help="docptr, when we get around to those")
@click.pass_obj
def cli(google_cli_context, using_,load_,from_):
    """
    Upload a JSON model, splitting it into documents and sheets.  Every
    document touched will be erased and only the identified sheets will be
    present.  Only values are uploaded, no conditional formating or formulas.
    """
    # this will politely abort if both are used
    google_cli_context.allow_only_one(save_,to_,"Either --load or --from, not both")

    # this will politely abort if none is used
    google_cli_context.require_at_least_one(save_,to_,"Either --load or --from must be used")

    sample = google_cli_context.config.resolveUsing(using_)
    if not sample:
        raise click.BadParameter("Can not find definition for %s" % using_)

    sample = [
        ('1uciOI6bhjUYn67HxSR3KmMyesnfpFeyrCtw-P9dyuq4','Sheet1'),
        ('1uciOI6bhjUYn67HxSR3KmMyesnfpFeyrCtw-P9dyuq4','Sheet2'),
        ('1uciOI6bhjUYn67HxSR3KmMyesnfpFeyrCtw-P9dyuq4','Sheet4')
    ]
