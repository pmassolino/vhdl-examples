----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    AND_Gate
-- Module Name:    AND_Gate 
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

entity and_gate is
    Port ( 
        a : in  STD_LOGIC;
        b : in  STD_LOGIC;
        c : out  STD_LOGIC
    );
end and_gate;

architecture Behavioral of and_gate is

begin

c <= a and b;

end Behavioral;

