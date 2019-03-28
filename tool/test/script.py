import unittest
from cli import run_script

class TestScript(unittest.TestCase):

    def test_simple_script(self):
        result = run_script("")
        assert result.exit_code == 0

    def test_multi_line(self):
        results = run_script("""
        --help
        --help
        """)
        print(results)
        for result in results:
            assert result.exit_code == 0

    def test_array(self):
        results = run_script([
            "--help",
            "--help"
            ])
        for result in results:
            assert result.exit_code == 0

    def test_load_integrity_using_help(self):
        """Calls the --help function on every command"""
        results = run_script("""
        --help
        config --help
        config path --help
        config load --help
        config dump --help
        docptr --help
        docptr add --help
        docptr add google-doc --help
        docptr add google-file --help
        docptr add google-folder --help
        docptr add google-spreadsheet --help
        docptr add google-worksheet --help
        docptr add workspace-doc --help
        docptr tag --help
        docptr info --help
        docptr list --help
        docptr resolve --help
        docptr tag --help
        docptr tag add --help
        docptr tag list --help
        docptr tag remove --help
        docptr tag report --help
        google basic-download --help
        google basic-upload --help
        google drive-scan --help
        google gdoc-assemble  --help
        google gdoc-assert  --help
        google gdoc-destructure --help
        google gdoc-download  --help
        google login  --help
        google logout --help
        google model-assert --help
        google model-download --help
        google range-download --help
        google range-patch  --help
        google sheet-combine  --help
        google sheet-delete  --help
        google sheet-list --help
        """)
        index = 0
        for result in results:
            index = index + 1
            if result.exit_code != 0:
                raise Exception("Failed on result",index,result.exc_info)
