----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    11/03/2016
-- Design Name:    Piccolo S-Box
-- Module Name:    Piccolo S-Box
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple flip flop
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

entity piccolo_sbox is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           o : out  STD_LOGIC_VECTOR (3 downto 0));
end piccolo_sbox;

architecture Behavioral of piccolo_sbox is

begin

with a select o <=
    X"e" when X"0",
	 X"4" when X"1",
	 X"b" when X"2",
	 X"2" when X"3",
	 X"3" when X"4",
	 X"8" when X"5",
	 X"0" when X"6",
	 X"9" when X"7",
    X"1" when X"8",
	 X"a" when X"9",
	 X"7" when X"a",
	 X"f" when X"b",
	 X"6" when X"c",
	 X"c" when X"d",
	 X"5" when X"e",
	 X"d" when X"f",
	 "XXXX" when others;

end Behavioral;