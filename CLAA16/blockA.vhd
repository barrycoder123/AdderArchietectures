--  Author: Ibrahima Barry
-----------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity blockA is 
    port (
            Xi, Yi        : in std_logic;
            Ci            : in std_logic;
            Si, Pi, Gi    : out std_logic
         );

end blockA;

architecture dat_flow of blockA is 
begin 
    Pi <= Xi xor Yi;
    Gi <= Xi and Yi;   
    Si <= Pi xor Ci;
end;

