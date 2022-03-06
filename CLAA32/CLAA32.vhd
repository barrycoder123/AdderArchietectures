--  Author: Ibrahima Barry
-- NOTES:
-- use 8 4 bit CLAAs (CLAA4) to make this 
-----------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CLAA32 is
    -- use generic statement
    generic (n : integer := 32);
    port (
            A, B        : in  std_logic_vector(n - 1 downto 0);
            Cin         : in  std_logic;
            S           : out std_logic_vector(n - 1 downto 0);
            Cout        : out std_logic
         );

end CLAA32;

architecture behavioral of CLAA32 is
    component CLAA4 is
        generic (n : integer := 4);
        port (
                A, B        : in  std_logic_vector(n - 1 downto 0);
                Cin         : in  std_logic;
                S           : out std_logic_vector(n - 1 downto 0);
                Cout        : out std_logic
             );
    end component;
    -- define carry bits and P, G bits n = 32 here
    -- define the blocks 32/4 = 8 blocks
    -- carry blocks
    signal C : std_logic_vector(8 downto 0);
begin
    -- logic for this is from lecture 2
    -- make 8 4 bit CLAAs (CLAA4)
    -- the Pi, Gi logic will be done within the CLAA component of CLAA4 module 
    C(0) <= Cin;
    CLAA_1 : CLAA4 port map(A(3 downto 0),   B(3 downto 0),   Cin,  S(3 downto 0), C(1));
    CLAA_2 : CLAA4 port map(A(7 downto 4),   B(7 downto 4),   C(1),  S(7 downto 4), C(2));
    CLAA_3 : CLAA4 port map(A(11 downto 8),  B(11 downto 8),  C(2),  S(11 downto 8), C(3));
    CLAA_4 : CLAA4 port map(A(15 downto 12), B(15 downto 12), C(3), S(15 downto 12), C(4));
    CLAA_5 : CLAA4 port map(A(19 downto 16), B(19 downto 16), C(4), S(19 downto 16), C(5));
    CLAA_6 : CLAA4 port map(A(23 downto 20), B(23 downto 20), C(5), S(23 downto 20), C(6));
    CLAA_7 : CLAA4 port map(A(27 downto 24), B(27 downto 24), C(6), S(27 downto 24), C(7));
    CLAA_8 : CLAA4 port map(A(31 downto 28), B(31 downto 28),  C(7), S(31 downto 28), C(8));
    Cout <= C(8); 

end behavioral;
