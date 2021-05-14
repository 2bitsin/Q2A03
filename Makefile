CFLAGS = -std=c++20 -O3 
#CFLAGS = -std=c++20 -g -O0 
#VFLAGS = 
VFLAGS = --trace
VLTPAT = /usr/share/verilator/include

VFILES   = 	ver/widget.sv 					\
						ver/video.sv 						\
						ver/dpmem.sv 						\
						ver/register.sv					\
						ver/core.sv 						\
						ver/core_irq.sv 				\
						ver/core_alu.sv 				\
						ver/core_decoder.sv 		
					
VHEADERS = 	ver/core_control.svh 		
VPACKS	 =	ver/core_alu_signals.sv 


all: out/launch

clean: 
	rm -rf out/ver/* out/cpp/* out/launch trace/img/* trace/*.avi

out/lib/verilated.o: $(VLTPAT)/verilated.cpp
	g++ -c $(CFLAGS) -I$(VLTPAT) -I$(VLTPAT)/vltstd -o $@ $^

out/lib/verilated_vcd_c.o: $(VLTPAT)/verilated_vcd_c.cpp
	g++ -c $(CFLAGS) -I$(VLTPAT) -I$(VLTPAT)/vltstd -o $@ $^

out/lib/verilated_dpi.o: $(VLTPAT)/verilated_dpi.cpp
	g++ -c $(CFLAGS) -I$(VLTPAT) -I$(VLTPAT)/vltstd -o $@ $^

out/ver/libwidget.a out/ver/Vwidget.h: $(VFILES) $(VHEADERS) $(PACKS)
	verilator --cc -Mdir out/ver -y ver --top-module widget $(VPACKS) $(VFILES) -CFLAGS "$(CFLAGS)" $(VFLAGS)
	$(MAKE) -C out/ver -f Vwidget.mk
	mv out/ver/Vwidget__ALL.a out/ver/libwidget.a 

out/launch: cpp/widget_main.cpp out/ver/Vwidget.h out/lib/verilated.o out/lib/verilated_vcd_c.o out/lib/verilated_dpi.o out/ver/libwidget.a 
	g++ $(CFLAGS) 													\
		-Iout/ver 														\
		-I$(VLTPAT) 													\
		-I$(VLTPAT)/vltstd 										\
		-o $@ 																\
		-Wl,--start-group 										\
			out/lib/verilated.o 								\
			out/lib/verilated_vcd_c.o 					\
			out/lib/verilated_dpi.o 						\
			cpp/widget_main.cpp 								\
			out/ver/libwidget.a 								\
		-Wl,--end-group 											\
		-lpng 																
