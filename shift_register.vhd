----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    Shift_register
-- Module Name:    Shift_register
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple shift register
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

entity shift_register is
    Port (
        d : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        q : out  STD_LOGIC
    );
end shift_register;

architecture Behavioral of shift_register is

signal internal_state : STD_LOGIC_VECTOR(4 downto 0);

begin

q <= internal_state(4);

process(clk)
    begin
        if(rising_edge(clk))then
            internal_state <= internal_state(3 downto 0) & d;
        end if;
end process;

end Behavioral;