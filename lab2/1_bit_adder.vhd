LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY my_adder IS -- single bit adder 
    PORT (
        A, B, Cin : IN STD_LOGIC;
        F, Cout : OUT STD_LOGIC);
END my_adder;

ARCHITECTURE a_my_adder OF my_adder IS BEGIN
    F <= A XOR B XOR Cin;
    Cout <= (A AND B) OR (Cin AND (A XOR B));
END a_my_adder;