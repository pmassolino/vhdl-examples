----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    Flip_flop
-- Module Name:    Flip_flop 
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

entity flip_flop is
    Port (
        d : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        ce : in  STD_LOGIC;
		  rst : in STD_LOGIC;
        q : out  STD_LOGIC
    );
end flip_flop;

architecture Behavioral of flip_flop is

signal internal_state : STD_LOGIC;

begin

q <= internal_state;

process(clk, rst)
    begin
        if (rst = '0') then
            internal_state <= '0';
		  elsif(clk'event and clk = '1')then
            if(ce = '1') then
                internal_state <= d;
            else
                null;
            end if;
        end if;
end process;

end Behavioral;