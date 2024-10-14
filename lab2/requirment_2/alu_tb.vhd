LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY alu_tb IS
GENERIC (N : integer := 8);
END ENTITY alu_tb;

ARCHITECTURE arch_alu_tb OF alu_tb IS
	SIGNAL A, B : STD_LOGIC_VECTOR(n - 1 DOWNTO 0);
	SIGNAL Sel : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL Cin : STD_LOGIC;
	SIGNAL F : STD_LOGIC_VECTOR(n - 1 DOWNTO 0);
	SIGNAL Cout : STD_LOGIC;

	COMPONENT alu
		GENERIC (n : INTEGER := N);
		PORT (
			A, B : IN STD_LOGIC_VECTOR(n - 1 DOWNTO 0);
			Sel : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			Cin : IN STD_LOGIC;
			F : OUT STD_LOGIC_VECTOR(n - 1 DOWNTO 0);
			Cout : OUT STD_LOGIC
		);
	END COMPONENT;
BEGIN

	DUT : COMPONENT alu GENERIC MAP(
		n => N) PORT MAP(
		A => A,
		B => B,
		Sel => Sel,
		Cin => Cin,
		F => F,
		Cout => Cout
	);

	PROCESS
		VARIABLE ALU_OUT : STD_LOGIC_VECTOR(n DOWNTO 0);

	BEGIN
		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		B <= (7 DOWNTO 0 => x"B0", OTHERS => '0');
		Sel <= "0100";
		WAIT FOR 10 ns;
		IF (F = (A XOR B) AND Cout = '0') THEN
			REPORT "Test Case 1 Passed: A XOR B output is correct"
				SEVERITY note;
		ELSE
			REPORT "Test Case 1 Failed:"
				SEVERITY error;
		END IF;

		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		B <= (7 DOWNTO 0 => x"0B", OTHERS => '0');
		Sel <= "0101";
		WAIT FOR 10 ns;
		IF (F = (A NAND B) AND Cout = '0') THEN
			REPORT "Test Case 2 Passed: A NAND B output is correct"
				SEVERITY note;
		ELSE
			REPORT "Test Case 2 Failed"
				SEVERITY error;
		END IF;

		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		B <= (7 DOWNTO 0 => x"B0", OTHERS => '0');
		Sel <= "0110";
		WAIT FOR 10 ns;
		IF (F = (A OR B) AND Cout = '0') THEN
			REPORT "Test Case 3 Passed: A OR B output is correct"
				SEVERITY note;
		ELSE
			REPORT "Test Case 3 Failed"
				SEVERITY error;
		END IF;

		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		B <= (7 DOWNTO 0 => x"0B", OTHERS => '0');
		Sel <= "0111";
		WAIT FOR 10 ns;
		IF (F = (NOT A) AND Cout = '0') THEN
			REPORT "Test Case 4 Passed: NOT A output is correct"
				SEVERITY note;
		ELSE
			REPORT "Test Case 4 Failed"
				SEVERITY error;
		END IF;

		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		Cin <= '0';
		Sel <= "1000";
		WAIT FOR 10 ns;
		IF (F <= A(n - 2 DOWNTO 0) & "0" AND Cout <= A(n - 1)) THEN
			REPORT "Test Case 5 Passed: Logic shift left output is correct"
				SEVERITY note;
		ELSE
			REPORT "Test Case 5 Failed"
				SEVERITY error;
		END IF;

		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		Cin <= '0';
		Sel <= "1001";
		WAIT FOR 10 ns;
		IF (F = A(n - 2 DOWNTO 0) & A(7) AND Cout = A(n - 1)) THEN
			REPORT "Test Case 6 Passed: Rotate left output is correct"
				SEVERITY note;
		ELSE
			REPORT "Test Case 6 Failed"
				SEVERITY error;
		END IF;

		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		Cin <= '0';
		Sel <= "1010";
		WAIT FOR 10 ns;
		IF (F = (A(n - 2 DOWNTO 0) & cin) AND Cout = A(n - 1)) THEN
			REPORT "Test Case 7 Passed: Rotate left with Cin output is correct"
				SEVERITY note;
		ELSE
			REPORT "Test Case 7 Failed"
				SEVERITY error;
		END IF;

		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		Cin <= '0';
		Sel <= "1011";
		WAIT FOR 10 ns;
		IF (F = "00000000" AND Cout = '0') THEN
			REPORT "Test Case 8 Passed: F = 0000 output is correct"
				SEVERITY note;
		ELSE
			REPORT "Test Case 8 Failed"
				SEVERITY error;
		END IF;

		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		Cin <= '0';
		Sel <= "1100";
		WAIT FOR 10 ns;
		IF (F = ('0' & A(n - 1 DOWNTO 1)) AND Cout = A(0)) THEN
			REPORT "Test Case 9 Passed: Output is correct"
				SEVERITY note;
		ELSE
			REPORT "Test Case 9 Failed"
				SEVERITY error;
		END IF;

		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		Cin <= '0';
		Sel <= "1101";
		WAIT FOR 10 ns;
		IF (F = ('0' & A(n - 1 DOWNTO 1)) AND Cout = A(0)) THEN
			REPORT "Test Case 10 Passed: Output is correct"
				SEVERITY note;
		ELSE
			REPORT "Test Case 10 Failed"
				SEVERITY error;
		END IF;

		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		Cin <= '0';
		Sel <= "1110";
		WAIT FOR 10 ns;
		IF (F = Cin & A(n - 1 DOWNTO 1) AND Cout = A(0)) THEN
			REPORT "Test Case 11 Passed: Output is correct"
				SEVERITY note;
		ELSE
			REPORT "Test Case 11 Failed"
				SEVERITY error;
		END IF;

		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		Cin <= '0';
		Sel <= "1111";
		WAIT FOR 10 ns;
		IF (F = A(7) & A(n - 1 DOWNTO 1) AND Cout = Cin) THEN
			REPORT "Test Case 12 Passed: F = 11111000 output is correct"
				SEVERITY note;
		ELSE
			REPORT "Test Case 12 Failed"
				SEVERITY error;
		END IF;

		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		Cin <= '1';
		Sel <= "1010";
		WAIT FOR 10 ns;
		IF (F = (A(n - 2 DOWNTO 0) & cin) AND Cout = A(n - 1)) THEN
			REPORT "Test Case 13 Passed:"
				SEVERITY note;
		ELSE
			REPORT "Test Case 13 Failed"
				SEVERITY error;
		END IF;

		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		Cin <= '1';
		Sel <= "1110";
		WAIT FOR 10 ns;
		IF (F = (Cin & A(n - 1 DOWNTO 1)) AND Cout = A(0)) THEN
			REPORT "Test Case 14 Passed:"
				SEVERITY note;
		ELSE
			REPORT "Test Case 14 Failed"
				SEVERITY error;
		END IF;

		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		B <= (7 DOWNTO 0 => x"B0", OTHERS => '0');
		Cin <= '0';
		Sel <= "0000";
		WAIT FOR 50 ns;
		IF (F = A AND Cout = '0') THEN
			REPORT "Test Case 15 Passed"
				SEVERITY note;
		ELSE
			REPORT "Test Case 15 Failed:"
				SEVERITY error;
		END IF;

		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		B <= (7 DOWNTO 0 => x"B0", OTHERS => '0');
		Cin <= '0';
		Sel <= "0001";
		WAIT FOR 50 ns;
		ALU_OUT := ('0' & A) + ('0' & B); -- Adding an extra 0 to handle the carry-out
		IF (F = ALU_OUT(n - 1 DOWNTO 0) AND Cout = ALU_OUT(n)) THEN
			REPORT "Test Case 16 Passed"
				SEVERITY note;
		ELSE
			REPORT "Test Case 16 Failed:"
				SEVERITY error;
		END IF;

		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		B <= (7 DOWNTO 0 => x"B0", OTHERS => '0');
		Cin <= '0';
		Sel <= "0010";
		WAIT FOR 50 ns;
		ALU_OUT := ('0' & A) + ("0" & NOT(B)); -- Adding an extra 0 to handle the carry-out
		IF (F = ALU_OUT(n - 1 DOWNTO 0) AND Cout = ALU_OUT(n)) THEN
			REPORT "Test Case 17 Passed"
				SEVERITY note;
		ELSE
			REPORT "Test Case 17 Failed:" & STD_LOGIC'image(Cout)
				SEVERITY error;
		END IF;

		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		B <= (7 DOWNTO 0 => x"B0", OTHERS => '0');
		Cin <= '0';
		Sel <= "0011";
		WAIT FOR 50 ns;
		ALU_OUT := ('0' & A) + ("0" & x"FF");
		IF (F = ALU_OUT(n - 1 DOWNTO 0) AND Cout = ALU_OUT(n)) THEN
			REPORT "Test Case 18 Passed"
				SEVERITY note;
		ELSE
			REPORT "Test Case 18 Failed:" & STD_LOGIC'image(Cout)
				SEVERITY error;
		END IF;

		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		B <= (7 DOWNTO 0 => x"B0", OTHERS => '0');
		Cin <= '1';
		Sel <= "0000";
		WAIT FOR 50 ns;
		ALU_OUT := ('0' & A) + ("0" & x"01");
		IF (F = ALU_OUT(n - 1 DOWNTO 0) AND Cout = ALU_OUT(n)) THEN
			REPORT "Test Case 19 Passed"
				SEVERITY note;
		ELSE
			REPORT "Test Case 19 Failed:" & STD_LOGIC'image(ALU_OUT(n))
				SEVERITY error;
		END IF;

		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		B <= (7 DOWNTO 0 => x"B0", OTHERS => '0');
		Cin <= '1';
		Sel <= "0001";
		WAIT FOR 50 ns;
		ALU_OUT := ('0' & A) + ('0' & B) + ("0" & x"01");
		IF (F = ALU_OUT(n - 1 DOWNTO 0) AND Cout = ALU_OUT(n)) THEN
			REPORT "Test Case 20 Passed"
				SEVERITY note;
		ELSE
			REPORT "Test Case 20 Failed:"
				SEVERITY error;
		END IF;

		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		B <= (7 DOWNTO 0 => x"B0", OTHERS => '0');
		Cin <= '1';
		Sel <= "0010";
		WAIT FOR 50 ns;
		ALU_OUT := ('0' & A) + ("0" & NOT B) + Cin;
		IF (F = ALU_OUT(n - 1 DOWNTO 0) AND Cout = ALU_OUT(n)) THEN
			REPORT "Test Case 21 Passed"
				SEVERITY note;
		ELSE
			REPORT "Test Case 21 Failed:" & to_hstring(ALU_OUT)
				SEVERITY error;
		END IF;

		A <= (7 DOWNTO 0 => x"F0", OTHERS => '0');
		B <= (7 DOWNTO 0 => x"B0", OTHERS => '0');
		Cin <= '1';
		Sel <= "0011";
		WAIT FOR 50 ns;
		ALU_OUT := ('0' & B);
		IF (F = ALU_OUT(n - 1 DOWNTO 0) AND Cout = ALU_OUT(n)) THEN
			REPORT "Test Case 22 Passed"
				SEVERITY note;
		ELSE
			REPORT "Test Case 22 Failed:"
				SEVERITY error;
		END IF;
		WAIT;
	END PROCESS;

END ARCHITECTURE arch_alu_tb;