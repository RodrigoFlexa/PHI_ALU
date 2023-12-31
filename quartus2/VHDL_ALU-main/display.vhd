library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display is
	generic(
		nbits : integer := 4
	);
	port(
		saida_mux : in std_logic_vector(nbits-1 downto 0);
		HEX0 : out std_logic_vector(6 downto 0)
	);
end display;

architecture comportamento of display is
begin
	-- PROJETO 2
	with saida_mux select HEX0 <=
	"1000000" when x"0",
	"1111001" when x"1",
	"0100100" when x"2",
	"0110000" when x"3",
	"0011001" when x"4",
	"1110010" when x"5",
	"0000010" when x"6",
	"1111000" when x"7",
	"0000000" when x"8",
	"0010000" when x"9",
	"0001000" when x"A",
	"0000000" when x"B",
	"1000110" when x"C",
	"1000000" when x"D",
	"0000110" when x"E",
	"0001110" when x"F",
	"0111111" when others;
		
end comportamento;