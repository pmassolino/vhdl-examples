----------------------------------------------------------------------------------
-- Company: Digital Security Gorup - Faculty of Science - University of Radbound
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    05/02/2015 
-- Design Name:    TB_LSFR
-- Module Name:    TB_LSFR
-- Project Name:   Example
-- Target Devices: Any
-- Tool versions:  
--
-- Description: 
--
-- A simple test bench for the simple linear shift feedback register
-- Polynomial x^8 + x^6 + x^5 + x^4 + 1
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

entity tb_lsfr is
    Generic (
		PERIOD : time := 10 ns
    );
end tb_lsfr;

architecture Behavioral of tb_lsfr is

component lsfr
    Port (
        rst : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        q : out  STD_LOGIC_VECTOR(7 downto 0)
    );
end component;

signal clk : STD_LOGIC := '0';
signal clk_generator_finish : STD_LOGIC := '0';
signal test_bench_finish : STD_LOGIC := '0';

signal test_rst : STD_LOGIC;
signal test_q : STD_LOGIC_VECTOR(7 downto 0);

type expected_lsfr is array(0 to 254) of std_logic_vector(7 downto 0);    

constant true_q : expected_lsfr :=
(X"01", X"02", X"04", X"08", X"11", X"23", X"47", X"8e", X"1c", X"38", X"71", X"e2",
 X"c4", X"89", X"12", X"25", X"4b", X"97", X"2e", X"5c", X"b8", X"70", X"e0", X"c0",
 X"81", X"03", X"06", X"0c", X"19", X"32", X"64", X"c9", X"92", X"24", X"49", X"93",
 X"26", X"4d", X"9b", X"37", X"6e", X"dc", X"b9", X"72", X"e4", X"c8", X"90", X"20",
 X"41", X"82", X"05", X"0a", X"15", X"2b", X"56", X"ad", X"5b", X"b6", X"6d", X"da",
 X"b5", X"6b", X"d6", X"ac", X"59", X"b2", X"65", X"cb", X"96", X"2c", X"58", X"b0", 
 X"61", X"c3", X"87", X"0f", X"1f", X"3e", X"7d", X"fb", X"f6", X"ed", X"db", X"b7",
 X"6f", X"de", X"bd", X"7a", X"f5", X"eb", X"d7", X"ae", X"5d", X"ba", X"74", X"e8",
 X"d1", X"a2", X"44", X"88", X"10", X"21", X"43", X"86", X"0d", X"1b", X"36", X"6c",
 X"d8", X"b1", X"63", X"c7", X"8f", X"1e", X"3c", X"79", X"f3", X"e7", X"ce", X"9c",
 X"39", X"73", X"e6", X"cc", X"98", X"31", X"62", X"c5", X"8b", X"16", X"2d", X"5a",
 X"b4", X"69", X"d2", X"a4", X"48", X"91", X"22", X"45", X"8a", X"14", X"29", X"52",
 X"a5", X"4a", X"95", X"2a", X"54", X"a9", X"53", X"a7", X"4e", X"9d", X"3b", X"77",
 X"ee", X"dd", X"bb", X"76", X"ec", X"d9", X"b3", X"67", X"cf", X"9e", X"3d", X"7b",
 X"f7", X"ef", X"df", X"bf", X"7e", X"fd", X"fa", X"f4", X"e9", X"d3", X"a6", X"4c",
 X"99", X"33", X"66", X"cd", X"9a", X"35", X"6a", X"d4", X"a8", X"51", X"a3", X"46",
 X"8c", X"18", X"30", X"60", X"c1", X"83", X"07", X"0e", X"1d", X"3a", X"75", X"ea",
 X"d5", X"aa", X"55", X"ab", X"57", X"af", X"5f", X"be", X"7c", X"f9", X"f2", X"e5",
 X"ca", X"94", X"28", X"50", X"a1", X"42", X"84", X"09", X"13", X"27", X"4f", X"9f",
 X"3f", X"7f", X"ff", X"fe", X"fc", X"f8", X"f0", X"e1", X"c2", X"85", X"0b", X"17",
 X"2f", X"5e", X"bc", X"78", X"f1", X"e3", X"c6", X"8d", X"1a", X"34", X"68", X"d0",
 X"a0", X"40", X"80");

begin

test : lsfr
    Port Map(
        rst => test_rst,
        clk => clk,
		  q => test_q
    );

clock : process
begin
    while ( clk_generator_finish /= '1') loop
       clk <= not clk;
       wait for PERIOD/2;
    end loop;
    wait;
end process;


process
    begin
		wait for PERIOD/2;
		test_rst <= '1';
		wait for PERIOD;
		test_rst <= '0';
		for i in 0 to 254 loop
          assert test_q = true_q(i) report "LSFR value error in position " & integer'image(i) severity FAILURE;
			 wait for PERIOD;
      end loop;
		clk_generator_finish <= '1';
		test_bench_finish <= '1';
    wait;
end process;

end Behavioral;