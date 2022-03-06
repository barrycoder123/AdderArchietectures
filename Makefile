GHDL=ghdl
FLAGS="--std=08"

all:
	@$(GHDL) -a $(FLAGS) rcaTb.vhd rca.vhd fullAdder.vhd  
	@$(GHDL) -e $(FLAGS) rcaTb
	@$(GHDL) -r $(FLAGS) rcaTb --wave=wave.ghw --stop-time=10us
