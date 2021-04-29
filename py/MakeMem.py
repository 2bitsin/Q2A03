import os
import math

def make_mem_xb(in_file_path, out_file_path):
  print ("Transforming %s to %s..." % (in_file_path, out_file_path))
  file_size = os.stat(in_file_path).st_size
  #addr_bits = int(math.ceil(math.log2(file_size)))

  with open(out_file_path, mode='w+') as output_hex, open(in_file_path, mode='rb') as input_bin:    

    for address in range(0, file_size):
      bytes = input_bin.read(1)
      output_hex.write('%02X ' % (bytes [0]))
      if address % 32 == 31:
        output_hex.write('\n')
      

make_mem_xb('data/8x8.bin',  'assets/8x8.mem')
make_mem_xb('data/8x16.bin', 'assets/8x16.mem')
make_mem_xb('data/vid.bin',  'assets/vid.mem')
      