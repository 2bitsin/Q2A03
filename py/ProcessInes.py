from InesData import InesData
from SvWriter import SvWriter
import os
import math
import re

class ProcessInes:

  port_list = [
    ('I_clock',     'wire',       'input' ),
    ('I_reset',     'wire',       'input' ),
    ('I_phy2',      'wire',       'input' ),

    ('I_prg_addr',  'wire[15:0]', 'input' ),
    ('I_prg_wren',  'wire',       'input' ),    
    ('I_prg_data',  'wire[7:0]',  'input' ),
    ('O_prg_data',  'logic[7:0]', 'output'), 

    ('I_chr_addr',  'wire[13:0]', 'input' ),
    ('I_chr_wren',  'wire',       'input' ),    
    ('I_chr_data',  'wire[7:0]',  'input' ),
    ('O_chr_data',  'logic[7:0]', 'output'),
    
    ('O_ciram_ce',  'logic',      'output'),
    ('O_ciram_a10', 'logic',      'output'),
    ('O_ciram_a11', 'logic',      'output'),
    ('O_irq',       'logic',      'output')
  ]

  def write_prologue(self, writer, name):

    writer.begin_with('module %s (%s);' % (name, ', '.join(x[0] for x in ProcessInes.port_list)))
    writer.write_line('')
    for port in ProcessInes.port_list:      
      writer.write_line('%-8s %-12s %-12s;' % (port[2],  port[1], port[0]))
    writer.write_line('')

  def write_epilogue(self, writer):
    writer.end_with('endmodule')

  def write_bytes(self, writer, name, data, per_row):
    writer.begin_with('%s = \'{' % (name))
    for offset in range(0, len(data), per_row):      
      writer.write_line(( ('%s,' if offset < len(data) - per_row else '%s') % (', '.join ((('8\'h%02X' % item) for item in data[offset: offset+per_row])))))

    writer.end_with('};')

  def write_initial(self, writer, ines):
    if ines.prg_size > 0:
      writer.write_line('bit[7:0] prg_bits [0:%u];' % (ines.prg_size - 1))    
      writer.write_line('')
    if ines.chr_size > 0:
      writer.write_line('bit[7:0] chr_bits [0:%u];' % (ines.chr_size - 1))
      writer.write_line('')
    writer.begin_with('initial begin')    
    if len(ines.prg_data) > 0 and ines.prg_size > 0:
      self.write_bytes(writer, 'prg_bits', ines.prg_data, 16)
    if len(ines.chr_data) > 0 and ines.chr_size > 0:
      self.write_bytes(writer, 'chr_bits', ines.chr_data, 16)
    writer.end_with('end')        

  def write_logic(self, writer, ines):

    writer.write_line('')
    if ines.mirroring == 2:
      writer.write_line('assign O_ciram_a10 = I_chr_addr[10];')
      writer.write_line('assign O_ciram_a11 = I_chr_addr[11];')
    elif ines.mirroring == 1:
      writer.write_line('assign O_ciram_a10 = I_chr_addr[10];')
      writer.write_line('assign O_ciram_a11 = 1\'b0;')
    elif ines.mirroring == 0:
      writer.write_line('assign O_ciram_a10 = I_chr_addr[11];')
      writer.write_line('assign O_ciram_a11 = 1\'b0;')
    writer.write_line('assign O_ciram_ce = 1\'b1;')
    writer.write_line('assign O_irq = 1\'b1;')
    writer.write_line('')

    writer.write_line('always @(posedge I_clock)')
    writer.begin()
    if ines.prg_size > 0:      
      writer.begin_with('if (I_prg_wren)')
      writer.write_line('prg_bits[%u\' (I_prg_addr)] <= I_prg_data;' % (math.log2 (ines.prg_size)))
      writer.end_with()
      writer.write_line('O_prg_data <= prg_bits[%u\' (I_prg_addr)];' % (math.log2 (ines.prg_size)))
      writer.write_line('')
      
    if ines.chr_size > 0:      
      writer.begin_with('if (I_chr_wren)')
      writer.write_line('chr_bits[%u\' (I_chr_addr)] <= I_chr_data;' % (math.log2 (ines.chr_size)))
      writer.end_with()
      writer.write_line('O_chr_data <= chr_bits[%u\' (I_chr_addr)];' % (math.log2 (ines.chr_size)))            
    writer.end()

    return

  def build_cart(self, in_file, out_file):
    print('Transforming %s => %s ...' % (in_file, out_file))
    name    = os.path.split (os.path.splitext(out_file)[0])[-1]    
    ines    = InesData(in_file)
    writer  = SvWriter(out_file)
    assert (ines.mapper_id == 0)
    assert (ines.prg_size <= 0x8000)
    assert (ines.chr_size <= 0x2000)
    self.write_prologue(writer, name)
    self.write_initial(writer, ines)
    self.write_logic(writer, ines)
    self.write_epilogue(writer)

for filename in os.listdir('assets/instr_test_v5/rom_singles/'):
  main = ProcessInes()
  name, _ = os.path.splitext(filename)
  name = re.sub(r"[^\w]+", '_', name)  
  main.build_cart('assets/instr_test_v5/rom_singles/%s' % (filename), 'ver/tests/test_%s.sv' % (name))

for filename in os.listdir('assets/games/'):
  main = ProcessInes()
  name, _ = os.path.splitext(filename)
  name = re.sub(r"[^\w]+", '_', name)  
  main.build_cart('assets/games/%s' % (filename), 'ver/games/%s.sv' % (name))

