from itertools import cycle
from os import system, write
import subprocess
from SvWriter import SvWriter
from Utils    import Utils
from sympy    import *
import re

class ProcessCycles:

  def __init__(self):
    self.opcode_set_cache = dict()
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
      return []
    all_codes = sorted(all_codes)
    set_key = ', '.join (("%02X" % x) for x in all_codes)
    if set_key in self.opcode_set_cache:
      return self.opcode_set_cache[set_key]
    print("Optimizing opcode set : %s" % (set_key))
    result = subprocess.Popen("/mnt/c/Users/alex/Desktop/projects/QMsolver/Bin/Release/x64/QMsolver.exe", stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    in_codes = list('0x%02X' % (x) for x in all_codes)
    result.stdin.write(bytes('\n'.join(in_codes), encoding='utf8'))
    result.stdin.close()
    result.wait()    
    optimized_set = list(sorted(line.decode('utf-8').strip() for line in result.stdout.readlines()))          
    self.opcode_set_cache[set_key] = optimized_set
    return optimized_set
    

  def write_out_decoder(self, writer, flat_table, indexes, last_index):

    rel_action_conds = {}
    partial_code_cache = {}
    index_set_cache = {}
    for action, q_conditions in flat_table.items():          
      rel_cycle_opcode = {}
      for opcode, cycle_index, condition in q_conditions:
        if cycle_index not in rel_cycle_opcode:
          rel_cycle_opcode[cycle_index] = []
        if opcode is not None:
          rel_cycle_opcode[cycle_index].append(opcode)  
      for cycle_index, opcodes in rel_cycle_opcode.items():
        rel_cycle_opcode[cycle_index] = self.optimize_opcodes(opcodes)    
      for cycle_index, q_opcodes in rel_cycle_opcode.items():
        partial_code_indexes = []
        for partial_code in q_opcodes:
          if partial_code not in partial_code_cache:
            partial_code_cache[partial_code] = len(partial_code_cache)          
          partial_code_indexes.append(partial_code_cache[partial_code])
        index_set_cache_key = '|'.join ('%x' % x for x in partial_code_indexes)        
        if len(q_opcodes) > 0:          
          if index_set_cache_key not in index_set_cache:
            index_set_cache[index_set_cache_key] = (len(index_set_cache), partial_code_indexes)
        rel_cycle_opcode[cycle_index] = index_set_cache_key
      rel_action_conds[action] = rel_cycle_opcode

    writer.write_line('module core_decoder(I_ir, I_t, O_control);')
    writer.indent()
    writer.write_line('input wire[7:0] I_ir;')
    writer.write_line('input wire[3:0] I_t;')
    writer.write_line('output wire[%u:0] O_control;' % (last_index - 1))
    writer.write_line('')
    for partial_code, index in partial_code_cache.items():
      writer.write_line('wire w%03u = (I_ir ==? 8\'b%s);' % (index, partial_code))

    writer.write_line('')
    for t in range(0, 8):
      writer.write_line('wire t%u = (I_t == 4\'d%u);' % (t, t))
    
    writer.write_line('')
    for cache_key, net_id_and_list in index_set_cache.items():
      net_id, net_list = net_id_and_list
      net_list = '|'.join('w%03u' % x for x in net_list)
      writer.write_line('wire x%03u = %s;' % (net_id, net_list))

    writer.write_line('')
    full_cond_cache = {}
    control_index_map = {}
    for action, q_cycle_code_indexes in rel_action_conds.items():      
      control_index = indexes[action]
      full_condition = []
      for cycle_index, index_set_cache_key in q_cycle_code_indexes.items():                
        partial_condition = ['t%u' % (cycle_index)]
        if index_set_cache_key in index_set_cache:
          net_id, net_list = index_set_cache[index_set_cache_key]
          partial_condition.append ('x%03u' % net_id)
        partial_condition = '(%s)' % (' & '.join(partial_condition))
        full_condition.append(partial_condition)
      full_condition = ('|').join(sorted(full_condition))
      if full_condition not in full_cond_cache:
        full_cond_cache[full_condition] = control_index
        writer.write_line('wire y%03u = %s;' % (control_index, full_condition))
        control_index_map[control_index] = control_index
      else:
        control_index_map[control_index] = full_cond_cache[full_condition]

    writer.write_line('')
    for target, source in control_index_map.items():
      writer.write_line('assign O_control[%3u] = y%03u;' % (target, source))    

    writer.unindent()
    writer.write_line('endmodule')     
    return 

  def write_out_control(self, writer, indexes, last_index, def_table):
    map_target = {}
    target_group = {}
    group_target = {}
    for action, index in indexes.items(): 
      lhs, rhs = action
      if lhs not in def_table:
        raise RuntimeError("Error, no default for %s !" % lhs)        
      defval, reset, group = def_table[lhs]
      if lhs not in map_target:
        map_target[lhs] = {}
      map_target[lhs][rhs] = index
      target_group[lhs] = group
      if group not in group_target:
        group_target[group] = set()
      group_target[group].add(lhs)

    for target, other in def_table.items():
      defval, reset, group = other
      if group not in group_target:
        group_target[group] = set()
      group_target[group].add(target)

    for group, targets in group_target.items():
      writer.write_line("always @*")
      writer.begin()
      for lhs in targets:
        rhs, reset, group = def_table[lhs]
        if len(rhs) > 0:
          writer.write_line('%s = %s;' % (lhs, rhs))
      writer.write_line('')
      for lhs, rhs_index in map_target.items():
        if def_table[lhs][2] != group:
          continue
        is_first = True      
        for rhs, index in rhs_index.items():
          combo = (index, lhs, rhs)
          if def_table[lhs][0] == rhs:
            print("Warning duplicate default value %s = %s!" % (lhs, rhs))
          if is_first:               
            writer.write_line ('     if (G_control[%3u]) %s = %s;' % combo)
          else:
            writer.write_line ('else if (G_control[%3u]) %s = %s;' % combo)          
          is_first = False
        writer.write_line('')
      writer.end()
      writer.write_line('')

    return


  def main(self):    
    isa_data, _, _ = Utils.parse_isa ('data/ISA-am-op.csv')
    am_data = Utils.parse_cycles ('data/ISA-am-cycles.csv')    
    op_data = Utils.parse_cycles ('data/ISA-op-cycles.csv')
    def_table = Utils.parse_defaults('data/ISA-defaults.csv')
    cycle_table = self.prepare (isa_data, am_data, op_data)
    flat_table, indexes, last_index = self.flatten(cycle_table, am_data['*'])    
    self.dump_flat_table(flat_table)
    self.write_out_decoder(SvWriter ('ver/core_decode.sv'), flat_table, indexes, last_index)
    self.write_out_control(SvWriter ('ver/core_control.svh'), indexes, last_index, def_table)
    print("Done")
    return 0

main = ProcessCycles()
main.main()