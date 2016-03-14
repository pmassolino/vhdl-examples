----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    TB_Adder_Subtractor
-- Module Name:    TB_Adder_Subtractor
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple test bench for the simple adder/subtractor
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
use IEEE.NUMERIC_STD.ALL;

entity tb_adder_subtractor is
    Generic (
		PERIOD : time := 10 ns
    );
end tb_adder_subtractor;

architecture Behavioral of tb_adder_subtractor is

component adder_subtractor
    Port(
	     a,b : in STD_LOGIC_VECTOR(7 downto 0);
		  cin : in STD_LOGIC_VECTOR(0 downto 0);
		  add : in STD_LOGIC;
		  o : out STD_LOGIC_VECTOR(7 downto 0);
		  cout : out STD_LOGIC_VECTOR(0 downto 0)
	 );
end component;

signal test_bench_finish : STD_LOGIC := '0';
constant tb_delay : time := (3*PERIOD/4);

signal test_a : STD_LOGIC_VECTOR(7 downto 0);
signal test_b : STD_LOGIC_VECTOR(7 downto 0);
signal test_cin : STD_LOGIC_VECTOR(0 downto 0);
signal test_add : STD_LOGIC;
signal test_o : STD_LOGIC_VECTOR(7 downto 0);
signal test_cout : STD_LOGIC_VECTOR(0 downto 0);

begin

test: adder_subtractor
    Port Map ( 
        a => test_a,
        b => test_b,
		  cin => test_cin,
		  add => test_add,
		  o => test_o,
		  cout => test_cout
	  );

process
begin
	 test_a <= X"AE";
	 test_b <= X"34";
    test_cin <= "0";
	 test_add <= '1';
	 wait for tb_delay;
	 wait for PERIOD/2;
	 assert test_o = X"E2" and test_cout = "0" report "Error Adder " severity FAILURE;
	 wait for PERIOD/2;
	 test_a <= X"20";
	 test_b <= X"5F";
    test_cin <= "0";
	 test_add <= '1';
	 wait for PERIOD/2;
	 assert test_o = X"7F" and test_cout = "0" report "Error Adder " severity FAILURE;
	 wait for PERIOD/2;
	 test_a <= X"20";
	 test_b <= X"5F";
    test_cin <= "1";
	 test_add <= '1';
	 wait for PERIOD/2;
	 assert test_o = X"80" and test_cout = "0" report "Error Adder " severity FAILURE;
	 wait for PERIOD/2;
	 test_a <= X"C8";
	 test_b <= X"B7";
    test_cin <= "1";
	 test_add <= '1';
	 wait for PERIOD/2;
	 assert test_o = X"80" and test_cout = "1" report "Error Adder " severity FAILURE;
	 wait for PERIOD/2;
	 test_a <= X"C9";
	 test_b <= X"25";
    test_cin <= "0";
	 test_add <= '0';
	 wait for PERIOD/2;
	 assert test_o = X"A4" and test_cout = "0" report "Error Subtractor " severity FAILURE;
	 wait for PERIOD/2;
	 test_a <= X"53";
	 test_b <= X"47";
    test_cin <= "1";
	 test_add <= '0';
	 wait for PERIOD/2;
	 assert test_o = X"0B" and test_cout = "0" report "Error Subtractor " severity FAILURE;
	 wait for PERIOD/2;
	 test_a <= X"23";
	 test_b <= X"C8";
    test_cin <= "0";
	 test_add <= '0';
	 wait for PERIOD/2;
	 assert test_o = X"5B" and test_cout = "1" report "Error Subtractor " severity FAILURE;
	 wait for PERIOD/2;
	 test_a <= X"65";
	 test_b <= X"79";
    test_cin <= "0";
	 test_add <= '0';
	 wait for PERIOD/2;
	 assert test_o = X"EC" and test_cout = "1" report "Error Subtractor " severity FAILURE;
	 wait for PERIOD/2;
	 test_bench_finish <= '1';
	 wait;
end process;


end Behavioral;