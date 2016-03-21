----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    TB_Adder
-- Module Name:    TB_Adder
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple test bench for the simple adder
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

entity tb_adder is
    Generic (
		PERIOD : time := 70 ns
    );
end tb_adder;

architecture Behavioral of tb_adder is

component adder
    Port(
	     a,b : in STD_LOGIC_VECTOR(7 downto 0);
		  cin : in STD_LOGIC_VECTOR(0 downto 0);
		  o : out STD_LOGIC_VECTOR(7 downto 0);
		  cout : out STD_LOGIC_VECTOR(0 downto 0)
	 );
end component;

signal test_bench_finish : STD_LOGIC := '0';
constant tb_delay : time := (3*PERIOD/4);

signal test_a : STD_LOGIC_VECTOR(7 downto 0);
signal test_b : STD_LOGIC_VECTOR(7 downto 0);
signal test_cin : STD_LOGIC_VECTOR(0 downto 0);
signal test_o : STD_LOGIC_VECTOR(7 downto 0);
signal test_cout : STD_LOGIC_VECTOR(0 downto 0);



begin

test: adder
    Port Map ( 
        a => test_a,
        b => test_b,
		  cin => test_cin,
		  o => test_o,
		  cout => test_cout
	  );

process
begin
	 test_a <= X"AE";
	 test_b <= X"34";
    test_cin <= "0";
	 wait for tb_delay;
	 wait for PERIOD/2;
	 assert test_o = X"E2" and test_cout = "0" report "Error Adder " severity FAILURE;
	 wait for PERIOD/2;
	 test_a <= X"20";
	 test_b <= X"5F";
    test_cin <= "0";
	 wait for PERIOD/2;
	 assert test_o = X"7F" and test_cout = "0" report "Error Adder " severity FAILURE;
	 wait for PERIOD/2;
	 test_a <= X"20";
	 test_b <= X"5F";
    test_cin <= "1";
	 wait for PERIOD/2;
	 assert test_o = X"80" and test_cout = "0" report "Error Adder " severity FAILURE;
	 wait for PERIOD/2;
	 test_a <= X"C8";
	 test_b <= X"B7";
    test_cin <= "1";
	 wait for PERIOD/2;
	 assert test_o = X"80" and test_cout = "1" report "Error Adder " severity FAILURE;
	 wait for PERIOD/2;
	 test_bench_finish <= '1';
	 wait;
end process;


end Behavioral;