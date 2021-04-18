#include <cstdio>
#include <Vtestbench.h>
#include <svdpi.h>
#include "nestest.cpp"

static double $time = 0;

double sc_time_stamp()
{
  return $time;
}


int main(int argc, char** argv)
{ 
  unsigned char ram [0x800];
  uint8_t a,x,y,s,p,ir,pcl,pch;
  
  std::memset(ram, 0x00, sizeof(ram));

  Verilated::commandArgs(argc, argv);
  Verilated::traceEverOn(true);
  Vtestbench tb;

  auto scope = svGetScopeFromName("TOP.testbench.i0");
  if (!scope)
    return -1;
  svSetScope(scope);

  int last_sync = 0;
  int last_phy2 = 0;
  unsigned cycles = 0;
  unsigned actual_cycles = 0;
  int log_index = 0;

  tb.G_reset = 0;
  tb.G_ready = 1;
  tb.G_irq = 1;
  tb.G_nmi = 1;
  tb.G_clock = 0;
  tb.G_phy2 = 0;
  tb.G_rd_data = 0;
  tb.G_wr_data = 0;
  tb.G_addr = 0;
  tb.G_sync = 0;

  for (auto i = 0; i < 1000000; ++i) 
  {
    tb.eval();
    tb.G_clock = !tb.G_clock;
    tb.G_reset = i >= 12;
    tb.G_ready = 1;
    tb.G_irq = 0;
    tb.G_nmi = 0;
    if (tb.G_phy2) 
    {
      if (tb.G_addr >= 0x8000 && tb.G_rdwr)
        tb.G_rd_data = prgrom[(tb.G_addr - 0x8000) & 0x3fff];      
      else if (tb.G_addr >= 0x2000)
        tb.G_rd_data = 0;
      else {
        if (tb.G_rdwr)  
          tb.G_rd_data = ram[tb.G_addr & 0x7ff];
        else 
          ram[tb.G_addr & 0x7ff] = tb.G_wr_data; 
      }
    }
    if (!last_sync && tb.G_sync) 
    {
      const auto& st_snapshot = nesttest_log[log_index++];
      const auto clocks = st_snapshot.ppuclock;
      tb.read_state(&a, &x, &y, &s, &p, &ir, &pcl, &pch, &cycles);    
      const auto pc = (pch * 0x100 + pcl);
      std::printf("[%-4d] PC=%04X A=%02X X=%02X Y=%02X S=%02X P=%02X CYC=%d\n", log_index, pc, a, x, y, s, p, cycles);
      if (st_snapshot.addr != pc || st_snapshot.regs.a != a || st_snapshot.regs.x != x || st_snapshot.regs.y != y || st_snapshot.regs.p != p || st_snapshot.regs.sp != s || clocks != cycles)
      {
        std::printf("%-4d : expected / actual\n", log_index);
        std::printf("------------------------\n");
        std::printf("PC   : %04X     /  %04X\n", st_snapshot.addr, pc);
        std::printf("A    : %02X       /  %02X\n", st_snapshot.regs.a, a);
        std::printf("X    : %02X       /  %02X\n", st_snapshot.regs.x, x);
        std::printf("Y    : %02X       /  %02X\n", st_snapshot.regs.y, y);
        std::printf("S    : %02X       /  %02X\n", st_snapshot.regs.sp, s);
        std::printf("P    : %02X       /  %02X\n", st_snapshot.regs.p, p);
        std::printf("CYC  : %-6lu   /  %-6u\n", clocks, cycles); 
        $time += 1;
        tb.eval();
        return -1;
      }
    }
    last_sync = tb.G_sync;    
    if (!last_phy2 && tb.G_phy2)
      actual_cycles += 3;
    last_phy2 = tb.G_phy2;
    $time += 1;
  }
  return 0;
}