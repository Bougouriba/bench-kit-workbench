"""
This is the main entry point for the application.

It defines a Parent Context object which defines the workspace, as well as
utility functions.
"""
import os
import sys
import click
import functools
import json
from services import Application
from services.output import OutputControl

from functools import update_wrapper

class OutputFile(click.File):
    def __init__(self):
        super().__init__('w',lazy=True,atomic=True)
        self.classification = None

    def convert(self, value, param, ctx):
        app = ctx.find_object(Application)
        self.classification = app.classifyPath(value)
        # pass None and std pipes through
        if value == None or value == '-':
            return super().convert(value,param,ctx)
        else:
            return super().convert(self.classification.absolute_path,param,ctx)

def pass_app_to_handler(f):
    def new_func(ctx,param,value):
        obj = ctx.find_object(Application)
        return f(obj, param,value)
    return update_wrapper(new_func, f)


class TagSetOption(click.ParamType):
    name = 'tag-set-option'

    def __init__(self):
        super().__init__()
        self.tags = set()

    def convert(self, value, param, ctx):
        if value != None:
            self.tags.add(slugify(value))
        return self.tags


def common_docptr_output_options(f,prefix):

    @pass_app_to_handler
    def handle_create_docptr(app,param,value):
        pass

    @pass_app_to_handler
    def handle_tag_docptr(app,param,value):
        pass

    prefix = prefix + "-dp"
    options = [
        click.option(prefix+"-create",
            is_flag=True,
            callback=handle_create_docptr,
            help='Create docptr if required',
            ),
        click.option(prefix+"-tag",
            required=False,
            type=TagSetOption(),
            #multiple=True,
            callback=handle_tag_docptr,
            help='Tag associated docptr thusly',
            ),
        ]
    return functools.reduce(lambda x, opt: opt(x), options, f)


def common_json_output_options(f):

    @pass_app_to_handler
    def handle_json_file_option(app,param,value):
        app.output.json.file = value

    @pass_app_to_handler
    def handle_json_indent_option(app,param,value):
        app.output.json.indent = value

    @pass_app_to_handler
    def handle_json_minify_option(app,param,value):
        app.output.json.minify = value

    options = [
        click.option('--json',
            required=False,
            type=OutputFile(),
            expose_value=False,
            callback=handle_json_file_option,
            help='Path to which to save the data as JSON, - for stdout',
            ),
        click.option('--json-indent',
            required=False,
            type=click.INT,
            expose_value=False,
            default=4,
            callback=handle_json_indent_option,
            help='How much to indent formatted json',
            ),
        click.option('--json-minify',
            required=False,
            is_flag=True,
            callback=handle_json_minify_option,
            help='Should the data be minified',
            )
        ]

    return functools.reduce(lambda x, opt: opt(x), options,
        common_docptr_output_options(f,'--json'))

def common_csv_output_options(f):

    @pass_app_to_handler
    def handle_csv_file_option(app,param,value):
        app.output.csv.file = value

    options = [
        click.option('--csv',
            required=False,
            type=OutputFile(),
            expose_value=False,
            callback=handle_csv_file_option,
            help='Path to which to save the data as csv, - for stdout',
            )
        ]

    return functools.reduce(lambda x, opt: opt(x), options,
            common_docptr_output_options(f,'--csv'))


def common_xlsx_output_options(f):

    @pass_app_to_handler
    def handle_xlsx_file_option(app,param,value):
        app.output.xlsx.file = value

    options = [
        click.option('--xlsx',
            required=False,
            type=OutputFile(),
            expose_value=False,
            callback=handle_xlsx_file_option,
            help='Path to which to save the data as xlsx, - for stdout',
            )
        ]

    return functools.reduce(lambda x, opt: opt(x), options,
            common_docptr_output_options(f,'--xlsx'))

def common_table_output_options(f):
    """
    when @common_list_options is used, ctx.outputControl is
    set to this value.
    """

    @pass_app_to_handler
    def handle_quiet_option(app,param,value):
        app.output.quiet = value

    @pass_app_to_handler
    def handle_table_reduce_option(app,param,value):
        app.output.table.reduce = value

    @pass_app_to_handler
    def handle_table_skip_data_option(app,param,value):
        app.output.table.skip_data = value

    @pass_app_to_handler
    def handle_table_list_option(app,param,value):
        app.output.table.col_only = value

    @pass_app_to_handler
    def handle_table_col_option(app,param,value):
        if value is not None:
            for val in value:
                if "," in val:
                    for v in [x.strip() for x in val.split(",")]:
                        app.output.table.col_restriction.add(v)
                else:
                    app.output.table.col_restriction.add(val)

    @pass_app_to_handler
    def handle_table_col_remove_option(app,param,value):
        if value is not None:
            app.output.table.col_removal.update(value)

    @pass_app_to_handler
    def handle_table_sort_option(app,param,value):
        if value is not None:
            app.output.table.col_sort_set.append(value)

    @pass_app_to_handler
    def handle_table_slugify_option(app,param,value):
        app.output.table.slugify = value


    options = [
        click.option('--quiet',
                    required=False,
                    default=False,
                    is_flag=True,
                    expose_value=False,
                    callback=handle_quiet_option,
                    help='Do not display pretty table'
                    ),
        click.option('--table-reduce',
                    required=False,
                    is_flag=True,
                    callback=handle_table_reduce_option,
                    help='Reduce table contents.'),
        click.option('--table-skip-data',
                    required=False,
                    is_flag=True,
                    callback=handle_table_skip_data_option,
                    help='Print column headers only.'),
        click.option('--table-list',
                    multiple=False,
                    callback=handle_table_list_option,
                    help='Emit one col as a list (for shell work).'
                    ),
        click.option('--table-col',
                    multiple=True,
                    callback=handle_table_col_option,
                    help='Emit only these cols.'
                    ),
        click.option('--table-no-col',
                    multiple=True,
                    callback=handle_table_col_remove_option,
                    help='Exclude these cols.'
                    ),
        click.option('--table-sort',
                    multiple=True,
                    callback=handle_table_sort_option,
                    help='Sort by cols, in order'
                    ),
        click.option('--table-slugify',
                    callback=handle_table_slugify_option,
                    help='Slugify rows.'
                    )
    ]
    return functools.reduce(lambda x, opt: opt(x), options,
        common_json_output_options(
        common_csv_output_options(
        common_xlsx_output_options(f))))
