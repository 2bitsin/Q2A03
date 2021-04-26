#include <cstdio>
#include <VWidget.h>

static double $time = 0;

double sc_time_stamp()
{
  return $time;
}

int main(int argc, char** argv)
{
  Verilated::commandArgs(argc, argv);
  Verilated::traceEverOn(false);

  Vwidget widget;

  widget.I_sys_clock = 0;
  widget.I_sys_reset = 0;
  for(auto i = 0; i < 64; ++i) {
    widget.I_sys_clock ^= 1;
    widget.eval();
    $time += 1;
  }

  widget.I_sys_reset = 1;
  for(auto i = 0; i < 42'884'160; ++i) {
    widget.I_sys_clock ^= 1;
    widget.eval();
    $time += 1;
  }


  return 0;
}