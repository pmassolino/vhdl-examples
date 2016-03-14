----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    TB_not_gate
-- Module Name:    TB_not_gate
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple test bench for the simple NOT gate
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

entity tb_not_gate is
    Generic (
		PERIOD : time := 10 ns
    );
end tb_not_gate;

architecture Behavioral of tb_not_gate is

component not_gate
    Port ( 
        a : in  STD_LOGIC_VECTOR(5 downto 0);
        o : out  STD_LOGIC_VECTOR(5 downto 0)
    );
end component;

signal test_bench_finish : STD_LOGIC := '0';
constant tb_delay : time := (3*PERIOD/4);

signal test_a : STD_LOGIC_VECTOR(5 downto 0);
signal true_a : STD_LOGIC_VECTOR(5 downto 0);

signal test_o : STD_LOGIC_VECTOR(5 downto 0);
signal true_o : STD_LOGIC_VECTOR(5 downto 0);

begin

test : not_gate
Port Map(
    a => test_a,
    o => test_o
);

true_o <= not true_a;

process
begin
    test_a <= "000000";
    true_a <= "000000";
	 wait for tb_delay;
	 wait for PERIOD/2;
	 assert true_o = test_o report "Error in XOR gate" severity FAILURE;
	 wait for PERIOD/2;
    test_a <= "111111";
    true_a <= "111111";
	 wait for PERIOD/2;
    assert true_o = test_o report "Error in XOR gate" severity FAILURE;
	 wait for PERIOD/2;
    test_a <= "101010";
    true_a <= "101010";
	 wait for PERIOD/2;
	 assert true_o = test_o report "Error in XOR gate" severity FAILURE;
	 wait for PERIOD/2;
    test_a <= "010101";
    true_a <= "010101";
	 wait for PERIOD/2;
	 assert true_o = test_o report "Error in XOR gate" severity FAILURE;
	 wait for PERIOD/2;
    test_a <= "100111";
    true_a <= "100111";
	 wait for PERIOD/2;
	 assert true_o = test_o report "Error in XOR gate" severity FAILURE;
	 wait for PERIOD/2;
	 test_bench_finish <= '1';
	 wait;
end process;




end Behavioral;