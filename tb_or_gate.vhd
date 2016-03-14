----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    TB_or_gate
-- Module Name:    TB_or_gate
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple test bench for the simple or gate
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

entity tb_or_gate is
    Generic (
		PERIOD : time := 10 ns
    );
end tb_or_gate;

architecture Behavioral of tb_or_gate is

component or_gate
    Port ( 
        a : in  STD_LOGIC;
        b : in  STD_LOGIC;
        c : out  STD_LOGIC
    );
end component;

signal test_bench_finish : STD_LOGIC := '0';
constant tb_delay : time := (3*PERIOD/4);

signal test_a : STD_LOGIC;
signal test_b : STD_LOGIC;
signal test_c : STD_LOGIC;

begin

test : or_gate
Port Map(test_a, test_b, test_c);

process
variable true_a : STD_LOGIC;
variable true_b : STD_LOGIC;
variable true_c : STD_LOGIC;
begin
    test_a <= '0';
    test_b <= '0';
	 wait for tb_delay;
	 wait for PERIOD/2;
    true_a := '0';
    true_b := '0';
	 true_c := true_a or true_b;
	 assert true_c = test_c report "Error OR gate" severity FAILURE;
	 wait for PERIOD/2;
    test_a <= '0';
    test_b <= '1';
	 wait for PERIOD/2;
    true_a := '0';
    true_b := '1';
	 true_c := true_a or true_b;
	 assert true_c = test_c report "Error OR gate" severity FAILURE;
	 wait for PERIOD/2;
    test_a <= '1';
    test_b <= '1';
	 wait for PERIOD/2;
    true_a := '1';
    true_b := '1';
	 true_c := true_a or true_b;
	 assert true_c = test_c report "Error OR gate" severity FAILURE;
	 wait for PERIOD/2;
    test_a <= '1';
    test_b <= '0';
	 wait for PERIOD/2;
    true_a := '1';
    true_b := '0';
	 true_c := true_a or true_b;
	 assert true_c = test_c report "Error OR gate" severity FAILURE;
	 wait for PERIOD/2;
	 test_bench_finish <= '1';
	 wait;
end process;


end Behavioral;

