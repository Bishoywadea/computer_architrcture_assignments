LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY alu IS
GENERIC (n : integer := 8);
	PORT (
		A, B : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		Sel : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		Cin : IN STD_LOGIC;
		F : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		Cout : OUT STD_LOGIC
	);
END ENTITY alu;

ARCHITECTURE arch_alu OF alu IS
	SIGNAL part_a_out, part_b_out, part_c_out, part_d_out : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
	SIGNAL part_a_Cout, part_b_Cout, part_c_Cout, part_d_Cout : STD_LOGIC;

	COMPONENT part_a
		generic(n :integer := n);

		PORT (
			A, B : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			Sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			Cin : IN STD_LOGIC;
			F : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			Cout : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT part_b IS
			generic(n :integer := n);

		PORT (
			A, B : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			Sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			F : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			Cout : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT part_c IS
			generic(n :integer := n);

		PORT (
			A, B : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			Sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			Cin : IN STD_LOGIC;
			F : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			Cout : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT part_d IS
			generic(n :integer := n);

		PORT (
			A, B : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			Sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			Cin : IN STD_LOGIC;
			F : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			Cout : OUT STD_LOGIC
		);
	END COMPONENT;

BEGIN
	parta : part_a GENERIC MAP (n) PORT MAP(
		A => A,
		B => B,
		Sel => Sel(1 DOWNTO 0),
		Cin => Cin,
		F => part_a_out,
		Cout => part_a_Cout
	);
	partb : part_b GENERIC MAP (n) PORT MAP(
		A => A,
		B => B,
		Sel => Sel(1 DOWNTO 0),
		F => part_b_out,
		Cout => part_b_Cout
	);

	partc : part_c GENERIC MAP (n) PORT MAP(
		A => A,
		B => B,
		Sel => Sel(1 DOWNTO 0),
		Cin => Cin,
		F => part_c_out,
		Cout => part_c_Cout
	);

	partd : part_d GENERIC MAP (n) PORT MAP(
		A => A,
		B => B,
		Sel => Sel(1 DOWNTO 0),
		Cin => Cin,
		F => part_d_out,
		Cout => part_d_Cout
	);

	PROCESS(Sel,part_a_out,part_b_out,part_d_out,part_a_Cout,part_c_out)
	BEGIN
		CASE Sel(3 DOWNTO 2) IS
			WHEN "00" =>
				F <= part_a_out;
				Cout <= part_a_Cout;
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
				F <= (OTHERS => '0');
				Cout <= '0';
		END CASE;
	END PROCESS;

END ARCHITECTURE arch_alu;