-- porta lógica and escrita em vhdl
--duas entradas a,b e uma saída o

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity decremento is 
		generic(
			nbits : integer := 4
		);
		port(
			op_a, op_b : in std_logic_vector(nbits-1 downto 0);
			resultado : out std_logic_vector(nbits-1 downto 0)
		);
end decremento;


architecture comportamento of decremento is
begin            --inicia o comportamento
    resultado <= op_a - 1;  -- atribuição feita com seta
end comportamento;