from IsaParsed  import IsaParsed
from SvWriter   import SvWriter
import re

class Process:

  def __init__(self):
    return

  def strip_name(self, str):
    return re.sub(r'(?<!^)(?=[A-Z])', '_', re.sub(r'[^a-zA-Z]+', '', str)).lower()

  def opcodes_to_hex(self, opcodes):
    return list (('8\'h%02X' % o) for o in opcodes)

  def write_conditions(self, isa_data, sv_writer):   
    for name, opcodes in isa_data.am_table.items():
      hex_opcodes = self.opcodes_to_hex(opcodes)
      wire_name = self.strip_name(name)
      sv_writer.write_line('wire am_%-12s = (sync_ir inside { %s });' % (wire_name, ', '.join(hex_opcodes)))

    sv_writer.write_line('')

    for name, opcodes in isa_data.op_table.items():
      hex_opcodes = self.opcodes_to_hex(opcodes)
      wire_name = self.strip_name(name.lower())
      sv_writer.write_line('wire op_%-12s = (sync_ir inside { %s });' % (wire_name, ', '.join(hex_opcodes)))

  def main(self):    
    writer = SvWriter('ver/isa.sv')
    writer.indent()
    data = IsaParsed ('data/ISA.csv')
    self.write_conditions(data, writer)
  

p = Process()

p.main()