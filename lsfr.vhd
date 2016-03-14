----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    LSFR
-- Module Name:    LSFR
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple LSFR
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

entity lsfr is
    Port (
        rst : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        q : out  STD_LOGIC_VECTOR (7 downto 0)
    );
end lsfr;

architecture Behavioral of lsfr is

signal internal_state : STD_LOGIC_VECTOR(7 downto 0);
signal lsfr_input : STD_LOGIC;

begin

q <= internal_state;

lsfr_input <= internal_state(7) xor internal_state(5) xor internal_state(4) xor internal_state(3);

process(clk)
	begin
		if(rising_edge(clk))then
			if(rst = '0') then
		      internal_state <= "00000001";
			else
				internal_state <= internal_state(6 downto 0) & lsfr_input;
			end if;
		else
			null;
		end if;
end process;


end Behavioral;

