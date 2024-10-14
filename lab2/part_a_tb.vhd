LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY part_a_tb IS
END ENTITY part_a_tb;
ARCHITECTURE arch_a_tb OF part_a_tb IS
    SIGNAL A, B : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL Cin : STD_LOGIC;
    SIGNAL F : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Cout : STD_LOGIC;

COMPONENT part_a
    PORT (
        A, B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        Sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        Cin : IN STD_LOGIC;
        F : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        Cout : OUT STD_LOGIC
    );
END COMPONENT;


BEGIN
    DUT : part_a
    PORT MAP(
        A => A,
        B => B,
        Sel => Sel,
        Cin => Cin,
        F => F,
        Cout => Cout
    );

    PROCESS
    BEGIN
        A <= x"F0";
        B <= x"B0";
        Cin <= '0';
        Sel <= "00";
        WAIT FOR 10 ps;
        IF (F = x"F0" AND Cout = '0') THEN
            REPORT "Test Case 1 Passed"
                SEVERITY note;
        ELSE
            REPORT "Test Case 1 Failed:"
                SEVERITY error;
        END IF;

        A <= x"F0";
        B <= x"B0";
        Cin <= '0';
        Sel <= "01";
        WAIT FOR 10 ps;
        IF (F = x"A0" AND Cout = '1') THEN
            REPORT "Test Case 2 Passed"
                SEVERITY note;
        ELSE
            REPORT "Test Case 2 Failed:"
                SEVERITY error;
        END IF;

        A <= x"F0";
        B <= x"B0";
        Cin <= '0';
        Sel <= "10";
        WAIT FOR 10 ps;
        IF (F = x"3F" AND Cout = '1') THEN
            REPORT "Test Case 3 Passed"
                SEVERITY note;
        ELSE
            REPORT "Test Case 3 Failed:"
                SEVERITY error;
        END IF;

        A <= x"F0";
        B <= x"B0";
        Cin <= '0';
        Sel <= "11";
        WAIT FOR 10 ps;
        IF (F = x"EF" AND Cout = '1') THEN
            REPORT "Test Case 4 Passed"
                SEVERITY note;
        ELSE
            REPORT "Test Case 4 Failed:"
                SEVERITY error;
        END IF;

        A <= x"F0";
        B <= x"B0";
        Cin <= '1';
        Sel <= "00";
        WAIT FOR 10 ps;
        IF (F = x"F1" AND Cout = '0') THEN
            REPORT "Test Case 5 Passed"
                SEVERITY note;
        ELSE
            REPORT "Test Case 5 Failed:"
                SEVERITY error;
        END IF;

        A <= x"F0";
        B <= x"B0";
        Cin <= '1';
        Sel <= "01";
        WAIT FOR 10 ps;
        IF (F = x"A1" AND Cout = '1') THEN
            REPORT "Test Case 6 Passed"
                SEVERITY note;
        ELSE
            REPORT "Test Case 6 Failed:"
                SEVERITY error;
        END IF;

        A <= x"F0";
        B <= x"B0";
        Cin <= '1';
        Sel <= "10";
        WAIT FOR 10 ps;
        IF (F = x"40" AND Cout = '1') THEN
            REPORT "Test Case 7 Passed"
                SEVERITY note;
        ELSE
            REPORT "Test Case 7 Failed:"
                SEVERITY error;
        END IF;

        A <= x"F0";
        B <= x"B0";
        Cin <= '1';
        Sel <= "11";
        WAIT FOR 10 ps;
        IF (F = x"B0" AND Cout = '0') THEN
            REPORT "Test Case 8 Passed"
                SEVERITY note;
        ELSE
            REPORT "Test Case 8 Failed:"
                SEVERITY error;
        END IF;

        WAIT;
    END PROCESS;
END ARCHITECTURE arch_a_tb;