import re

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
      
      
