----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    Counter
-- Module Name:    Counter
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple Counter
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

entity counter is
    Port(
	     d : in STD_LOGIC_VECTOR(9 downto 0);
		  clk : in STD_LOGIC;
		  ce : in STD_LOGIC;
		  load : in STD_LOGIC;
		  rst : in STD_LOGIC;
		  q : out STD_LOGIC_VECTOR(9 downto 0)
	 );
end counter;

architecture Behavioral of counter is

signal internal_counter : UNSIGNED(9 downto 0);

begin

q <= std_logic_vector(internal_counter);

process(clk)
	begin
		if(rising_edge(clk))then
			if (rst = '0') then
				internal_counter <= (others => '0');
			elsif(ce = '1') then
				if(load = '1') then
					internal_counter <= unsigned(d);
				else
					internal_counter <= internal_counter + 1;
				end if;
			else
				null;
			end if;
		end if;
end process;

end Behavioral;

