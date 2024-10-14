LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY part_b_tb IS
END ENTITY part_b_tb;
ARCHITECTURE arch_b_tb OF part_b_tb IS

    SIGNAL A, B : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL F : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Cout : STD_LOGIC;
    COMPONENT part_b
        PORT (
            A, B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            Sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            F : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            Cout : OUT STD_LOGIC
        );
    END COMPONENT;

BEGIN
    DUT : part_b
    PORT MAP(
        A => A,
        B => B,
        Sel => Sel,
        F => F,
        Cout => Cout
    );
    PROCESS
    BEGIN
        A <= "11110000";
        B <= "10110000";
        Sel <= "00";
        WAIT FOR 10 ps;
        IF (F = (A XOR B) AND Cout = '0') THEN
            REPORT "Test Case 1 Passed: A XOR B output is correct"
                SEVERITY note;
        ELSE
            REPORT "Test Case 1 Failed: Expected XOR output"
                SEVERITY error;
        END IF;

        A <= "11110000";
        B <= "00001011";
        Sel <= "01";
        WAIT FOR 10 ps;
        IF (F = (A NAND B) AND Cout = '0') THEN
            REPORT "Test Case 2 Passed: A nand B output is correct"
                SEVERITY note;
        ELSE
            REPORT "Test Case 2 Failed: Expected nand output"
                SEVERITY error;
        END IF;
        A <= "11110000";
        B <= "10110000";
        Sel <= "10";
        WAIT FOR 10 ps;
        IF (F = (A OR B) AND Cout = '0') THEN
            REPORT "Test Case 3 Passed: A or B output is correct"
                SEVERITY note;
        ELSE
            REPORT "Test Case 3 Failed: Expected or output"
                SEVERITY error;
        END IF;

        A <= "11110000";
        B <= "00001011";
        Sel <= "11";
        WAIT FOR 10 ps;
        IF (F = (NOT A) AND Cout = '0') THEN
            REPORT "Test Case 4 Passed: not Aoutput is correct"
                SEVERITY note;
        ELSE
            REPORT "Test Case 4 Failed: Expected not output"
                SEVERITY error;
        END IF;
        WAIT;
    END PROCESS;

END ARCHITECTURE arch_b_tb;