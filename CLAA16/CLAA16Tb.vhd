library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity CLAA16Tb is 
end CLAA16Tb;

architecture test of CLAA16Tb is
    component CLAA16 is
        generic (n : integer := 16);
        port (
                Cin         : in  std_logic;
                A, B        : in  std_logic_vector(n - 1 downto 0);
                S           : out std_logic_vector(n - 1 downto 0);
                P, G        : out std_logic_vector(3 downto 0);
                Cout        : out std_logic
             );
    end component;

    -- testing signals to add
    signal A, B           : std_logic_vector(15 downto 0);
    signal S              : std_logic_vector(15 downto 0);
    signal P, G           : std_logic_vector(3 downto 0);
    signal Cout           : std_logic;

begin 
    -- use generic map 
    dut : CLAA16 generic map(16) 
        port map ('0', A, B, S, P, G, Cout);
    process 
        variable n : integer := 16;
    begin
        for i in 0 to ((2**n) - 1) loop
            A <= std_logic_vector(to_unsigned(i, n));
            wait for 40 ns; -- want A and B to be different numbers
            B <= std_logic_vector(to_unsigned(i, n));
            wait for 10 ns;
        end loop;
    end process;

end test;

        
