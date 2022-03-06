library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity blockB is 
    -- use generic statement 
    generic (n : integer := 4);
    port (
            C0          : in  std_logic;
            P, G        : in std_logic_vector(n - 1 downto 0);
            C           : out std_logic_vector(n downto 0) -- block carries
         );

end blockB;

architecture behavioral of blockB is 
begin
    -- logic for this is from lecture 2
    C(0) <= '0'; -- cin;
    C(1) <= G(0) or (P(0) and C0);
    C(2) <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and C0);
    C(3) <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) or (P(2) and P(1)
            and P(0) and C0);
    C(4) <= G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2)
            and P(1) and G(0)) or (P(3) and P(2) and P(1) and P(0) and C0);

end behavioral;



