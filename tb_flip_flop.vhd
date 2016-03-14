----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    TB_flip_flop
-- Module Name:    TB_flip_flop 
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple test bench for the simple flip flop
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

entity tb_flip_flop is
    Generic (
		PERIOD : time := 10 ns
    );
end tb_flip_flop;

architecture Behavioral of tb_flip_flop is

component flip_flop
    Port (
        d : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        ce : in  STD_LOGIC;
		  rst : in  STD_LOGIC;
        q : out  STD_LOGIC
    );
end component;

signal clk : STD_LOGIC := '0';
signal test_bench_finish : STD_LOGIC := '0';
signal clk_generator_finish : STD_LOGIC := '0';
constant tb_delay : time := (3*PERIOD/4);

signal test_d : STD_LOGIC;
signal test_ce : STD_LOGIC;
signal test_rst : STD_LOGIC;
signal test_q : STD_LOGIC;

begin

test : flip_flop
    Port Map(
        d => test_d,
        clk => clk,
        ce => test_ce,
		  rst => test_rst,
        q => test_q
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
		test_d <= '0';
		test_ce <= '0';
		test_rst <= '1';
		wait for tb_delay;
		wait for PERIOD/2;
		test_d <= '0';
		test_ce <= '1';
		test_rst <= '1';
		wait for PERIOD;
		assert test_q = '0' report "Error in Flip Flop writing 0" severity FAILURE;
      test_d <= '1';
		test_ce <= '1';
		wait for PERIOD;
		assert test_q = '1' report "Error in Flip Flop writing 1" severity FAILURE;
      test_d <= '0';
		test_ce <= '0';
		wait for PERIOD;
		assert test_q = '1' report "Error in Flip Flop clock enable disabled" severity FAILURE;
		wait for PERIOD;
		test_rst <= '0';
		wait for PERIOD;
		assert test_q = '0' report "Error in Flip Flop reset" severity FAILURE;
		wait for PERIOD;
	   test_rst <= '1';
		clk_generator_finish <= '1';
		test_bench_finish <= '1';
    wait;
end process;

end Behavioral;