library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity blockC is 
    -- use generic statement 
    generic (n : integer := 4);
    port (
            P, G        : in  std_logic_vector(n - 1 downto 0);
            blockP      : out std_logic;
            blockG      : out std_logic
         );

end blockC;

architecture behavioral of blockC is 
begin
    blockP <= and P;
    blockG <= G(3) or (P(3) and P(2) and P(1) and G(2)) or (P(3) and P(2) and
              P(1) and G(1)) or (P(3) and P(2) and P(1) and P(0) and G(0)) or
              (P(3) and P(2) and P(1) and P(0) and G(0));
end behavioral;



