LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY part_a IS
GENERIC (n : integer := 8);
    PORT (
        A, B : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        Cin : IN STD_LOGIC; -- Global carry-in
        Sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- Control signals
        F : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0); -- Result
        Cout : OUT STD_LOGIC -- Global carry-out
    );
END part_a;

ARCHITECTURE arch_part_a OF part_a IS
    COMPONENT my_nadder IS
        PORT (
            A, B : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
            Cin : IN STD_LOGIC;
            F : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
            Cout : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL adder_a, adder_b : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
    SIGNAL adder_cin : STD_LOGIC;
    SIGNAL adder_result : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
    SIGNAL adder_cout : STD_LOGIC;

BEGIN
    -- Instantiate the 8-bit full adder
    adder_inst : my_nadder
    PORT MAP(
        A => adder_a,
        B => adder_b,
        Cin => adder_cin,
        F => adder_result,
        cout => adder_cout
    );

    -- Control logic to determine adder inputs based on S3, S2, S1, S0, and Cin
    PROCESS (A, b, Sel)
    BEGIN
        CASE (Sel) IS
            WHEN "00" => -- F = A if Cin=0, F = A + 1 if Cin=1
                adder_a <= A;
                adder_b <= (OTHERS => '0');
                adder_cin <= Cin;

            WHEN "01" => -- F = A + B if Cin=0, F = A + B + 1 if Cin=1
                adder_a <= A;
                adder_b <= B;
                adder_cin <= Cin;

            WHEN "10" => -- F = A - B - 1 if Cin=0, F = A - B if Cin=1
                adder_a <= A;
                adder_b <= NOT B ; -- Two's complement for subtraction
                adder_cin <= Cin;

            WHEN "11" => -- F = A - 1 if Cin=0, F = B if Cin=1
                IF Cin = '0' THEN
                    adder_a <= A;
                    adder_b <= (OTHERS => '1'); -- Setting adder_b to 11111111 to represent -1
                    adder_cin <= Cin;
                ELSE
                    adder_a <= (OTHERS => '0');
                    adder_b <= B ; -- No addition needed, so set adder_b to 0
                    adder_cin <= NOT Cin; -- Ensure no carry-in
                END IF;
                -- Add additional cases if needed

            WHEN OTHERS =>
                adder_a <= (OTHERS => '0');
                adder_b <= (OTHERS => '0');
                adder_cin <= '0';
        END CASE;
    END PROCESS;

    -- Output result and carry-out
    F <= adder_result;
    Cout <= adder_cout;

END arch_part_a;