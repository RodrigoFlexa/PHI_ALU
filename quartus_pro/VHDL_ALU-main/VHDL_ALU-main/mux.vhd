library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux is
    Port (
	  c : in std_logic_vector (3 downto 0);
	  d : in std_logic_vector (3 downto 0);
	  e: in std_logic_vector (3 downto 0);
	  f: in std_logic_vector (3 downto 0);
	  g: in std_logic_vector (3 downto 0);
	  h: in std_logic_vector (3 downto 0);
	  i: in std_logic_vector (3 downto 0);
	  j: in std_logic_vector (3 downto 0);
	  k: in std_logic_vector (3 downto 0);
	  sel: IN STD_LOGIC_VECTOR(3 downto 0);      
	  mux_out : out STD_LOGIC_VECTOR (3 downto 0)
	);
end mux;

architecture Behavioral of mux is
begin
    with sel select
        mux_out <= c WHEN "0001",
                   d WHEN "0010",
                   e WHEN "0011",
                   f WHEN "0100",
                   g WHEN "0101",
                   h WHEN "0110",
                   i WHEN "0111",
						 j WHEN "1000",
                   k WHEN "1001",
                   "0000" WHEN OTHERS; -- Valor padrão para seleções não especificadas
end Behavioral;
