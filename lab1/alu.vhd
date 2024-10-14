LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY alu IS
	PORT (
		A, B : IN std_logic_vector(7 DOWNTO 0);
		Sel  : IN std_logic_vector(3 DOWNTO 0);
		Cin  : IN std_logic;
		F : OUT std_logic_vector(7 DOWNTO 0);
		Cout : OUT std_logic
	);
END ENTITY alu;

ARCHITECTURE arch_alu OF alu IS
	SIGNAL part_b_out, part_c_out, part_d_out : std_logic_vector(7 DOWNTO 0);
	SIGNAL part_b_Cout, part_c_Cout, part_d_Cout : std_logic;

	COMPONENT part_b IS
		PORT (
			A, B : IN std_logic_vector(7 DOWNTO 0);
			Sel  : IN std_logic_vector(1 DOWNTO 0);
			F : OUT std_logic_vector(7 DOWNTO 0);
			Cout : OUT std_logic
		);
	END COMPONENT;

	COMPONENT part_c IS
		PORT (
			A, B : IN std_logic_vector(7 DOWNTO 0);
			Sel  : IN std_logic_vector(1 DOWNTO 0);
			Cin  : IN std_logic;
			F : OUT std_logic_vector(7 DOWNTO 0);
			Cout : OUT std_logic
		);
	END COMPONENT;

	COMPONENT part_d IS
		PORT (
			A, B : IN std_logic_vector(7 DOWNTO 0);
			Sel  : IN std_logic_vector(1 DOWNTO 0);
			Cin  : IN std_logic;
			F : OUT std_logic_vector(7 DOWNTO 0);
			Cout : OUT std_logic
		);
	END COMPONENT;

BEGIN
	partb: part_b PORT MAP (
		A => A,
		B => B,
		Sel => Sel(1 DOWNTO 0),
		F => part_b_out,
		Cout => part_b_Cout
	);

	partc: part_c PORT MAP (
		A => A,
		B => B,
		Sel => Sel(1 DOWNTO 0),
		Cin => Cin,
		F => part_c_out,
		Cout => part_c_Cout
	);

	partd: part_d PORT MAP (
		A => A,
		B => B,
		Sel => Sel(1 DOWNTO 0),
		Cin => Cin,
		F => part_d_out,
		Cout => part_d_Cout
	);

	PROCESS(Sel, part_b_out, part_c_out, part_d_out)
	BEGIN
		CASE Sel(3 DOWNTO 2) IS
			WHEN "00" =>
				F <= (others => '0');
				Cout <= '0';
			WHEN "01" =>
				F <= part_b_out;
				Cout <= part_b_Cout;
			WHEN "10" =>
				F <= part_c_out;
				Cout <= part_c_Cout;
			WHEN "11" =>
				F <= part_d_out; 
				Cout <= part_d_Cout;
			WHEN OTHERS =>
				F <= (others => '0');
				Cout <= '0';
		END CASE;
	END PROCESS;

END ARCHITECTURE arch_alu;

