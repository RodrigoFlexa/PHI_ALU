-- porta lógica and escrita em vhdl
--duas entradas a,b e uma saída o

library IEEE;
use IEEE.std_logic_1164.all;

entity not_gate is 
		generic(
			nbits : integer := 4
		);
		port(
		op_a, op_b : in std_logic_vector(nbits-1 downto 0);
			resultado : out std_logic_vector(nbits-1 downto 0)
		);
end not_gate;


architecture comportamento of not_gate is
begin            --inicia o comportamento
    resultado <= not op_a;  -- atribuição feita com seta
end comportamento;