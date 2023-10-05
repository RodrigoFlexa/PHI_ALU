library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity soma is
	generic(
		nbits : integer := 4
	);
	port(
		op_a, op_b : in std_logic_vector(nbits-1 downto 0);
		resultado : out std_logic_vector(nbits-1 downto 0)
	);
end soma;

architecture comportamento of soma is
signal soma: std_logic_vector(nbits-1 downto 0);
begin
	soma  <= std_logic_vector(unsigned(op_a) + unsigned(op_b));
	resultado <= soma;
end comportamento;