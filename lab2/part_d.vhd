LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY part_d IS
GENERIC (n : integer := 8);
    PORT (
        A, B : IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
        Sel : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        Cin : IN STD_LOGIC;
        F : OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0);
        Cout : OUT STD_LOGIC
    );
END ENTITY part_d;

ARCHITECTURE arch_d OF part_d IS
BEGIN
    PROCESS (A, Sel)
    BEGIN
        IF Sel = "00" THEN
            F <= ('0' & A(n-1 DOWNTO 1));
            Cout <= A(0);
        ELSIF Sel = "01" THEN
            F <= (A(0) & A(n-1 DOWNTO 1));
            Cout <= A(0);
        ELSIF Sel = "10" THEN
            F <= (Cin & A(n-1 DOWNTO 1));
            Cout <= A(0);
        ELSIF Sel = "11" THEN
            F <= (A(7) & A(n-1 DOWNTO 1));
            Cout <= '0';
        END IF;
    END PROCESS;
END ARCHITECTURE arch_d;