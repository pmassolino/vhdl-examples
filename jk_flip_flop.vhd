----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    JK_Flip_flop
-- Module Name:    JK_Flip_flop 
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple JK flip flop
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

entity jk_flip_flop is
    Port (
        j : in  STD_LOGIC;
        k : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        q : out  STD_LOGIC;
        nq : out  STD_LOGIC
	 );
end jk_flip_flop;

architecture Behavioral of jk_flip_flop is

signal j_k : STD_LOGIC_VECTOR(1 downto 0);

signal internal_state : STD_LOGIC;

begin

j_k(0) <= k;
j_k(1) <= j;

q <= internal_state;
nq <= not internal_state;


process(clk)
    begin
		  if(rising_edge(clk))then
            case j_k is
				    when "00" => 
					     null;
				    when "01" => 
					     internal_state <= '0';
				    when "10" => 
					     internal_state <= '1';
				    when "11" => 
					     internal_state <= not internal_state;
					when others =>
					     null;
            end case;
        end if;
end process;

end Behavioral;