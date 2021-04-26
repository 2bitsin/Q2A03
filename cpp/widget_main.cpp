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
  Verilated::traceEverOn(true);

  Vwidget widget;

  return 0;
}