from SvWriter import SvWriter
import sys
import os
import math

class MakeRom: 
  def __init__(self):
    return 

  def to_bin8(self, value):
      
    return (
      ('1' if value & 0x80 != 0 else '0') +
      ('1' if value & 0x40 != 0 else '0') +
      ('1' if value & 0x20 != 0 else '0') +
      ('1' if value & 0x10 != 0 else '0') +
      ('1' if value & 0x08 != 0 else '0') +
      ('1' if value & 0x04 != 0 else '0') +
      ('1' if value & 0x02 != 0 else '0') +
      ('1' if value & 0x01 != 0 else '0'))
    
  def main(self, input_path, output_path):
    name = os.path.split(os.path.splitext(output_path)[0])[-1]
    file_size = os.stat(input_path).st_size
    addr_bits = int(math.ceil(math.log2(file_size)))

    sv_writer = SvWriter(output_path)    
    sv_writer.write_line('module %s (clock, rden, addr, data);' % (name))
    sv_writer.indent()
    sv_writer.write_line('input wire clock;')    
    sv_writer.write_line('input wire rden;')    
    sv_writer.write_line('input wire[%d:0] addr;' % (addr_bits - 1))
    sv_writer.write_line('output bit[7:0] data;')
    sv_writer.always(['posedge clock'])
    sv_writer.write_line('if (rden)')
    sv_writer.begin()
    sv_writer.case('addr')    
    with open(input_path, mode='rb') as input_bin:      
      for address in range(0, file_size):
        bytes = input_bin.read(1)
        sv_writer.write_line('%d\'h%08X : data <= 8\'b%s ;' % (addr_bits, address, self.to_bin8(bytes[0])))
        address = address + 1
    sv_writer.endcase()
    sv_writer.end()
    sv_writer.unindent()
    sv_writer.write_line('endmodule')

print("Generating ROM ...")
runner = MakeRom()
#runner.main("data/font8x16.bin", "ver/font8x16.sv")
#runner.main("data/screen0.bin", "ver/screen0.sv")
runner.main("asm/test.bin", "ver/testrom.sv")
