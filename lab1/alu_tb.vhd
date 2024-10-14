LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY alu_tb IS
END ENTITY alu_tb;

ARCHITECTURE arch_alu_tb OF alu_tb IS

	SIGNAL A, B : std_logic_vector(7 DOWNTO 0);
	SIGNAL Sel  : std_logic_vector(3 DOWNTO 0);
	SIGNAL Cin  : std_logic;
	SIGNAL F : std_logic_vector(7 DOWNTO 0);
	SIGNAL Cout : std_logic;

	COMPONENT alu
		PORT (
			A, B : IN std_logic_vector(7 DOWNTO 0);
			Sel  : IN std_logic_vector(3 DOWNTO 0);
			Cin  : IN std_logic ;
			F : OUT std_logic_vector(7 DOWNTO 0);
			Cout : OUT std_logic
		);
	END COMPONENT;

BEGIN

	DUT: alu
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
		A <= "11110000"; B <= "10110000"; Sel <= "0100";
		WAIT FOR 10 ns;
		IF (F = (A xor B) AND Cout = '0') THEN
			REPORT "Test Case 1 Passed: A XOR B output is correct"
			SEVERITY note;
		ELSE
			REPORT "Test Case 1 Failed:"
			SEVERITY error;
		END IF;

		A <= "11110000"; B <= "00001011"; Sel <= "0101"; 
		WAIT FOR 10 ns;
		IF (F = (A nand B) AND Cout = '0') THEN
			REPORT "Test Case 2 Passed: A NAND B output is correct"
			SEVERITY note;
		ELSE
			REPORT "Test Case 2 Failed: Expected "
			SEVERITY error;
		END IF;

		A <= "11110000"; B <= "10110000"; Sel <= "0110"; 
		WAIT FOR 10 ns;
		if (F = (A or B) AND Cout = '0') THEN
			REPORT "Test Case 3 Passed: A OR B output is correct"
			SEVERITY note;
		ELSE
			REPORT "Test Case 3 Failed: Expected "
			SEVERITY error;
		END IF;

		A <= "11110000"; B <= "00001011"; Sel <= "0111"; 
		WAIT FOR 10 ns;
		if (F = (not A) AND Cout = '0') THEN
			REPORT "Test Case 4 Passed: NOT A output is correct"
			SEVERITY note;
		ELSE
			REPORT "Test Case 4 Failed: Expected "
			SEVERITY error;
		END IF;

		A <= "11110000"; Cin <= '0'; Sel <= "1000";
		WAIT FOR 10 ns;
		IF (F = "11100000" AND Cout = '1') THEN
			REPORT "Test Case 5 Passed: Logic shift left output is correct"
			SEVERITY note;
		ELSE
			REPORT "Test Case 5 Failed: Expected 11100000 but got "
			SEVERITY error;
		END IF;

		A <= "11110000"; Cin <= '0'; Sel <= "1001";  
		WAIT FOR 10 ns;
		IF (F = "11100001" AND Cout = '1') THEN
			REPORT "Test Case 6 Passed: Rotate left output is correct"
			SEVERITY note;
		ELSE
			REPORT "Test Case 6 Failed: Expected 11100001 but got "
			SEVERITY error;
		END IF;

		A <= "11110000"; Cin <= '0'; Sel <= "1010"; 
		WAIT FOR 10 ns;
		if (F = "11100000" AND Cout = '1') THEN
			REPORT "Test Case 7 Passed: Rotate left with Cin output is correct"
			SEVERITY note;
		ELSE
			REPORT "Test Case 7 Failed: Expected 11100000 but got "
			SEVERITY error;
		END IF;

		A <= "11110000"; Cin <= '0'; Sel <= "1011";  
		WAIT FOR 10 ns;
		if (F = "00000000" AND Cout = '0') THEN
			REPORT "Test Case 8 Passed: F = 0000 output is correct"
			SEVERITY note;
		ELSE
			REPORT "Test Case 8 Failed: Expected 00000000 but got "
			SEVERITY error;
		END IF;

		WAIT FOR 10 ns;
		IF (F = "01111000" AND Cout = '0') THEN
			REPORT "Test Case 9 Passed: Output is correct"
			SEVERITY note;
		ELSE
			REPORT "Test Case 9 Failed: Expected 11110000 but got "
			SEVERITY error;
		END IF;

		A <= "11110000"; Cin <= '0'; Sel <= "1101";  
		WAIT FOR 10 ns;
		IF (F = "01111000" AND Cout = '0') THEN
			REPORT "Test Case 10 Passed: Output is correct"
			SEVERITY note;
		ELSE
			REPORT "Test Case 10 Failed: Expected 11110000 but got "
			SEVERITY error;
		END IF;

		A <= "11110000"; Cin <= '0'; Sel <= "1110"; 
		WAIT FOR 10 ns;
		if (F = "01111000" AND Cout = '0') THEN
			REPORT "Test Case 11 Passed: Output is correct"
			SEVERITY note;
		ELSE
			REPORT "Test Case 11 Failed: Expected 11110000 but got "
			SEVERITY error;
		END IF;

		A <= "11110000"; Cin <= '0'; Sel <= "1111";  
		WAIT FOR 10 ns;
		if (F = "11111000" AND Cout = '0') THEN
			REPORT "Test Case 12 Passed: F = 11111000 output is correct"
			SEVERITY note;
		ELSE
			REPORT "Test Case 12 Failed: Expected 11111000 but got " 
			SEVERITY error;
		END IF;

		A <= "11110000"; Cin <= '1'; Sel <= "1010";  
		WAIT FOR 10 ns;
		if (F = "11100001" AND Cout = '1') THEN
			REPORT "Test Case 13 Passed:"
			SEVERITY note;
		ELSE
			REPORT "Test Case 13 Failed"
			SEVERITY error;
		END IF;

		A <= "11110000"; Cin <= '1'; Sel <= "1110";  
		WAIT FOR 10 ns;
		if (F = "11111000" AND Cout = '0') THEN
			REPORT "Test Case 14 Passed:"
			SEVERITY note;
		ELSE
			REPORT "Test Case 14 Failed"
			SEVERITY error;
		END IF;

		WAIT;
	END PROCESS;

END ARCHITECTURE arch_alu_tb;

