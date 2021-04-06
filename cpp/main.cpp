#include <cstdio>
#include <Vtestbench.h>
#include "nestest.cpp"

static double $time = 0;

double sc_time_stamp()
{
  return $time;
}


int main(int argc, char** argv)
{ 
  unsigned char ram [0x800];
  
  Verilated::commandArgs(argc, argv);
  Verilated::traceEverOn(true);
  Vtestbench tb;
  for (auto i = 0; i < 10000; ++i)
  {
    if (!tb.G_clock)
    {
      if (tb.G_addr >= 0x8000 && tb.G_rdwr)
        tb.G_rd_data = prgrom[(tb.G_addr - 0x8000) & 0x3fff];      
      else if (tb.G_addr >= 0x2000)
        tb.G_rd_data = 0;
      else
      {
        if (tb.G_rdwr)
          tb.G_rd_data = ram[tb.G_addr & 0x7ff];
        else
          ram[tb.G_addr & 0x7ff] = tb.G_wr_data;
      }
    }
    tb.G_ready = 1;
    tb.G_irq = 0;
    tb.G_nmi = 0;
    tb.G_reset = i >= 16;
    tb.G_clock = !tb.G_clock;
    tb.eval();
    $time += 1;
  }
  return 0;
}