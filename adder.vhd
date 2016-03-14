----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    Adder
-- Module Name:    Adder
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple Adder
--
-- Dependencies:
-- VHDL-93
-- 
--
-- Revision: 
-- Revision 1.0
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adder is
    Port(
	     a,b : in STD_LOGIC_VECTOR(7 downto 0);
		  cin : in STD_LOGIC_VECTOR(0 downto 0);
		  o : out STD_LOGIC_VECTOR(7 downto 0);
		  cout : out STD_LOGIC_VECTOR(0 downto 0)
	 );
end adder;

architecture Behavioral of adder is

signal internal_sum : UNSIGNED(8 downto 0);

begin

internal_sum <= resize(unsigned(a), 9) + resize(unsigned(b), 9) + resize(unsigned(cin), 9);
o <= std_logic_vector(internal_sum(7 downto 0));
cout <= std_logic_vector(internal_sum(8 downto 8));

end Behavioral;

