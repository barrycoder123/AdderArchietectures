GHDL=ghdl
FLAGS="--std=08"

all:
	@$(GHDL) -a $(FLAGS) CLAA4Tb.vhd CLAA4.vhd CLAA.vhd
	@$(GHDL) -e $(FLAGS) CLAA4Tb
	@$(GHDL) -r $(FLAGS) CLAA4Tb --wave=wave.ghw --stop-time=1us
