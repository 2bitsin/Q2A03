from os import system
import subprocess
from SvWriter import SvWriter
from Utils    import Utils
from sympy    import *
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
    indexes = {}
    last_index = 0
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
              indexes[flat_action] = last_index
              last_index = last_index + 1

            flat_table[flat_action].add(flat_condition)
    for action in cycle0[0]:
      flat_condition = (None, 0, action ['condition'])
      flat_action = (action['target'], action['value'])

      if flat_action not in flat_table:
        flat_table[flat_action] = set()
        indexes[flat_action] = last_index
        last_index = last_index + 1

      flat_table[flat_action].add (flat_condition)
    return flat_table, indexes, last_index

  def optimize_opcodes(self, all_codes):
    if len(all_codes) < 1:
      return None
    invert = False
    # if (len(all_codes) > 128):
    #   invert = True
    #   all_codes = set(range(0, 256)) - set(all_codes)

    result = subprocess.Popen("/mnt/c/Users/alex/Desktop/projects/QMsolver/Bin/Release/x64/QMsolver.exe", 
      stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    in_codes = list('0x%02X' % (x) for x in all_codes)
    result.stdin.write(bytes('\n'.join(in_codes), encoding='utf8'))
    result.stdin.close()
    result.wait()
    all_codes = list('8\'h%02X' % x for x in all_codes)
    all_codes = list(line.decode('utf-8').strip() for line in result.stdout.readlines())

    all_codes = '|'.join( ('(I_ir ==? 8\'b%s)' % (x.strip())) for x in all_codes)
    return ('(%s)' if not invert else '(~(%s))') % (all_codes)    

  def write_out_decoder(self, writer, flat_table, indexes, last_index):
    writer.write_line('module core_decoder(I_ir, I_t, O_control);')
    writer.indent()
    writer.write_line('input wire[7:0] I_ir;')
    writer.write_line('input wire[3:0] I_t;')
    writer.write_line('output wire[%u:0] O_control;' % (last_index - 1))
    writer.write_line('')
    action_info = []
    for action, q_conditions in flat_table.items():        
      pre_cond = {}
      for opcode, cycle_index, condition in q_conditions:
        if cycle_index not in pre_cond:
          pre_cond[cycle_index] = []
        if opcode is not None:
          pre_cond[cycle_index].append(opcode)
      for cycle_index in pre_cond:
        pre_cond[cycle_index] = self.optimize_opcodes(pre_cond[cycle_index])
      full_cond = []
      for cycle_index, opcodes in pre_cond.items():
        partial_cond = ['(I_t == 4\'d%d)' % (cycle_index)]
        if opcodes is not None:
          partial_cond.append(opcodes)

        full_cond.append('(%s)' % ('&'.join(partial_cond)))
      writer.write_line('assign O_control[%3u] = (%s);' % (indexes[action], (('|\n' + ' '*25).join(full_cond))))
      writer.write_line('')
    writer.unindent()
    writer.write_line('endmodule')     
    return 

  def write_out_control(self, writer, indexes, last_index):
    map_target = {}
    for action, index in indexes.items(): 
      lhs, rhs = action
      if lhs not in map_target:
        map_target[lhs] = {}
      map_target[lhs][rhs] = index

    for lhs, rhs_index in map_target.items():
      is_first = True
      for rhs, index  in rhs_index.items():
        combo = (index, lhs, rhs)
        if is_first:               
          writer.write_line ('     if (G_control[%3u]) %s = %s;' % combo)
        else:
          writer.write_line ('else if (G_control[%3u]) %s = %s;' % combo)
        is_first = False
      writer.write_line('')
    return


  def main(self):    
    isa_data, _, _ = Utils.parse_isa ('data/ISA-am-op.csv')
    am_data = Utils.parse_cycles ('data/ISA-am-cycles.csv')    
    op_data = Utils.parse_cycles ('data/ISA-op-cycles.csv')
    cycle_table = self.prepare (isa_data, am_data, op_data)
    flat_table, indexes, last_index = self.flatten(cycle_table, am_data['*'])    
    self.dump_flat_table(flat_table)
    self.write_out_decoder(SvWriter ('ver/core_decoder.sv'), flat_table, indexes, last_index)
    self.write_out_control(SvWriter ('ver/core_control.svi'), indexes, last_index)
    print("Done")
    return 0

main = ProcessCycles()
main.main()