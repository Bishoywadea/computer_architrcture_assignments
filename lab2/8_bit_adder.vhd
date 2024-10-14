LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY my_8adder IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        Cin : IN STD_LOGIC;
        F : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        Cout : OUT STD_LOGIC);
END my_8adder;

ARCHITECTURE a_my_8adder OF my_8adder IS
    COMPONENT my_adder IS PORT (A, B, Cin : IN STD_LOGIC;
        F, Cout : OUT STD_LOGIC);
    END COMPONENT;
    SIGNAL temp : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL temp_carry : STD_LOGIC;
BEGIN temp(0) <= cin;
    loop1 : FOR i IN 0 TO 6 GENERATE 
    fx : my_adder PORT MAP(A(i), B(i), temp(i), F(i), temp(i + 1));
    END GENERATE;
    fx_last : my_adder PORT MAP(A(7), B(7), temp(7), F(7), temp_carry);
    Cout <= temp_carry;
    END a_my_8adder;
