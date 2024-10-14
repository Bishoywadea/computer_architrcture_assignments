LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY part_c_tb IS
END ENTITY part_c_tb;

ARCHITECTURE arch_c_tb OF part_c_tb IS
    SIGNAL A, B : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL Cin : STD_LOGIC;
    SIGNAL F : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Cout : STD_LOGIC;

    COMPONENT part_c
        PORT (
            A, B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            Sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            Cin : IN STD_LOGIC;
            F : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            Cout : OUT STD_LOGIC
        );
    END COMPONENT;

BEGIN
    DUT : part_c
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
        A <= "11110000";
        Cin <= '0';
        Sel <= "00";
        WAIT FOR 10 ps;
        IF (F = "11100000" AND Cout = '1') THEN
            REPORT "Test Case 1 Passed: Logic shift left output is correct"
                SEVERITY note;
        ELSE
            REPORT "Test Case 1 Failed:"
                SEVERITY error;
        END IF;

        A <= "11110000";
        Cin <= '0';
        Sel <= "01";
        WAIT FOR 10 ps;
        IF (F = "11100001" AND Cout = '1') THEN
            REPORT "Test Case 2 Passed: 11100001 output is correct"
                SEVERITY note;
        ELSE
            REPORT "Test Case 2 Failed:"
                SEVERITY error;
        END IF;
        A <= "11110000";
        Cin <= '0';
        Sel <= "10";
        WAIT FOR 10 ps;
        IF (F = "11100000" AND Cout = '1') THEN
            REPORT "Test Case 3 Passed: Rotate left with Cin output is correct"
                SEVERITY note;
        ELSE
            REPORT "Test Case 3 Failed:"
                SEVERITY error;
        END IF;

        A <= "11110000";
        Cin <= '0';
        Sel <= "11";
        WAIT FOR 10 ps;
        IF (F = "00000000" AND Cout = '0') THEN
            REPORT "Test Case 4 Passed: "
                SEVERITY note;
        ELSE
            REPORT "Test Case 4 Failed:"
                SEVERITY error;
        END IF;

        WAIT;
    END PROCESS;
END ARCHITECTURE arch_c_tb;