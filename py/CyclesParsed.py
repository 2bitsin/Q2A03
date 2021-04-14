import csv

class CyclesParsed:

  def __init__(self, file_name):
    table = []
    with open(file_name) as csvfile:
      table = list(r for r in csv.reader(csvfile, delimiter=',', quotechar='"'))[1:]
      table = list((r[0].strip(), int(r[1], 10), r[2].strip(), r[3].strip(), r[4].strip()) for r in table)
    struct_data = {}
    for name, cycle, condition, target, value in table:      
      if not name in struct_data:
        struct_data[name] = {}
      if not cycle in struct_data[name]:
        struct_data[name][cycle] = []
      struct_data[name][cycle].append({
        'condition' :condition, 
        'target'    :target, 
        'value'     :value
      })
    self.table = struct_data
    return
