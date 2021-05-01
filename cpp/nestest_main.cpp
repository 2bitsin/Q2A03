#include <cstdio>
#include <iterator>
#include <Vcore.h>
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
  Vcore tb;

  auto scope = svGetScopeFromName("TOP.core");
  if (!scope)
    return -1;
  svSetScope(scope);

  int last_sync = 0;
  int last_phy2 = 0;
  int cycles = 0;
  int actual_cycles = 0;
  int log_index = 0;

  tb.I_reset = 0;
  tb.I_ready = 1;
  tb.I_irq = 1;
  tb.I_nmi = 1;
  tb.I_clock = 0;
  tb.O_phy2 = 0;
  tb.I_rd_data = 0;
  tb.O_wr_data = 0;
  tb.O_addr = 0;
  tb.O_sync = 0;

  for (auto i = 0; i < 1000000; ++i) 
  {
    tb.eval();
    tb.I_clock = !tb.I_clock;
    tb.I_reset = i >= 12;    
    tb.I_ready = 1;
    tb.I_irq = 1;
    tb.I_nmi = 1;
    if (tb.O_phy2) 
    {
      if (tb.O_addr >= 0x8000 && tb.O_rdwr)
        tb.I_rd_data = prgrom[(tb.O_addr - 0x8000) & 0x3fff];      
      else if (tb.O_addr >= 0x2000)
        tb.I_rd_data = 0;
      else {
        if (tb.O_rdwr)
          tb.I_rd_data = ram[tb.O_addr & 0x7ff];
        else 
          ram[tb.O_addr & 0x7ff] = tb.O_wr_data; 
      #if 1
      //  if (!last_phy2 && tb.O_addr == 0x647)
      //    printf("%s($%04X, $%02X)\n", tb.O_rdwr ? "R" : "W", tb.O_addr, tb.O_rdwr ? tb.I_rd_data : tb.O_wr_data);
      #endif
      }
      last_phy2 = tb.O_phy2;
    }
    if (!last_sync && tb.O_sync) 
    {
      if (std::size(nesttest_log) <= log_index)
        break;

      tb.read_state(&a, &x, &y, &s, &p, &ir, &pcl, &pch, (unsigned*)&cycles);    
      if (cycles >= 0)
      {
        const auto& st_snapshot = nesttest_log[log_index++];
        const auto clocks = st_snapshot.ppuclock;      
        const auto pc = (pch * 0x100 + pcl);
        std::printf("[%-4d] %-15s ", log_index, st_snapshot.disassembly);
        switch(st_snapshot.nbytes)
        {
        case 1: std::printf("%02X       ", st_snapshot.opbytes[0]); break;
        case 2: std::printf("%02X %02X    ", st_snapshot.opbytes[0], st_snapshot.opbytes[1]); break;
        case 3: std::printf("%02X %02X %02X ", st_snapshot.opbytes[0], st_snapshot.opbytes[1], st_snapshot.opbytes[2]); break;
        }
        std::printf("   PC=%04X A=%02X X=%02X Y=%02X S=%02X P=%02X CYC=%d\n", pc, a, x, y, s, p, cycles);

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
          for(auto i = 0; i < 100; ++i)
          {
            $time += 1;
            tb.eval();
          }
          return -1;
        }
      }
    }
    last_sync = tb.O_sync;    
    if (!last_phy2 && tb.O_phy2)
      actual_cycles += 3;
    last_phy2 = tb.O_phy2;
    $time += 1;
  }
  return 0;
}