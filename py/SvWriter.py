import re

class SvWriter:
  def __init__(self, svname):
    self.file = open(svname, 'w+')
    self.tabs = 0

  def new_line(self):
    self.file.write('\n' + '\t'*self.tabs)

  def always(self, slist = '*'):
    
    self.new_line()
    self.file.write('always @')
    if isinstance(slist, str): 
      self.file.write(slist)
    elif len(slist) == 0:
      self.file.write('*')
    elif len(slist) == 1 and not re.match(r'posedge|negedge', slist[0]):
      self.file.write(slist[0])
    else:
      self.file.write('(%s)'% (', '.join(slist)))
  
  def indent(self):
    self.tabs = self.tabs + 1

  def unindent(self):
    self.tabs = self.tabs - 1

  def begin(self):
    self.begin_with('begin')

  def end(self):
    self.end_with('end')

  def begin_with(self, line):
    self.write_line(line)
    self.indent()

  def end_with(self, line):
    self.unindent()
    self.write_line(line)
  
  def case(self, of_value):
    self.write_line('case(%s)'%(of_value))
    self.indent()

  def endcase(self):
    self.unindent()
    self.write_line('endcase')

  def write_line(self, text):
    text = text.replace('\n', '\n' + '\t'*self.tabs)
    self.new_line()
    self.file.write(text)