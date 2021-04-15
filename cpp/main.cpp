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
  
  std::memset(ram, 0xff, sizeof(ram));

  Verilated::commandArgs(argc, argv);
  Verilated::traceEverOn(true);
  Vtestbench tb;

  auto scope = svGetScopeFromName("TOP.testbench.i0");
  if (!scope)
    return -1;
  svSetScope(scope);
  int last_sync = 0;
  unsigned cycles = 0;
  for (auto i = 0; i < 1000000; ++i) 
  {
    tb.G_clock = !tb.G_clock;
    tb.G_reset = i >= 12;
    tb.G_ready = 1;
    tb.G_irq = 0;
    tb.G_nmi = 0;
    if (tb.G_phy2) {
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
      tb.read_state(&a, &x, &y, &s, &p, &ir, &pcl, &pch, &cycles);    
      
      if (!last_sync && tb.G_sync) {
        std::printf("PC=%04X IR=%02X A=%02X X=%02X Y=%02X P=%02X S=%02X CYC=%d\n", (pch * 0x100 + pcl), ir, a, x, y, p, s, cycles);      
      }
      last_sync = tb.G_sync;
    }
    tb.eval();
    $time += 1;
  }
  return 0;
}