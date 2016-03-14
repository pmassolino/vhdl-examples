----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    11/03/2016
-- Design Name:    TB_Piccolo_S-box
-- Module Name:    TB_Piccolo_S-box
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple test bench for the piccolo s-box
--
-- Dependencies:
-- VHDL-93
--
-- Revision: 
-- Revision 1.0
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_piccolo_sbox is
    Generic (
		PERIOD : time := 10 ns
    );
end tb_piccolo_sbox;

architecture Behavioral of tb_piccolo_sbox is

component piccolo_sbox
    Port(
	     a : in STD_LOGIC_VECTOR(3 downto 0);
		  o : out STD_LOGIC_VECTOR(3 downto 0)
	 );
end component;

signal test_bench_finish : STD_LOGIC := '0';
constant tb_delay : time := (3*PERIOD/4);

signal test_a : STD_LOGIC_VECTOR(3 downto 0);
signal test_o : STD_LOGIC_VECTOR(3 downto 0);

type romtype is array(0 to 15) of std_logic_vector(3 downto 0);    

constant true_piccolo_sbox : romtype := (
X"e", X"4", X"b", X"2", X"3", X"8", X"0", X"9",
X"1", X"a", X"7", X"f", X"6", X"c", X"5", X"d"
);

begin

test: piccolo_sbox
    Port Map ( 
        a => test_a,
        o => test_o
	  );

process
variable i : integer range 0 to 15;
begin
		i := 0;
		test_a <= "0000";
		wait for tb_delay;
		while(i <= 15) loop	
			test_a <= std_logic_vector(to_unsigned(i, 4));
			wait for PERIOD;
			assert test_o = true_piccolo_sbox(i) report "Piccolo value error in position " & integer'image(i) severity FAILURE;
			wait for PERIOD;
			i := i + 1;
		end loop;
	 test_bench_finish <= '1';
	 wait;
end process;


end Behavioral;