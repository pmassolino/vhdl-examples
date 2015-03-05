----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    TB_xor_gate
-- Module Name:    TB_xor_gate
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple test bench for the simple XOR gate
--
-- Dependencies:
-- VHDL-93
--
-- Revision: 
-- Revision 1.0
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;

entity tb_xor_gate is
    Generic (
		PERIOD : time := 10 ns
    );
end tb_xor_gate;

architecture Behavioral of tb_xor_gate is

component xor_gate
    Port ( 
        a : in  STD_LOGIC_VECTOR(7 downto 0);
        b : in  STD_LOGIC_VECTOR(7 downto 0);
        c : out  STD_LOGIC_VECTOR(7 downto 0)
    );
end component;

signal test_bench_finish : STD_LOGIC := '0';

signal test_a : STD_LOGIC_VECTOR(7 downto 0);
signal test_b : STD_LOGIC_VECTOR(7 downto 0);
signal test_c : STD_LOGIC_VECTOR(7 downto 0);

begin

test : xor_gate
Port Map(
    a => test_a,
    b => test_b,
    c => test_c
);

process
variable true_a : STD_LOGIC_VECTOR(7 downto 0);
variable true_b : STD_LOGIC_VECTOR(7 downto 0);
variable true_c : STD_LOGIC_VECTOR(7 downto 0);
begin
    test_a <= X"00";
    test_b <= X"00";
	 wait for PERIOD/2;
    true_a := X"00";
    true_b := X"00";
	 true_c := true_a xor true_b;
	 assert true_c = test_c report "Error in XOR gate" severity FAILURE;
	 wait for PERIOD/2;
    test_a <= X"00";
    test_b <= X"AA";
	 wait for PERIOD/2;
    true_a := X"00";
    true_b := X"AA";
	 true_c := true_a xor true_b;
	 assert true_c = test_c report "Error in XOR gate" severity FAILURE;
	 wait for PERIOD/2;
    test_a <= X"AA";
    test_b <= X"55";
	 wait for PERIOD/2;
    true_a := X"AA";
    true_b := X"55";
	 true_c := true_a xor true_b;
	 assert true_c = test_c report "Error in XOR gate" severity FAILURE;
	 wait for PERIOD/2;
    test_a <= X"B5";
    test_b <= X"39";
	 wait for PERIOD/2;
    true_a := X"B5";
    true_b := X"39";
	 true_c := true_a xor true_b;
	 assert true_c = test_c report "Error in XOR gate" severity FAILURE;
	 wait for PERIOD/2;
    test_a <= X"DC";
    test_b <= X"76";
	 wait for PERIOD/2;
    true_a := X"DC";
    true_b := X"76";
	 true_c := true_a xor true_b;
	 assert true_c = test_c report "Error in XOR gate" severity FAILURE;
	 wait for PERIOD/2;
	 test_bench_finish <= '1';
	 wait;
end process;


end Behavioral;