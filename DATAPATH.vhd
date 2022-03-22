
-- DATAPATH/BLOCOS OPERACIONAIS
-- AUTOR: CÉSAR JULIANO O. ANDRADE

library ieee;
use ieee.std_logic_1164.all;

entity DATAPATH is 
	generic(N:integer := 4);
	Port(
		PA, VB: in std_logic;
		Clock: in std_logic;
		Enable_Cont_1, Clear_Cont_1: in std_logic;
		Enable_Cont_2, Clear_Cont_2: in std_logic;
		A1, A2, A3, A4: in std_logic_vector(3 downto 0);
		B1, B2, B3, B4: in std_logic_vector(3 downto 0);
		Sel_Mux_1: in std_logic_vector(3 downto 0);
		Sel_Mux_2: in std_logic_vector(3 downto 0);
		Sai_Comp_Cont_1: out std_logic;
		Sai_Comp_Cont_2: out std_logic;
		Y: out std_logic
	);
end DATAPATH;

architecture ARQ_DATAPATH of DATAPATH is
	
	component PORTA_OR is
		Port(
			A: in std_logic;
			B: in std_logic;
			Z: out std_logic
		);
	end component;
	
	component CONTADOR_1 is
		generic(N:integer := 4);
		Port(
			Clock: in std_logic;
			Clear_Cont_1: in std_logic;
			Enable_Cont_1: in std_logic;
			Sai_Cont_1: out std_logic_vector(N-1 downto 0)
		);
	end component;
	
	component CONTADOR_2 is
		generic(N:integer := 4);
		Port(
			Clock: in std_logic;
			Clear_Cont_2: in std_logic;
			Enable_Cont_2: in std_logic;
			Sai_Cont_2: out std_logic_vector(N-1 downto 0)
		);
	end component;
	
	component MUX_1 is
		Port(
		A1: in std_logic_vector(3 downto 0);
		A2: in std_logic_vector(3 downto 0);
		A3: in std_logic_vector(3 downto 0);
		A4: in std_logic_vector(3 downto 0);
		Sel_Mux_1: in std_logic_vector(3 downto 0);
		Sai_Mux_1: out std_logic_vector(3 downto 0)
	);
	end component;
	
	component MUX_2 is
		Port(
		B1: in std_logic_vector(3 downto 0);
		B2: in std_logic_vector(3 downto 0);
		B3: in std_logic_vector(3 downto 0);
		B4: in std_logic_vector(3 downto 0);
		Sel_Mux_2: in std_logic_vector(3 downto 0);
		Sai_Mux_2: out std_logic_vector(3 downto 0)
	);
	end component;
	
	component COMPARADOR_1
		Port(
			A, B: in std_logic_vector(3 downto 0);
			AeqB: out std_logic
		);
	end component;
	
	component COMPARADOR_2
		Port(
			A, B: in std_logic_vector(3 downto 0);
			AeqB: out std_logic
		);
	end component;
	
	signal Sai_Cont_1: std_logic_vector(N-1 downto 0);
	signal Sai_Mux_1: std_logic_vector(3 downto 0);
	signal Sai_Cont_2: std_logic_vector(N-1 downto 0);
	signal Sai_Mux_2: std_logic_vector(3 downto 0);
	
	begin
		PAVB: PORTA_OR port map(PA, VB, Y);
		CONTADOR1: CONTADOR_1 port map(Clock, Clear_Cont_1, Enable_Cont_1, Sai_Cont_1);
		MULTIPLEXADOR1: MUX_1 port map(A1, A2, A3, A4, Sel_Mux_1, Sai_Mux_1);
		COMPARADOR1: COMPARADOR_1 port map(Sai_Cont_1, Sai_Mux_1, Sai_Comp_Cont_1);
		CONTADOR2: CONTADOR_2 port map(Clock, Clear_Cont_2, Enable_Cont_2, Sai_Cont_2);
		MULTIPLEXADOR2: MUX_2 port map(B1, B2, B3, B4, Sel_Mux_2, Sai_Mux_2);
		COMPARADOR2: COMPARADOR_2 port map(Sai_Cont_2, Sai_Mux_2, Sai_Comp_Cont_2);
	
end ARQ_DATAPATH;