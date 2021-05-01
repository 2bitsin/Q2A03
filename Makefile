CFLAGS = -std=c++20 -g -O0 
VFLAGS =  --trace
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

out/ver/libtestbench.a out/ver/Vtestbench.h: ver/core.sv ver/cycles.sv
	verilator --cc -Mdir out/ver -y ver --top-module core $< -CFLAGS "$(CFLAGS)" $(VFLAGS)
	$(MAKE) -C out/ver -f Vcore.mk
	mv out/ver/Vcore__ALL.a out/ver/libtestbench.a 

out/launch: cpp/nestest_main.cpp out/ver/Vtestbench.h out/lib/verilated.o out/lib/verilated_vcd_c.o out/lib/verilated_dpi.o out/ver/libtestbench.a 
	g++ $(CFLAGS) 													\
		-Iout/ver 														\
		-I$(VLTPAT) 													\
		-I$(VLTPAT)/vltstd 										\
		-o $@ 																\
		-Wl,--start-group 										\
			out/lib/verilated.o 								\
			out/lib/verilated_vcd_c.o 					\
			out/lib/verilated_dpi.o 						\
			cpp/nestest_main.cpp 								\
			out/ver/libtestbench.a 							\
		-Wl,--end-group 