----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    OR_gate
-- Module Name:    OR_gate 
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple OR gate
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

entity or_gate is
    Port (
        a : in  STD_LOGIC;
        b : in  STD_LOGIC;
        c : out  STD_LOGIC
    );
end or_gate;

architecture Behavioral of or_gate is

begin

c <= a or b;

end Behavioral;

