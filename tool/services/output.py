"""
Output control
"""
from prettytable import PrettyTable
import click
import json

class JsonOutput(object):

    def __init__(self):
        self.file = None
        self.indent = 2
        self.minify = False

    def save(self,defn):
        if self.file == None:
            raise Exception("Can not save json data to no-where")

        if self.minify:
            json.dump(defn.data,self.file,separators=(',',':'),sort_keys=True)
        else:
            json.dump(defn.data,self.file,indent=self.indent,sort_keys=True)

class DataDefinition(object):

    def __init__(self):
        self.data = None

class TableDefinition(DataDefinition):

    def __init__(self):
        super().__init__()
        self.height = None
        self.width = None
        self.headers = None

    def set_headers(self,headers):
        if self.data == None:
            self.headers = headers
            self.width = len(headers)
        else:
            if len(headers) != self.width:
                raise Exception("Headers to not match data width")

    def set_table_data_from_array(self,data):
        self.height = len(data)
        if self.width == None:
            max_width = 0
            for row in data:
                if len(row) > max_width:
                    max_width = len(row)
            self.width = max_width

        for row in data:
            if len(row) != self.width:
                raise Exception("Data is not a square table")

        self.data = data

    def extract_headers(self,data):
        """
        Extract headers from data
        """
        pass


    def set_table_data_from_dict_list(self,data):
        self.height = len(data)
        keys = set()
        for x in data:
            if type(x) == dict:
                for key in x.keys():
                    keys.add(key)
            else:
                for key in x.__dict__.keys():
                    keys.add(key)

        self.headers = list(keys)
        self.data = data


class CSVOutput(object):

    def __init__(self):
        self.file = None

    def save(self,data):
        pass

class XLSXOutput(object):

    def __init__(self):
        self.file = None

    def save(self,data):
        pass

class TableOutput(object):

    def __init__(self):
        self.reduce = False
        self.skip_data = False
        self.slugify = False
        self.col_removal = set()
        self.col_restriction = set()
        self.col_only = None
        self.col_sort_set = []


    def output(self,defn):
        x = PrettyTable()

        def obj_to_row(obj,headers):
            row_data = []
            dict_data = {}
            for key in headers:
                if type(obj) == dict:
                    target = obj
                else:
                    target = obj.__dict__
                if key in target:
                    row_data.append(target[key])
                    dict_data[key] = target[key]
                else:
                    row_data.append(None)
                    dict_data[key] = None
            return row_data,dict_data

        # process headers
        if self.col_restriction:
            headers = self.col_restriction
        else:
            if self.col_only != None:
                headers = set()
                headers.add(self.col_only)
            else:
                headers = defn.headers
        for col in list(self.col_removal):
            headers.remove(col)
        if len(headers) == 0:
            print("Nothing to display")
            return


        # reduce data if required
        raw_data = defn.data
        const_vals = {}
        if self.reduce:
            values = {k:set() for k in headers}
            for obj in raw_data:
                row_data,dict_data = obj_to_row(obj,headers)
                for key,value in dict_data.items():
                    values[key].add(str(value))

            counts = {k:len(v) for k,v in values.items()}
            for key,count in counts.items():
                if count == 1 :
                    const_vals[key] = list(values[key])[0]
                    headers.remove(key)

        headers = list(headers)
        headers.sort()
        self.width = len(headers)

        data = []
        if self.skip_data:
            raw_data = []
        for obj in raw_data:
            row_data,dict_data = obj_to_row(obj,headers)
            data.append(row_data)

        if self.col_only == None:
            x.field_names = headers
            for row in data:
                x.add_row(row)
            print(x)

            consts = list(const_vals.keys())
            consts.sort()
            for key in consts:
                if key in const_vals:
                    print("Constant: %s => %s" % (key,const_vals[key]))
        else:
            for row in data:
                print(row[0])

# common utilty clusters - output
class OutputControl(object):

    def __init__(self):
        self.quiet = False
        self.json = JsonOutput()
        self.csv = CSVOutput()
        self.xlsx = XLSXOutput()
        self.table = TableOutput()

        self.is_table = False
        self.model = None

    def set_table_data_from_array(self,data):
        self.is_table = True
        self.model = TableDefinition()
        raise Exception("Not Implemented")

    def set_table_data_from_dict_list(self,data):
        self.is_table = True
        self.model = TableDefinition()
        self.model.set_table_data_from_dict_list(data)

    def set_raw_data(self,data):
        self.is_table = False
        self.model = DataDefinition()
        self.model.data = data

    @property
    def _should_emit_json(self):
        return self.json.file != None

    @property
    def _should_emit_csv(self):
        return self.csv.file != None

    @property
    def _should_emit_xlsx(self):
        return self.xlsx.file != None

    @property
    def _should_emit_table(self):
        return not self.quiet

    def output(self):
        if self._should_emit_json:
            self.json.save(self.model)
        if self.is_table:
            if self._should_emit_csv:
                self.csv.save(self.model)
            if self._should_emit_xlsx:
                self.xlsx.save(self.model)
            if self._should_emit_table:
                self.table.output(self.model)

    def dump_dictlist(self,data,zeromsg=None):
        if not self.quiet:
            if (data == None or len(data) == 0) and zeromsg != None:
                click.echo(zeromsg)
                return
        self.set_table_data_from_dict_list(data)
        self.output()

    def save_json_data(self,data):
        raise Exception("Change to dump_json_data")
        self.set_raw_data(data)
        self.output()

    def dump_json_data(self,data):
        self.set_raw_data(data)
        self.output()
