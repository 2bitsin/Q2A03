from IsaParsed  import IsaParsed
from SvWriter   import SvWriter
from Utils      import Utils
import re

class ProcessIsa:

  def __init__(self):
    return

  def write_conditions(self, isa_data, sv_writer):   
    for name, opcodes in isa_data.am_table.items():
      hex_opcodes = Utils.opcodes_to_hex(opcodes)
      wire_name = Utils.strip_name(name)
      sv_writer.write_line('wire am_%-12s = (curr_ir inside { %s });' % (wire_name, ', '.join(hex_opcodes)))

    sv_writer.write_line('')

    for name, opcodes in isa_data.op_table.items():
      hex_opcodes = Utils.opcodes_to_hex(opcodes)
      wire_name = Utils.strip_name(name.lower())
      sv_writer.write_line('wire op_%-12s = (curr_ir inside { %s });' % (wire_name, ', '.join(hex_opcodes)))

  def main(self):    
    writer = SvWriter('ver/isa.sv')
    writer.indent()
    data = IsaParsed ('data/ISA.csv')
    self.write_conditions(data, writer)
  

p = ProcessIsa()

p.main()