GHDL=ghdl
FLAGS="--std=08"

all:
	@$(GHDL) -a $(FLAGS) CLAA32Tb.vhd CLAA32.vhd CLAA4.vhd CLAA.vhd
	@$(GHDL) -e $(FLAGS) CLAA32Tb
	@$(GHDL) -r $(FLAGS) CLAA32Tb --wave=wave.ghw --stop-time=10us
