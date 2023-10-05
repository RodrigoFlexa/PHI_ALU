-- porta lógica and escrita em vhdl
--duas entradas a,b e uma saída o

library IEEE;
use IEEE.std_logic_1164.all;

entity and_gate is 
		generic(
			nbits : integer := 4
		);
		port(
			op_a, op_b : in std_logic_vector(nbits-1 downto 0);
			resultado : out std_logic_vector(nbits-1 downto 0)
		);
end and_gate;


architecture comportamento of and_gate is
begin            --inicia o comportamento
    resultado <= op_a and op_b;  -- atribuição feita com seta
end comportamento;