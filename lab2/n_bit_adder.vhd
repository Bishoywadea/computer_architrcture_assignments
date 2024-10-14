LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY my_nadder IS
GENERIC (n : integer := 8);
    PORT (
        A, B : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        Cin : IN STD_LOGIC;
        F : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        Cout : OUT STD_LOGIC);
END my_nadder;

ARCHITECTURE a_my_nadder OF my_nadder IS
    COMPONENT my_adder IS PORT (A, B, Cin : IN STD_LOGIC;
        F, Cout : OUT STD_LOGIC);
    END COMPONENT;
    SIGNAL temp : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
BEGIN temp(0) <= Cin;
    loop1 : FOR i IN 0 TO n-2 GENERATE 
    fx : my_adder PORT MAP(A(i), B(i), temp(i), F(i), temp(i + 1));
    END GENERATE;
    fx : my_adder PORT MAP(A(n-1), B(n-1), temp(n-1), F(n-1), Cout);
    END a_my_nadder;
