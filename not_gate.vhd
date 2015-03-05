----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    NOT_gate
-- Module Name:    NOT_gate 
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple NOT gate
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

entity not_gate is
    Port (
        a : in  STD_LOGIC_VECTOR (5 downto 0);
        o : out  STD_LOGIC_VECTOR (5 downto 0)
    );
end not_gate;

architecture Behavioral of not_gate is

begin

o <= not a;

end Behavioral;

