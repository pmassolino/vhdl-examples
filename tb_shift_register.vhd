----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    TB_shift_register
-- Module Name:    TB_shift_register
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple test bench for the simple shift register
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

entity tb_shift_register is
    Generic (
		PERIOD : time := 10 ns
    );
end tb_shift_register;

architecture Behavioral of tb_shift_register is

component shift_register
    Port (
        d : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        q : out  STD_LOGIC
    );
end component;

signal clk : STD_LOGIC := '0';
signal clk_generator_finish : STD_LOGIC := '0';
signal test_bench_finish : STD_LOGIC := '0';
constant tb_delay : time := (3*PERIOD/4);

signal test_d : STD_LOGIC;
signal test_q : STD_LOGIC;

signal true_q : STD_LOGIC;

begin

test : shift_register
    Port Map(
        d => test_d,
        clk => clk,
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
		wait for tb_delay;
		wait for PERIOD/2;
		test_d <= '0';
		wait for PERIOD*5;
		true_q <= '0';
		assert test_q = '0' report "Error in Shift Register writing 0" severity FAILURE;
      test_d <= '1';
		wait for PERIOD;
		true_q <= '0';
		assert test_q = '0' report "Error in Shift Register writing 0" severity FAILURE;
      test_d <= '0';
		wait for PERIOD;
		true_q <= '0';
		assert test_q = '0' report "Error in Shift Register writing 0" severity FAILURE;
      test_d <= '1';
		wait for PERIOD;
		true_q <= '0';
		assert test_q = '0' report "Error in Shift Register writing 0" severity FAILURE;
      test_d <= '0';
		wait for PERIOD;
		true_q <= '0';
		assert test_q = '0' report "Error in Shift Register writing 0" severity FAILURE;
      test_d <= '1';
		wait for PERIOD;
		true_q <= '1';
		assert test_q = '1' report "Error in Shift Register writing 1" severity FAILURE;
      test_d <= '1';
		wait for PERIOD;
		true_q <= '0';
		assert test_q = '0' report "Error in Shift Register writing 0" severity FAILURE;
      test_d <= '0';
		wait for PERIOD;
		true_q <= '1';
		assert test_q = '1' report "Error in Shift Register writing 1" severity FAILURE;
      test_d <= '0';
		wait for PERIOD;
		true_q <= '0';
		assert test_q = '0' report "Error in Shift Register writing 0" severity FAILURE;
      test_d <= '0';
		wait for PERIOD;
		true_q <= '1';
		assert test_q = '1' report "Error in Shift Register writing 1" severity FAILURE;
      test_d <= '0';
		wait for PERIOD;
		clk_generator_finish <= '1';
		wait for PERIOD;
		assert test_q = '1' report "Error in Shift Register clock" severity FAILURE;
		wait for PERIOD;
		assert test_q = '1' report "Error in Shift Register clock" severity FAILURE;
		test_bench_finish <= '1';
    wait;
end process;

end Behavioral;