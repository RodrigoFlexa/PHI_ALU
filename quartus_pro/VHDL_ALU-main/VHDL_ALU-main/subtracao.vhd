library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity subtracao is
	generic(
		nbits : integer := 4
	);
	port(
		op_a, op_b : in std_logic_vector(nbits-1 downto 0);
		resultado : out std_logic_vector(nbits-1 downto 0)
	);
end subtracao;

architecture comportamento of subtracao is
signal sub : std_logic_vector(nbits-1 downto 0);
begin
	sub  <= std_logic_vector(unsigned(op_a) - unsigned(op_b));
	resultado <= sub;
end comportamento;