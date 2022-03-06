GHDL=ghdl
FLAGS="--std=08"

all:
	@$(GHDL) -a $(FLAGS) CLAA16Tb.vhd CLAA16.vhd blockA.vhd blockB.vhd blockC.vhd
	@$(GHDL) -e $(FLAGS) CLAA16Tb
	@$(GHDL) -r $(FLAGS) CLAA16Tb --wave=wave.ghw --stop-time=5us
