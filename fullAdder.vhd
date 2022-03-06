--  Author: Ibrahima Barry

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fullAdder is 
    port (
            A, B, Cin : in std_logic;
            S, Cout   : out std_logic
         );

end fullAdder;

architecture dat_flow of fullAdder is 
    -- intermediate signals 
    signal P, G: std_logic;
begin 
    P <= A xor B;
    G <= A and B;
    
    S <= P xor Cin;
    Cout <= G or (P and Cin);
end;

