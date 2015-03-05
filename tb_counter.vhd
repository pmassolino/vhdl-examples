----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    TB_counter
-- Module Name:    TB_counter 
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple test bench for the simple counter
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

entity tb_counter is
    Generic (
		PERIOD : time := 10 ns
    );
end tb_counter;

architecture Behavioral of tb_counter is

component counter
    Port(
	     d : in STD_LOGIC_VECTOR(9 downto 0);
		  clk : in STD_LOGIC;
		  ce : in STD_LOGIC;
		  load : in STD_LOGIC;
		  rst : in STD_LOGIC;
		  q : out STD_LOGIC_VECTOR(9 downto 0)
	 );
end component;

signal clk : STD_LOGIC := '0';
signal clk_generator_finish : STD_LOGIC := '0';
signal test_bench_finish : STD_LOGIC := '0';

signal test_d : STD_LOGIC_VECTOR(9 downto 0);
signal test_ce : STD_LOGIC;
signal test_load : STD_LOGIC;
signal test_rst : STD_LOGIC;
signal test_q : STD_LOGIC_VECTOR(9 downto 0);

begin

test : counter
    Port Map(
        d => test_d,
        clk => clk,
        ce => test_ce,
		  load => test_load,
		  rst => test_rst,
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
		wait for PERIOD/2;
		test_d <= "00" & X"00";
		test_ce <= '0';
		test_rst <= '0';
		test_load <= '0';
		wait for PERIOD;
		assert test_q = "00" & X"00" report "Error in Counter Reset" severity FAILURE;
		test_ce <= '1';
		test_rst <= '1';
		test_load <= '0';
		wait for PERIOD;
		assert test_q = "00" & X"01" report "Error in Counter" severity FAILURE;
      test_d <= "11" & X"58";
		test_load <= '1';
		wait for PERIOD;
		assert test_q = "11" & X"58" report "Error in Counter" severity FAILURE;
		test_load <= '0';
		wait for PERIOD;
		assert test_q = "11" & X"59" report "Error in Counter" severity FAILURE;
		clk_generator_finish <= '1';
		wait for PERIOD;
		assert test_q = "11" & X"59" report "Error in Counter" severity FAILURE;
		wait for PERIOD/2;
		test_bench_finish <= '1';
    wait;
end process;

end Behavioral;