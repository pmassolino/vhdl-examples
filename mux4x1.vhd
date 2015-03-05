----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    Mux_4x1
-- Module Name:    Mux_4x1 
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple AND gate
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

entity mux4x1 is
    Port ( 
        a : in STD_LOGIC;
        b : in STD_LOGIC;
		  c : in STD_LOGIC;
		  d : in STD_LOGIC;
		  sel : in STD_LOGIC_VECTOR(1 downto 0);
        o : out STD_LOGIC
    );
end mux4x1;

architecture Behavioral of mux4x1 is

begin

with sel select o <=
    a when "00",
	 b when "01",
	 c when "10",
	 d when "11";

end Behavioral;