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
    o7, o6, o5, o4, o3, o2, o1, o0 = sympy.symbols('o7, o6, o5, o4, o3, o2, o1, o0')
    t7, t6, t5, t4, t3, t2, t1, t0 = sympy.symbols('t7, t6, t5, t4, t3, t2, t1, t0')
    symbol_cache = {}
    for action, q_conditions in flat_table.items():        
      full_condition = sympy.symbols('x').subs({'x': False})
      for opcode, cycle_index, condition in q_conditions:            
        partial_condition = [t0, t1, t2, t3, t4, t5, t6, t7][cycle_index]
        if opcode != None:
          partial_condition = (
            (o0 if ((opcode >> 0) & 1 == 1) else ~o0) &
            (o1 if ((opcode >> 1) & 1 == 1) else ~o1) &
            (o2 if ((opcode >> 2) & 1 == 1) else ~o2) &
            (o3 if ((opcode >> 3) & 1 == 1) else ~o3) &
            (o4 if ((opcode >> 4) & 1 == 1) else ~o4) &
            (o5 if ((opcode >> 5) & 1 == 1) else ~o5) &
            (o6 if ((opcode >> 6) & 1 == 1) else ~o6) &
            (o7 if ((opcode >> 7) & 1 == 1) else ~o7) &
            partial_condition)            
        if condition != '':
          partial_condition = partial_condition & sympy.symbols(condition)
        full_condition = full_condition | partial_condition
        full_condition = sympy.simplify(full_condition)
        print(".", end="", flush=True)
      writer.write_line('if (%s)' % (full_condition))
      writer.indent()
      writer.write_line('%s = %s;' % action)
      writer.unindent()
      writer.write_line('')
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