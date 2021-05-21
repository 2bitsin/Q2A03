from Utils import Utils

isa, _, _ = Utils.parse_isa('data/ISA-am-op.csv')


with open('data/curr_ir.gtkw', 'w+') as ofile:
  for opcode, am, op in isa:
    ofile.write ('{0:08b} {1} {2}\n'.format(opcode, Utils.simplify_name(op), Utils.simplify_name(am)))

