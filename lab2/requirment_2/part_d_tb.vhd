LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY part_d_tb IS
END ENTITY part_d_tb;

ARCHITECTURE arch_d_tb OF part_d_tb IS

	SIGNAL A, B : std_logic_vector(7 DOWNTO 0);
	SIGNAL Sel  : std_logic_vector(1 DOWNTO 0);
	SIGNAL Cin  : std_logic;
	SIGNAL F : std_logic_vector(7 DOWNTO 0);
	SIGNAL Cout : std_logic;

	COMPONENT part_d
		PORT (
			A, B : IN std_logic_vector(7 DOWNTO 0);
			Sel  : IN std_logic_vector(1 DOWNTO 0);
			Cin  : IN std_logic ;
			F : OUT std_logic_vector(7 DOWNTO 0);
			Cout : OUT std_logic
		);
	END COMPONENT;

BEGIN
	DUT: part_d
		PORT MAP (
			A => A,
			B => B,
			Sel => Sel,
			Cin => Cin,
			F => F,
			Cout => Cout
		);

	PROCESS
	BEGIN
		A <= "11110000"; Cin <= '0'; Sel <= "00";  
		WAIT FOR 10 ps;
		IF (F = "11110000" AND Cout = '0') THEN
			REPORT "Test Case 1 Passed:"
			SEVERITY note;
		ELSE
			REPORT "Test Case 1 Failed:"
			SEVERITY error;
		END IF;

		A <= "11110000"; Cin <= '0'; Sel <= "01";  
		WAIT FOR 10 ps;
		IF (F = "11110000" AND Cout = '0') THEN
			REPORT "Test Case 2 Passed:"
			SEVERITY note;
		ELSE
			REPORT "Test Case 2 Failed:"
			SEVERITY error;
		END IF;


		A <= "11110000"; Cin <= '0'; Sel <= "10"; 
		WAIT FOR 10 ps;
		if (F = "11110000" AND Cout = '0') THEN
			REPORT "Test Case 3 Passed:"
			SEVERITY note;
		ELSE
			REPORT "Test Case 3 Failed:"
			SEVERITY error;
		END IF;

		A <= "11110000"; Cin <= '0'; Sel <= "11";  
		WAIT FOR 10 ps;
		if (F = "11111000" AND Cout = '0') THEN
			REPORT "Test Case 4 Passed: "
			SEVERITY note;
		ELSE
			REPORT "Test Case 4 Failed:"
			SEVERITY error;
		END IF;

		WAIT;
	END PROCESS;

END ARCHITECTURE arch_d_tb;

