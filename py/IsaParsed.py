import csv

class IsaParsed:
  def __init__(self, isaname):

    with open(isaname, 'r') as csvfile:
      self.isa_table = list(r for r in csv.reader(csvfile, delimiter=',', quotechar='"'))[1:]

    self.isa_table = sorted(self.isa_table, key=lambda item: item[0])
    self.isa_table = list((int(r[0], 16), r[1], r[2]) for r in self.isa_table)

    am_table = {}
    op_table = {}

    for row in self.isa_table:
      if not (row[1] in am_table):
        am_table[row[1]] = list()
      am_table[row[1]].append(row[0])

    for row in self.isa_table:
      if not (row[2] in op_table):
        op_table[row[2]] = list()
      op_table[row[2]].append(row[0])
      
    self.am_table = am_table
    self.op_table = op_table