library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity phi16 is
	port(
		SW : in std_logic_vector(7 downto 0);
		KEY : in std_logic_vector(3 downto 0);
		HEX0 : out std_logic_vector(6 downto 0);
		LEDR : out std_logic_vector(3 downto 0)
	);
end phi16;

architecture comportamento of phi16 is
	signal saida_alu : std_logic_vector(3 downto 0);
	signal a, b : std_logic_vector(3 downto 0);
begin

	LEDR <= saida_alu;

	-- PROJETO 1
	with KEY select
		saida_alu <= a and b when x"0",
	                a or b when x"1",
						 not a when x"2",
						 std_logic_vector(shift_left(unsigned(a),1)) when x"3",
						 std_logic_vector(shift_right(unsigned(a),1)) when x"4",
						 std_logic_vector(unsigned(a)+1) when x"5",
						 std_logic_vector(unsigned(a)-1) when x"6",
						 std_logic_vector(unsigned(a)+unsigned(b)) when x"7",
						 std_logic_vector(unsigned(a)-unsigned(b)) when x"8",
						 a when others;
	
	-- PROJETO 2
	with saida_alu select HEX0 <=
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