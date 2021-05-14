from InesData import InesData
from SvWriter import SvWriter

class ProcessInes:

  port_list = [
    ('I_clock',     'wire',       'input' ),
    ('I_reset',     'wire',       'input' ),
    ('I_phi2',      'wire',       'input' ),

    ('I_prg_addr',  'wire[15:0]', 'input' ),
    ('I_prg_wren',  'wire',       'input' ),
    ('I_prg_rden',  'wire',       'input' ),
    ('I_prg_data',  'wire[7:0]',  'input' ),
    ('O_prg_data',  'logic[7:0]', 'output'), 

    ('I_chr_addr',  'wire[15:0]', 'input' ),
    ('I_chr_wren',  'wire',       'input' ),
    ('I_chr_rden',  'wire',       'input' ),
    ('I_chr_data',  'wire[7:0]',  'input' ),
    ('O_chr_data',  'logic[7:0]', 'output'),
    
    ('O_ciram_ce',  'logic',      'output'),
    ('O_ciram_a10', 'logic',      'output'),
    ('O_irq',       'logic',      'output')
  ]

  def write_prologue(self, writer):

    writer.begin_with('module (%s);' % (','.join(x[0] for x in ProcessInes.port_list)))
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

  def write_body(self, writer, ines):
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

  def build_cart(self, in_file, out_file):

    ines    = InesData(in_file)
    writer  = SvWriter(out_file)

    self.write_prologue(writer)
    self.write_body(writer, ines)
    self.write_epilogue(writer)

main = ProcessInes()
main.build_cart('assets/smb.nes', 'ver/cart_smb.sv')