LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY part_b IS
GENERIC (n : integer := 8);
    PORT (
        A, B : IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
        Sel : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        F : OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0);
        Cout : OUT STD_LOGIC
    );
END ENTITY part_b;

ARCHITECTURE arch_b OF part_b IS
BEGIN
    F <= (A XOR B) WHEN Sel = "00" ELSE
        (A NAND B) WHEN Sel = "01" ELSE
        (A OR B) WHEN Sel = "10" ELSE
        (NOT A);
    Cout <= '0';
END ARCHITECTURE arch_b;