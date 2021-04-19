import re

class Utils:

  @staticmethod
  def strip_name(ss):
    #return re.sub(r'(?<!^)(?=[A-Z])', '_', re.sub(r'[^a-zA-Z]+', '', ss)).lower()
    return ss

  @staticmethod
  def opcodes_to_hex(opcodes):
    return list (('8\'h%02X' % o) for o in opcodes)
