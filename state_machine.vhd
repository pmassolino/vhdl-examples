----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    State_Machine
-- Module Name:    State_Machine
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple State_Machine
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

entity state_machine is
    Port (
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
        i : in  STD_LOGIC;
        j : in  STD_LOGIC;
        q : out  STD_LOGIC_VECTOR (2 downto 0)
    );
end state_machine;

architecture Behavioral of state_machine is

type State is (S0, S1, S2, S3); 
signal actual_state, next_state : State; 

begin

Clock: process (rst, clk)
begin
    if (rst = '1') then
        actual_state <= S0;
    elsif (clk'event and clk = '1') then
        actual_state <= next_state;
    else
        null;
	 end if;
end process;

Output: process (actual_state, i)
begin
    case (actual_state) is
        when S0 =>
		      if(i = '1') then
                q <= "101";
				else
				    q <= "001";
				end if;
        when S1 =>
		      if(i = '1') then
                q <= "010";
				else
				    q <= "110";
				end if;
        when S2 =>
		      if(i = '1') then
                q <= "011";
				else
				    q <= "000";
				end if;
        when S3 => 
		      if(i = '1') then
                q <= "111";
				else
				    q <= "100";
				end if;
        when others =>
            q <= "000";
	end case;
end process;

NewState : process(actual_state, j)
begin
	case (actual_state) is
		when S0 =>
			next_state <= S1;
		when S1 =>
		    if(j = '1') then
			     next_state <= S2;
			 else
			     next_state <= S0;
			 end if;
		when S2 =>
		    if(j = '0') then
			     next_state <= S3;
			 else
			     next_state <= S2;
			 end if;
		when S3 =>
			next_state <= S3;
		when others =>
			next_state <= S0;
	end case;
end process;

end Behavioral;

