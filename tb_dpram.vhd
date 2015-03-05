----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    TB_RAM
-- Module Name:    TB_RAM
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple test bench for the simple RAM
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

entity tb_dpram is
    Generic (
		PERIOD : time := 10 ns
    );
end tb_dpram;

architecture Behavioral of tb_dpram is

component dpram
	Port (
		data_in_a : in STD_LOGIC_VECTOR(7 downto 0);
		data_in_b : in STD_LOGIC_VECTOR(7 downto 0);
		rw_a : in STD_LOGIC;
		rw_b : in STD_LOGIC;
		clk : in STD_LOGIC;
		address_a : in STD_LOGIC_VECTOR(9 downto 0);
		address_b : in STD_LOGIC_VECTOR(9 downto 0);
		data_out_a : out STD_LOGIC_VECTOR(7 downto 0);
		data_out_b : out STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

signal test_data_in_a : STD_LOGIC_VECTOR(7 downto 0);
signal test_data_in_b : STD_LOGIC_VECTOR(7 downto 0);
signal test_rw_a : STD_LOGIC;
signal test_rw_b : STD_LOGIC;
signal test_address_a : STD_LOGIC_VECTOR(9 downto 0);
signal test_address_b : STD_LOGIC_VECTOR(9 downto 0);
signal test_data_out_a : STD_LOGIC_VECTOR(7 downto 0);
signal test_data_out_b : STD_LOGIC_VECTOR(7 downto 0);

signal clk : STD_LOGIC := '0';
signal clk_generator_finish : STD_LOGIC := '0';

signal test_bench_finish : STD_LOGIC := '0';

begin

test : dpram
	Port Map(
		data_in_a => test_data_in_a,
		data_in_b => test_data_in_b,
		rw_a => test_rw_a,
		rw_b => test_rw_b,
		clk => clk,
		address_a => test_address_a,
		address_b => test_address_b,
		data_out_a => test_data_out_a,
		data_out_b => test_data_out_b
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
	test_data_in_a <= X"00";
	test_rw_a <= '1';
	test_address_a <= "00" & X"00";
	test_rw_b <= '0';
	test_address_b <= "00" & X"00";
	wait for PERIOD;
	test_address_a <= "00" & X"01";
	test_address_b <= "00" & X"00";
	wait for PERIOD;
	assert test_data_out_b = X"00" report "Error in DRAM" severity FAILURE;
	test_address_a <= "00" & X"02";
	test_address_b <= "00" & X"01";
	wait for PERIOD;
	assert test_data_out_b = X"00" report "Error in DRAM" severity FAILURE;
	test_address_a <= "00" & X"03";
	test_address_b <= "00" & X"02";
	wait for PERIOD;
	assert test_data_out_b = X"00" report "Error in DRAM" severity FAILURE;
	test_data_in_a <= X"FF";
	test_address_a <= "11" & X"FD";
	test_address_b <= "00" & X"03";
	wait for PERIOD;
	assert test_data_out_b = X"00" report "Error in DRAM" severity FAILURE;
	test_data_in_a <= X"FF";
	test_address_a <= "11" & X"FE";
	test_address_b <= "11" & X"FD";
	wait for PERIOD;
	assert test_data_out_b = X"FF" report "Error in DRAM" severity FAILURE;
	test_data_in_a <= X"FF";
	test_address_a <= "11" & X"FF";
	test_address_b <= "11" & X"FE";
	wait for PERIOD;
	assert test_data_out_b = X"FF" report "Error in DRAM" severity FAILURE;
	test_rw_a <= '0';
	test_address_b <= "11" & X"FF";
	wait for PERIOD;
	assert test_data_out_b = X"FF" report "Error in DRAM" severity FAILURE;
   test_bench_finish <= '1';
	clk_generator_finish <= '1';
	wait for PERIOD;
	wait;
end process;


end Behavioral;