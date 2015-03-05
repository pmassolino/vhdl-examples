----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    TB_state_machine
-- Module Name:    TB_state_machine 
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple test bench for the state machine
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

entity tb_state_machine is
    Generic (
		PERIOD : time := 10 ns
    );
end tb_state_machine;

architecture Behavioral of tb_state_machine is

component state_machine
    Port (
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
        i : in  STD_LOGIC;
        j : in  STD_LOGIC;
        q : out  STD_LOGIC_VECTOR (2 downto 0)
    );
end component;

signal clk : STD_LOGIC := '0';
signal clk_generator_finish : STD_LOGIC := '0';
signal test_bench_finish : STD_LOGIC := '0';

signal test_rst : STD_LOGIC;
signal test_i : STD_LOGIC;
signal test_j : STD_LOGIC;
signal test_q : STD_LOGIC_VECTOR(2 downto 0);

begin

test : state_machine
    Port Map(
        clk => clk,
		  rst => test_rst,
        i => test_i,
		  j => test_j,
        q => test_q
    );

clock : process
begin
    while ( clk_generator_finish /= '1') loop
       clk <= not clk;
       wait for PERIOD/2;
    end loop;
    wait;
end process;


process
    begin
		test_rst <= '1';
		wait for PERIOD/2;
		assert test_q = "001" report "Error in State Machine" severity FAILURE;
		test_rst <= '0';
		test_i <= '0';
		test_j <= '0';
		wait for PERIOD;
		assert test_q = "110" report "Error in State Machine" severity FAILURE;
 		test_i <= '1';
		test_j <= '0';
		wait for PERIOD;
		assert test_q = "101" report "Error in State Machine" severity FAILURE;
 		test_i <= '1';
		test_j <= '1';
		wait for PERIOD;
		assert test_q = "010" report "Error in State Machine" severity FAILURE;
 		test_i <= '1';
		test_j <= '1';
		wait for PERIOD;
		assert test_q = "011" report "Error in State Machine" severity FAILURE;
 		test_i <= '0';
		test_j <= '1';
		wait for PERIOD;
		assert test_q = "000" report "Error in State Machine" severity FAILURE;
 		test_i <= '0';
		test_j <= '0';
		wait for PERIOD;
		assert test_q = "100" report "Error in State Machine" severity FAILURE;
 		test_i <= '1';
		test_j <= '0';
		wait for PERIOD;
		assert test_q = "111" report "Error in State Machine" severity FAILURE;
		clk_generator_finish <= '1';
		wait for PERIOD;
		assert test_q = "111" report "Error in State Machine" severity FAILURE;
		wait for PERIOD/2;
		test_bench_finish <= '1';
    wait;
end process;

end Behavioral;