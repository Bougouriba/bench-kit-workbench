"""
"""

from click.testing import CliRunner
import shlex
from cli.tool import cli as main_cli_function
import os

def run_script(str):
    try:
        with open("/tmp/output",'w+') as outfile:
            print("RUN_SCRIPT CALLED: [AAB] SRC=%s" % str,file=outfile)

        if type(str) == list:
            results = []
            for cmd in str:
                with open("/tmp/output",'w+') as outfile:
                    print("RUN_SCRIPT ARRAY CALLED: SRC=%s" % cmd,file=outfile)
                results.append(run_script(cmd))
            return results
        else:
            parts = str.strip().split("\n")
            if len(parts) == 1:
                runner = CliRunner()
                env = dict(os.environ)
                env['LC_ALL']='C.UTF-8'
                env['LANG']='C.UTF-8'
                result = runner.invoke(main_cli_function, shlex.split(str), env=env)
                with open("/tmp/output",'w+') as outfile:
                    print("RUN_SCRIPT RESULT: RESULT=%s" % result,result.output,file=outfile)
                return result
            else:
                return run_script(list([p.strip() for p in parts]))
    except Exception as E:
        with open("/tmp/output",'w+') as outfile:
                print("RUN_SCRIPT EXCEPTION=%s" % E,file=outfile)
        raise E
