library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity rca is 
    -- use generic statement 
    generic (n : integer := 32);
    port (
            Cin         : in  std_logic;
            A, B        : in  std_logic_vector(n - 1 downto 0);
            S           : out std_logic_vector(n - 1 downto 0);
            Cout        : out std_logic
         );

end rca;

architecture behavioral of rca is 
    component fullAdder is
    port(
            Cin, A, B : in std_logic;
            S, Cout   : out std_logic
        );
    end component;
    -- define n bit vector for carry bits
    signal C : std_logic_vector(n downto 0);
begin
    C(0) <= Cin;
    Cout <= C(n); -- this statment can go before the the loop under - remember
                  -- concurrency
    -- def: (for... generate statement) used to create an array of components
    -- useful for integer generics, needs a label 
    FA : for i in 0 to n - 1 generate
        FA_i : fullAdder port map(C(i), A(i), B(i), S(i), C(i+1));
    end generate FA;
end behavioral;

