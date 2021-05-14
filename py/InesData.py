import os

class InesData:  

  def __init__(self, in_file_path):  

    file_size = os.stat(in_file_path).st_size      

    self.mapper_id    = 0
    self.battery      = False
    self.mirroring    = 0
    self.prg_size     = 0    
    self.prg_data     = bytes()
    self.chr_size     = 0
    self.chr_data     = bytes()
    self.trainer_size = 0
    self.trainer_data = bytes()

    with open(in_file_path, mode='rb') as input_bin:    
      header = input_bin.read(16)

      assert header[0:4] == b'NES\x1a', "Invalid header!"

      self.trainer_size     = 512 if header[6] & 0x04 != 0 else 0
      self.prg_size         = header[4] * 0x4000
      self.chr_size         = header[5] * 0x2000
      self.mapper_id        = (header[6] >> 4) | (header[7] & 0xF0)
      self.mirroring        = 2 if header[6] & 0x08 != 0 else (header[6] & 0x01)
      self.battery          = header[6] & 0x02 != 0            
      
      if self.trainer_size  > 0: self.trainer_data  = input_bin.read(self.trainer_size)
      if self.prg_size      > 0: self.prg_data      = input_bin.read(self.prg_size)      
      if self.chr_size      > 0: self.chr_data      = input_bin.read(self.chr_size)
            
    return