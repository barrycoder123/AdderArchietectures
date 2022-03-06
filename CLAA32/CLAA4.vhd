library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CLAA4 is 
    -- use generic statement 
    generic (n : integer := 4);
    port (
            A, B        : in  std_logic_vector(n - 1 downto 0);
            Cin         : in  std_logic;
            S           : out std_logic_vector(n - 1 downto 0);
            Cout        : out std_logic
         );

end CLAA4;

architecture behavioral of CLAA4 is 
    component CLAA is
    port(
            A, B        : in std_logic;
            Cin         : in std_logic;
            S, P, G     : out std_logic
        );
    end component;
    -- define carry bits and P, G bits
    signal C        : std_logic_vector(n downto 0);
    signal P, G     : std_logic_vector(n -1 downto 0);
begin
    -- logic for this is from lecture 2
    C(0) <= Cin;
    C(1) <= G(0) or (P(0) and Cin);
    C(2) <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and Cin);
    C(3) <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) or (P(2) and P(1)
            and P(0) and Cin);
    C(4) <= G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2)
            and P(1) and G(0)) or (P(3) and P(2) and P(1) and P(0) and Cin);
     -- these statment can go before the the loop under - remember  concurrency
    CLAA_4 : for i in 0 to n - 1 generate
        CLAA_i : CLAA port map(A(i), B(i), C(i), S(i), P(i), G(i));
    end generate CLAA_4;
    Cout <= C(4);
end behavioral;



