import re
import csv

class Utils:

  @staticmethod
  def strip_name(ss):
    #return re.sub(r'(?<!^)(?=[A-Z])', '_', re.sub(r'[^a-zA-Z]+', '', ss)).lower()
    return ss

  @staticmethod
  def int8_to_hex(o):
    return '8\'h%02X' % (o)

  @staticmethod
  def arr_int8_to_hex(lo):
    return list (Utils.int8_to_hex(o) for o in lo)

  @staticmethod
  def bin_to_hex(bin):      
    xs = '0123456789ABCDEF'  
    nibbles = (len(bin) + 3) >> 2
    bin = bin + (['0'] * (nibbles*4 - len(bin)))
    return '%d\'h%s' % (nibbles*4, ''.join(xs[int(''.join(bin[4*i:4*i+4]), 2)] for i in range(0, nibbles)))
    
  @staticmethod
  def parse_cycles(file_name):
    table = []
    with open(file_name) as csvfile:
      table = list(r for r in csv.reader(csvfile, delimiter=',', quotechar='"'))[1:]
      table = list(filter(lambda s: s[0] != '' and s[1] != '', table))
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
    return struct_data    
      
  @staticmethod
  def parse_isa(file_name):

    isa_table = []
    with open(file_name, 'r') as csvfile:
      isa_table = list(r for r in csv.reader(csvfile, delimiter=',', quotechar='"'))[1:]

    isa_table = sorted(isa_table, key=lambda item: item[0])
    isa_table = list((int(r[0], 16), r[1], r[2]) for r in isa_table)

    am_table = {}
    op_table = {}

    for row in isa_table:
      if not (row[1] in am_table):
        am_table[row[1]] = list()
      am_table[row[1]].append(row[0])

    for row in isa_table:
      if not (row[2] in op_table):
        op_table[row[2]] = list()
      op_table[row[2]].append(row[0])
      
    return (isa_table, op_table, am_table)

  @staticmethod
  def parse_defaults(file_name):    
    def_table = {}
    with open(file_name, 'r') as csvfile:
      tmp_table = list(csv.reader(csvfile, delimiter=',', quotechar='"'))[1:]
      for r in tmp_table:
        target = r[0].strip() 
        defval = r[1].strip() 
        reset  = r[2].strip()
        group  = r[3].strip()
        def_table[target] = (defval, reset, group)
    return def_table


