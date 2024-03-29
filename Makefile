GAME					?= unchained

TIMEOUT				?= 10

TOP     			= widget
					
VCONFIG  			= ver/config.vlt

VHEADERS 			=	ver/core_control.svh 		

VFILES  			= ver/widget.sv 					   	\
								ver/components/memory.sv 	 	\
								ver/components/register.sv 	\
								ver/components/count_up.sv 	\
								ver/components/delay.sv    	\
								ver/components/compare.sv  	\
								ver/components/edge_trig.sv	\
								ver/components/sc_latch.sv	\
								ver/components/decoder.sv		\
								ver/components/mux.sv				\
								ver/audio_i2s.sv						\
								ver/controller.sv						\
								ver/video.sv 						   	\
								ver/core.sv 						   	\
								ver/core_audio.sv 			   	\
								ver/core_irq.sv 				   	\
								ver/core_alu.sv 				   	\
								ver/core_decode.sv 			   	\
								ver/core_isexec.sv 					\
								ver/games/$(GAME).sv				

LAUNCH_DEPS 	= out/cpp/$(TOP)_main.o 			\
								out/lib/verilated.o 			 	\
								out/lib/verilated_fst_c.o  	\
								out/lib/verilated_dpi.o 	 	\
								out/ver/lib$(TOP).a 			 	\

MOD_DIRS      = -y ver 									   	\
								-y ver/tests               	\
								-y ver/games               	\
								-y ver/components 

INCLUDE				= -I$(VLTPAT) 								\
								-I$(VLTPAT)/vltstd 					\
								-Iout/ver 				 						

CFLAGS 				= -std=c++20 -O3 -flto -DSECONDS_TO_RUN=$(TIMEOUT)
#CFLAGS 			= -std=c++20 -g -O0 -DSECONDS_TO_RUN=$(TIMEOUT) 

VFLAGS 				= #--trace-fst 

VLTPAT 				= /usr/share/verilator/include

all: out/launch

clean: 
	rm -rf out/ver/* out/cpp/* out/launch trace/img/* trace/*.avi

out/lib/verilated.o: $(VLTPAT)/verilated.cpp
	g++ -c $(CFLAGS) $(INCLUDE) -o $@ $^

out/lib/verilated_vcd_c.o: $(VLTPAT)/verilated_vcd_c.cpp
	g++ -c $(CFLAGS) $(INCLUDE) -o $@ $^

out/lib/verilated_fst_c.o: $(VLTPAT)/verilated_fst_c.cpp
	g++ -c $(CFLAGS) $(INCLUDE) -o $@ $^

out/lib/verilated_dpi.o: $(VLTPAT)/verilated_dpi.cpp
	g++ -c $(CFLAGS) $(INCLUDE) -o $@ $^

out/cpp/$(TOP)_main.o: cpp/$(TOP)_main.cpp out/ver/V$(TOP).h
	g++ -c $(CFLAGS) $(INCLUDE) -o $@ $<

out/ver/lib$(TOP).a out/ver/V$(TOP).h: $(VFILES) $(VCONFIG) $(VHEADERS)
	verilator --cc -Mdir out/ver $(MOD_DIRS) --top-module $(TOP) $(VFILES) $(VCONFIG) -CFLAGS "$(CFLAGS)" -DGAME=$(GAME) $(VFLAGS)
	$(MAKE) -C out/ver -f V$(TOP).mk
	mv out/ver/V$(TOP)__ALL.a out/ver/lib$(TOP).a 

out/launch: $(LAUNCH_DEPS) out/ver/V$(TOP).h 
	g++ $(CFLAGS) 			 \
	  -o $@ 						 \
	  -Wl,--start-group  \
	  $(LAUNCH_DEPS)		 \
	  -Wl,--end-group 	 \
	  -lpng 						 \
	  -lz 