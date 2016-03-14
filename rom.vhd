----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    ROM
-- Module Name:    ROM
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple ROM (Read Only Memory)
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

entity rom is
	Port (
		clk : in STD_LOGIC;
		address : in STD_LOGIC_VECTOR(3 downto 0);
		data_out : out STD_LOGIC_VECTOR(7 downto 0)
	);
end rom;

architecture Behavioral of rom is

type romtype is array(0 to 15) of std_logic_vector(7 downto 0);    

signal memory_ram : romtype := (
X"00", X"01", X"02", X"03", X"04", X"05", X"06", X"07",
X"08", X"09", X"0A", X"0B", X"0C", X"0D", X"0E", X"0F");

begin                                                        

process (clk)                                                
begin                                                        
	if(rising_edge(clk)) then  
		data_out <= memory_ram(to_integer(unsigned(address)));      
	end if;                                                      
end process;             

end Behavioral;