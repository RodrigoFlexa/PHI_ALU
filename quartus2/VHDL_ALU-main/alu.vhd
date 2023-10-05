library IEEE;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu is port(
    A,B  : in  std_logic_vector(3 downto 0);--4 bits
    --y  : out std_logic_vector(3 downto 0);-- 4 bits
    sel : in std_logic_vector(3 downto 0); --4 bits
	 display_7_seg : out std_logic_vector(6 downto 0) --display de 7 segmentos
);
end alu;

architecture rtl of alu is
----------------------------------------------------------
component soma is
	generic(nbits : integer := 4);
	port(
		op_a, op_b : in std_logic_vector(nbits-1 downto 0);
		resultado : out std_logic_vector(nbits-1 downto 0)
	);
	end component;
----------------------------------------------------------
component subtracao is
	generic(nbits : integer := 4);
	port(
		op_a, op_b : in std_logic_vector(nbits-1 downto 0);
		resultado : out std_logic_vector(nbits-1 downto 0)
	);
	end component;    
----------------------------------------------------------
component and_gate is
	generic(nbits : integer := 4);
	port(
		op_a, op_b : in std_logic_vector(nbits-1 downto 0);
		resultado : out std_logic_vector(nbits-1 downto 0)
	);
	end component;    
----------------------------------------------------------
component or_gate is
	generic(nbits : integer := 4);
	port(
		op_a, op_b : in std_logic_vector(nbits-1 downto 0);
		resultado : out std_logic_vector(nbits-1 downto 0)
	);
	end component;    
----------------------------------------------------------
component not_gate is
	generic(nbits : integer := 4);
	port(
		op_a, op_b : in std_logic_vector(nbits-1 downto 0);
		resultado : out std_logic_vector(nbits-1 downto 0)
	);
	end component;    
----------------------------------------------------------
component shift_esquerda is
	generic(nbits : integer := 4);
	port(
		op_a, op_b : in std_logic_vector(nbits-1 downto 0);
		resultado : out std_logic_vector(nbits-1 downto 0)
	);
	end component;    	
----------------------------------------------------------
component incremento is
	generic(nbits : integer := 4);
	port(
		op_a, op_b : in std_logic_vector(nbits-1 downto 0);
		resultado : out std_logic_vector(nbits-1 downto 0)
	);
	end component;    	

	----------------------------------------------------------
component decremento is
	generic(nbits : integer := 4);
	port(
		op_a, op_b : in std_logic_vector(nbits-1 downto 0);
		resultado : out std_logic_vector(nbits-1 downto 0)
	);
	end component;    	
----------------------------------------------------------
component shift_direita is
	generic(nbits : integer := 4);
	port(
		op_a, op_b : in std_logic_vector(nbits-1 downto 0);
		resultado : out std_logic_vector(nbits-1 downto 0)
	);
	end component;    	
	
----------------------------------------------------------
component mux is
	 port ( 
	  c: in std_logic_vector (3 downto 0);
	  d: in std_logic_vector (3 downto 0);
	  e: in std_logic_vector (3 downto 0);
	  f: in std_logic_vector (3 downto 0);
	  g: in std_logic_vector (3 downto 0);
	  h: in std_logic_vector (3 downto 0);
	  i: in std_logic_vector (3 downto 0);
	  j: in std_logic_vector (3 downto 0);
	  k: in std_logic_vector (3 downto 0);
	  sel: IN STD_LOGIC_VECTOR(3 downto 0);
	  mux_out : out std_logic_vector (3 downto 0)
	  );
end component;

----------------------------------------------------------
component display is
	generic(nbits : integer := 4);
	port(
		saida_mux : in std_logic_vector(nbits-1 downto 0);
		HEX0 : out std_logic_vector(6 downto 0)
	);
	end component;    	
	
----------------------------------------------------------

constant nbits_config : integer := 4;
constant nbits_shift : integer := 4;

signal res_soma,res_sub,res_and,res_or,res_not,res_esq,res_dir,res_inc,res_dec : std_logic_vector(nbits_config-1 downto 0);
signal mux_output: std_logic_vector(nbits_config-1 downto 0);


begin
	inst_soma : soma generic map(nbits => nbits_config)
		port map(op_a => A,op_b => B,resultado => res_soma);

	inst_sub : subtracao generic map(nbits => nbits_config)
		port map(op_a => A,op_b => B,resultado => res_sub);
		
	inst_and : and_gate generic map(nbits => nbits_config)
		port map(op_a => A,op_b => B,resultado => res_and);
		
	inst_or : or_gate generic map(nbits => nbits_config)
		port map(op_a => A,op_b => B,resultado => res_or);
		
	inst_not : not_gate generic map(nbits => nbits_config)
		port map(op_a => A, op_b =>B, resultado => res_not);
		
	inst_esq : shift_esquerda generic map(nbits => nbits_config)
		port map(op_a => A, op_b => B ,resultado => res_esq);
		
	inst_dir : shift_direita generic map(nbits => nbits_config)
		port map(op_a => A, op_b =>B,resultado => res_dir);
		
	inst_inc : incremento generic map(nbits => nbits_config)
	port map(op_a => A, op_b =>B,resultado => res_inc);
	
	inst_dec : decremento generic map(nbits => nbits_config)
	port map(op_a => A, op_b =>B,resultado => res_dec);
		
	inst_mux : mux port map (res_soma,res_sub,res_and,res_or,res_not,res_esq,res_dir,res_inc,res_dec,sel,mux_output);
	
	inst_display : display port map(saida_mux => mux_output, HEX0 => display_7_seg);
	
end architecture rtl;