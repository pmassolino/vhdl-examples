----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    XOR_gate
-- Module Name:    XOR_gate 
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple XOR gate
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

entity xor_gate is
    Port (
        a : in  STD_LOGIC_VECTOR (7 downto 0);
        b : in  STD_LOGIC_VECTOR (7 downto 0);
        c : out  STD_LOGIC_VECTOR (7 downto 0)
    );
end xor_gate;

architecture Behavioral of xor_gate is

begin

c <= a xor b;

end Behavioral;

