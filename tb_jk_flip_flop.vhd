----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    TB_jk_flip_flop
-- Module Name:    TB_jk_flip_flop 
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple test bench for the simple jk flip flop
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

entity tb_jk_flip_flop is
    Generic (
		PERIOD : time := 10 ns
    );
end tb_jk_flip_flop;

architecture Behavioral of tb_jk_flip_flop is

component jk_flip_flop
    Port (
        j : in  STD_LOGIC;
        k : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        q : out  STD_LOGIC;
        nq : out  STD_LOGIC
	 );
end component;

signal clk : STD_LOGIC := '0';
signal clk_generator_finish : STD_LOGIC := '0';
signal test_bench_finish : STD_LOGIC := '0';

signal test_j : STD_LOGIC;
signal test_k : STD_LOGIC;
signal test_q : STD_LOGIC;
signal test_nq : STD_LOGIC;

signal true_q : STD_LOGIC;
signal true_nq : STD_LOGIC;

begin

test : jk_flip_flop
    Port Map(
        j => test_j,
		  k => test_k,
        clk => clk,
        q => test_q,
		  nq => test_nq
    );

-- clk <= not clk after PERIOD/2;

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
		test_j <= '0';
		test_k <= '0';
		wait for PERIOD/2;
		test_j <= '0';
		test_k <= '1';
		true_q <= '0';
		true_nq <= '1';
		wait for PERIOD;
		assert test_q = true_q report "Error in JK Flip Flop writing 0" severity FAILURE;
		assert test_nq = true_nq report "Error in JK Flip Flop writing 0" severity FAILURE;
		test_j <= '0';
		test_k <= '0';
		true_q <= '0';
		true_nq <= '1';
		wait for PERIOD;
		assert test_q = true_q report "Error in Flip Flop keeping internal state" severity FAILURE;
		assert test_nq = true_nq report "Error in Flip Flop keeping internal state" severity FAILURE;
		test_j <= '1';
		test_k <= '1';
		true_q <= '1';
		true_nq <= '0';
		wait for PERIOD;
		assert test_q = true_q report "Error in Flip Flop inverting internal state" severity FAILURE;
		assert test_nq = true_nq report "Error in Flip Flop inverting internal state" severity FAILURE;
		test_j <= '1';
		test_k <= '0';
		true_q <= '1';
		true_nq <= '0';
		wait for PERIOD;
		assert test_q = true_q report "Error in Flip Flop writing 1" severity FAILURE;
		assert test_nq = true_nq report "Error in Flip Flop writing 1" severity FAILURE;
		test_j <= '0';
		test_k <= '0';
		true_q <= '1';
		true_nq <= '0';
		wait for PERIOD;
		assert test_q = true_q report "Error in Flip Flop keeping internal state" severity FAILURE;
		assert test_nq = true_nq report "Error in Flip Flop keeping internal state" severity FAILURE;
		test_j <= '1';
		test_k <= '1';
		true_q <= '0';
		true_nq <= '1';
		wait for PERIOD;
		assert test_q = true_q report "Error in Flip Flop inverting internal state" severity FAILURE;
		assert test_nq = true_nq report "Error in Flip Flop inverting internal state" severity FAILURE;
      clk_generator_finish <= '1';
		wait for PERIOD;
		test_j <= '1';
		test_k <= '1';
		true_q <= '0';
		true_nq <= '1';
		wait for PERIOD;
		assert test_q = true_q report "Error in Flip Flop should only work with clk" severity FAILURE;
		assert test_nq = true_nq report "Error in Flip Flop should only work with clk" severity FAILURE;
		wait for PERIOD/2;		
		test_bench_finish <= '1';
    wait;
end process;

end Behavioral;