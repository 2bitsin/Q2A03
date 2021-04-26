CFLAGS = -std=c++20 -g -O0 
VFLAGS = --timescale "1ns/1ps" --trace
VLTPAT = /usr/share/verilator/include

all: out/launch

clean: 
	rm -rf out/ver/* out/cpp/* out/launch

out/lib/verilated.o: $(VLTPAT)/verilated.cpp
	g++ -c $(CFLAGS) -I$(VLTPAT) -I$(VLTPAT)/vltstd -o $@ $^

out/lib/verilated_vcd_c.o: $(VLTPAT)/verilated_vcd_c.cpp
	g++ -c $(CFLAGS) -I$(VLTPAT) -I$(VLTPAT)/vltstd -o $@ $^

out/lib/verilated_dpi.o: $(VLTPAT)/verilated_dpi.cpp
	g++ -c $(CFLAGS) -I$(VLTPAT) -I$(VLTPAT)/vltstd -o $@ $^

out/ver/libwidget.a out/ver/Vwidget.h: ver/widget.sv ver/core.sv ver/cycles.sv
	verilator --cc -Mdir out/ver -y ver --top-module widget $< -CFLAGS "$(CFLAGS)" $(VFLAGS)
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
		-Wl,--end-group 