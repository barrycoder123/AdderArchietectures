library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CLAA16 is
    
    generic (n : integer := 16);
    port (
            Cin     : in std_logic;
            A, B    : in std_logic_vector(n - 1 downto 0);
            S       : out std_logic_vector(n - 1 downto 0);
            P, G    : out std_logic_vector(3 downto 0);
            Cout    : out std_logic
        );

end CLAA16;

architecture behavioral of CLAA16 is 
   
    component blockA is
      port (
                Xi, Yi        : in std_logic;
                Ci            : in std_logic;
                Si, Pi, Gi    : out std_logic
             );
    end component;

    component blockB is 
            generic (n : integer := 4);
            port (
                    C0         : in  std_logic;
                    P, G       : in std_logic_vector(n - 1 downto 0);
                    C		   : out std_logic_vector(n downto 0)
                 );

    end component;

    component blockC is
        generic (n : integer := 4);
        port (
                P, G        : in  std_logic_vector(n - 1 downto 0);
                blockP      : out std_logic;
                blockG      : out std_logic
             );
    end component;

    signal C1 : std_logic_vector(4 downto 0);
    signal C2 : std_logic_vector(4 downto 0);
    signal C3 : std_logic_vector(4 downto 0);
    signal C4 : std_logic_vector(4 downto 0);
    signal P1 : std_logic_vector(3 downto 0);
    signal P2 : std_logic_vector(3 downto 0);
    signal P3 : std_logic_vector(3 downto 0);
    signal P4 : std_logic_vector(3 downto 0);
    signal G1 : std_logic_vector(3 downto 0);
    signal G2 : std_logic_vector(3 downto 0);
    signal G3 : std_logic_vector(3 downto 0);
    signal G4 : std_logic_vector(3 downto 0);
    


begin
    
   C1(0) <= Cin;
    
    -- generate and propagate logic for the first set of 4 bits
    blockB_1 : blockB port map(C1(0), P1, G1, C1);
    -- adding the first four bits like in CLAA4
    blockA_1 : for i in 0 to 3 generate 
        blockA_i : blockA port map(A(i), B(i), C1(i), S(i),
    P1(i), G1(i));
    end generate blockA_1;
    blockC_1 : blockC port map(P1, G1, P(0), G(0));

    blockB_2 : blockB port map(C2(0), P2, G2, C2);
    blockA_2 : for i in 0 to 3 generate 
        blockA_i : blockA port map(A(i + 4), B(i + 4), C2(i), S(i + 4),
    P2(i), G2(i));
    end generate blockA_2;
    blockC_2 : blockC port map(P2, G2, P(1), G(1));

    blockB_3 : blockB port map(C3(0), P3, G3, C3);
    blockA_3 : for i in 0 to 3 generate 
        blockA_i : blockA port map(A(i + 8), B(i + 8), C3(i), S(i + 8),
    P3(i), G3(i));
    end generate blockA_3;
    blockC_3 : blockC port map(P3, G3, P(2), G(2));

    blockB_4 : blockB port map(C4(0), P4, G4, C4);
    blockA_4 : for i in 0 to 3 generate 
        blockA_i : blockA port map(A(i + 12), B(i + 12), C4(i), S(i + 12),
    P4(i), G4(i));
    end generate blockA_4;
    blockC_4 : blockC port map(P4, G4, P(3), G(3));

end behavioral;

