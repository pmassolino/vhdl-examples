----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    TB_Mux_4x1
-- Module Name:    TB_Mux_4x1
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple test bench for the simple Mux 4x1
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

entity tb_mux4x1 is
    Generic (
		PERIOD : time := 10 ns
    );
end tb_mux4x1;

architecture Behavioral of tb_mux4x1 is

component mux4x1
    Port ( 
        a : in STD_LOGIC;
        b : in STD_LOGIC;
		  c : in STD_LOGIC;
		  d : in STD_LOGIC;
		  sel : in STD_LOGIC_VECTOR(1 downto 0);
        o : out STD_LOGIC
    );
end component;

signal test_bench_finish : STD_LOGIC := '0';

signal test_a : STD_LOGIC;
signal test_b : STD_LOGIC;
signal test_c : STD_LOGIC;
signal test_d : STD_LOGIC;
signal test_sel : STD_LOGIC_VECTOR(1 downto 0);
signal test_o : STD_LOGIC;

begin

test: mux4x1
    Port Map ( 
        a => test_a,
        b => test_b,
		  c => test_c,
		  d => test_d,
		  sel => test_sel,
        o => test_o
	  );

process
begin
	 test_a <= '1';
    test_b <= '0';
	 test_c <= '0';
    test_d <= '0';
	 test_sel <= "00";
	 wait for PERIOD/2;
	 assert test_o = '1' report "Error Mux in 4x1 " severity FAILURE;
	 wait for PERIOD/2;
	 test_a <= '0';
    test_b <= '1';
	 test_c <= '0';
    test_d <= '0';
	 test_sel <= "01";
	 wait for PERIOD/2;
	 assert test_o = '1' report "Error Mux in 4x1 " severity FAILURE;
	 wait for PERIOD/2;
	 test_a <= '0';
    test_b <= '0';
	 test_c <= '1';
    test_d <= '0';
	 test_sel <= "10";
	 wait for PERIOD/2;
	 assert test_o = '1' report "Error Mux in 4x1 " severity FAILURE;
	 wait for PERIOD/2;	 
	 test_a <= '0';
    test_b <= '0';
	 test_c <= '0';
    test_d <= '1';
	 test_sel <= "11";
	 wait for PERIOD/2;
	 assert test_o = '1' report "Error Mux in 4x1 " severity FAILURE;
	 wait for PERIOD/2;
	 test_a <= '0';
    test_b <= '1';
	 test_c <= '1';
    test_d <= '1';
	 test_sel <= "00";
	 wait for PERIOD/2;
	 assert test_o = '0' report "Error Mux in 4x1 " severity FAILURE;
	 wait for PERIOD/2;
	 test_a <= '1';
    test_b <= '0';
	 test_c <= '1';
    test_d <= '1';
	 test_sel <= "01";
	 wait for PERIOD/2;
	 assert test_o = '0' report "Error Mux in 4x1 " severity FAILURE;
	 wait for PERIOD/2;
	 test_a <= '1';
    test_b <= '1';
	 test_c <= '0';
    test_d <= '1';
	 test_sel <= "10";
	 wait for PERIOD/2;
	 assert test_o = '0' report "Error Mux in 4x1 " severity FAILURE;
	 wait for PERIOD/2;	 
	 test_a <= '1';
    test_b <= '1';
	 test_c <= '1';
    test_d <= '0';
	 test_sel <= "11";
	 wait for PERIOD/2;
	 assert test_o = '0' report "Error Mux in 4x1 " severity FAILURE;
	 wait for PERIOD/2;
	 test_bench_finish <= '1';
	 wait;
end process;


end Behavioral;