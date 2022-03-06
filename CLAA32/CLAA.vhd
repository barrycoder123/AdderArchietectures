--  Author: Ibrahima Barry

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CLAA is 
    port (
            A, B        : in std_logic;
            Cin         : in std_logic;
            S, P, G     : out std_logic
         );

end CLAA;

architecture dat_flow of CLAA is 
begin 
    P <= A xor B;
    G <= A and B;   
    S <= P xor Cin;
end;

