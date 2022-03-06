library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity rcaTb is 
end rcaTb;

architecture test of rcaTb is
    component rca is
        generic (n : integer := 32);
        port (
            Cin        : in std_logic;
            A, B        : in std_logic_vector(n - 1 downto 0);
            S           : out std_logic_vector(n - 1 downto 0);
            Cout        : out std_logic
            );
    end component;

    -- testing signals to add
    signal A, B           : std_logic_vector(31 downto 0);
    signal C              : std_logic := '0';
    signal S              : std_logic_vector(31 downto 0);
    signal Cout           : std_logic;

begin 
    -- use generic map 
    dut : rca generic map(32) 
        port map (C, A, B, S, Cout);
    process 
        variable n : integer := 32;
    begin
        for i in 0 to ((2**(n-1)) - 1) loop
            A <= std_logic_vector(to_unsigned(i, n));
            wait for 40 ns; -- want A and B to be different numbers
            B <= std_logic_vector(to_unsigned(i, n));
            wait for 10 ns;
        end loop;
    end process;
    
    
end test;
