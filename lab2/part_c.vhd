LIBRARY ieee;
USE IEEE.std_logic_1164.ALL;

ENTITY part_c IS
GENERIC (n : integer := 8);
    PORT (
        A, B : IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
        Sel : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        Cin : IN STD_LOGIC;
        F : OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0);
        Cout : OUT STD_LOGIC
    );
END ENTITY part_c;

ARCHITECTURE arch_c OF part_c IS
BEGIN
    PROCESS (A, Sel)
    BEGIN
        IF Sel = "00" THEN
            F <= A(n-2 DOWNTO 0) & "0";
            Cout <= A(n-1);
        ELSIF Sel = "01" THEN
            F <= A(n-2 DOWNTO 0) & A(7);
            Cout <= A(n-1);
        ELSIF sel = "10" THEN
            F <= (A(n-2 DOWNTO 0) & cin);
            Cout <= A(n-1);
        ELSIF sel = "11" THEN
            F <= (OTHERS => '0');
            Cout <= '0';
        END IF;
    END PROCESS;
END ARCHITECTURE arch_c;