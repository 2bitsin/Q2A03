from IsaParsed    import IsaParsed
from SvWriter     import SvWriter
from CyclesParsed import CyclesParsed
from Utils        import Utils
import sympy 
import re

class ProcessCycles:

  def __init__(self):
    return
    
  def prepare(self, isa, ams, ops):  
    full_table = []  
    instructions_assembled = 0
    for code, addressing, operation in isa:
      if addressing not in ams or operation not in ops:
        print ("Warning, $%02X not handled..." % (code))       
        continue
      instructions_assembled = instructions_assembled + 1 
      am_cycles = ams[addressing]
      op_cycles = ops[operation]
      cycles = {}
      last_am_cycle = 0
      for cycle_index, actions in am_cycles.items():
        if cycle_index > last_am_cycle:
          last_am_cycle = cycle_index
        if cycle_index not in cycles:
          cycles[cycle_index] = {}
        for curr_action in actions:
          target    = curr_action['target']
          value     = curr_action['value'] 
          condition = curr_action['condition']
          if target not in cycles[cycle_index]:
            cycles[cycle_index][target] = {}
          cycles[cycle_index][target][condition] = value
      last_am_cycle = last_am_cycle + 1
      for cycle_index, actions in op_cycles.items():
        cycle_index = cycle_index + last_am_cycle
        if cycle_index not in cycles:
          cycles[cycle_index] = {}
        for curr_action in actions:
          target    = curr_action['target']
          value     = curr_action['value'] 
          condition = curr_action['condition']
          if target not in cycles[cycle_index]:
            cycles[cycle_index][target] = {}
          cycles[cycle_index][target][condition] = value
      full_table.append({
        'opcode'      :code,
        'addressing'  :addressing,
        'operation'   :operation, 
        'cycles'      :cycles,
        '_hexcode'    :('$%02X' % code)
      })
    print("Instructions assembed %d/%d" % (instructions_assembled, 256))    
    return full_table

  def dump_flat_table(self, table):
    with open('trace/flat.csv', 'w+') as outfile:
      for action, q_conditions in table.items():        
        outfile.writelines(['"%s", "%s"\n' % action])
        for opcode, cycle_index, condition in q_conditions:
          opcode_str = '%02X' % (opcode) if opcode != None else 'XX'
          outfile.writelines([
            '"", "$%s", "%d", "%s"\n' % (opcode_str, cycle_index, condition)
          ])
    return

  def flatten(self, table, cycle0):
    flat_table = {}
    for item in table:
      opcode      = item['opcode']
      addressing  = Utils.strip_name (item['addressing'])
      operation   = Utils.strip_name (item['operation'])
      q_cycles    = item['cycles']
      for cycle_index, q_actions in q_cycles.items():
        for target, q_values in q_actions.items():
          for condition, value in q_values.items():
            flat_condition = (opcode, cycle_index, condition)
            flat_action = (target, value)
            if flat_action not in flat_table:
              flat_table[flat_action] = set()
            flat_table[flat_action].add(flat_condition)
    for action in cycle0[0]:
      flat_condition = (None, 0, action ['condition'])
      flat_action = (action['target'], action['value'])
      if flat_action not in flat_table:
        flat_table[flat_action] = set()
      flat_table[flat_action].add (flat_condition)
    return flat_table

  def write_out(self, writer, flat_table):

    for action, q_conditions in flat_table.items():        
      pre_cond = {}
      for opcode, cycle_index, condition in q_conditions:
        if cycle_index not in pre_cond:
          pre_cond[cycle_index] = []
        if opcode is not None:
          pre_cond[cycle_index].append(opcode)
      full_cond = []
      for cycle_index, opcodes in pre_cond.items():
        partial_cond = ['(curr_cycle == %d)' % (cycle_index)]
        if len(opcodes) > 1:
          partial_cond.append('(curr_ir inside {%s})' % (','.join (Utils.arr_int8_to_hex(opcodes))))
        elif len(opcodes) == 1:
          partial_cond.append('(curr_ir == %s)' % (Utils.int8_to_hex(opcodes[0])))          
        full_cond.append('&'.join(partial_cond))
      writer.write_line('if (%s)' % ('|\n    '.join(full_cond)))
      writer.indent()
      writer.write_line('%s = %s;' % action)
      writer.unindent()
      writer.write_line('')
      print("%s = %s" % action) 
    self.dump_flat_table(flat_table)    
    print ("\nDone")
    return 

  def main(self):
    writer = SvWriter ('ver/cycles.sv')
    writer.indent ()
    isa_data = IsaParsed ('data/ISA-am-op.csv').isa_table 
    am_data = CyclesParsed ('data/ISA-am-cycles.csv').table    
    op_data = CyclesParsed ('data/ISA-op-cycles.csv').table
    cycle_table = self.prepare (isa_data, am_data, op_data)
    flat_table = self.flatten(cycle_table, am_data['*'])
    self.write_out(writer, flat_table)
    return 0

main = ProcessCycles()
main.main()