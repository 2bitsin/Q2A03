#include <cstdio>
#include <Vtestbench.h>

static double $time = 0;

double sc_time_stamp()
{
  return $time;
}

int main(int argc, char** argv)
{  
  Verilated::commandArgs(argc, argv);
  Verilated::traceEverOn(true);
  Vtestbench tb;
  for (auto i = 0; i < 10000; ++i)
  {
    tb.G_reset = i >= 16;
    tb.G_clock = !tb.G_clock;
    tb.eval();
    $time += 1;
  }
  return 0;
}