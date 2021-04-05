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

out/ver/libtestbench.a out/ver/Vtestbench.h: ver/testbench.sv ver/Q2A03.sv
	verilator --cc -Mdir out/ver -y ver $? -CFLAGS "$(CFLAGS)" $(VFLAGS)
	$(MAKE) -C out/ver -f Vtestbench.mk
	mv out/ver/Vtestbench__ALL.a out/ver/libtestbench.a 

out/launch: cpp/main.cpp out/ver/Vtestbench.h out/lib/verilated.o out/lib/verilated_vcd_c.o out/ver/libtestbench.a 
	g++ $(CFLAGS) 													\
		-Iout/ver 														\
		-I$(VLTPAT) 													\
		-I$(VLTPAT)/vltstd 										\
		-o $@ 																\
		-Wl,--start-group 										\
			out/lib/verilated.o 								\
			out/lib/verilated_vcd_c.o 					\
			cpp/main.cpp 												\
			out/ver/libtestbench.a 							\
		-Wl,--end-group 