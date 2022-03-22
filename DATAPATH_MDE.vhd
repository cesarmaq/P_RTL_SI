
-- PROJETO RTL - SEMÁFORO INTELIGENTE
-- DISCENTE: CÉSAR JULIANO O. ANDRADE
-- MATRÍCULA: 20200003574
-- DISCIPLINA: SISTEMAS DIGITAIS
-- DATA DE ENTREGA: 23/01/2022

-- PINAGEM
-- Clock_50MHz -> PIN_N2
-- PA -> SW[15] -> PIN_U4
-- VB -> SW[16] -> PIN_V1
-- RESET -> SW [17] -> PIN_V2
-- sinais[0] -> HEX1[3] -> PIN_Y22
-- sinais[1] -> HEX1[6] -> PIN_AB24
-- sinais[2] -> HEX1[0] -> PIN_V20
-- sinais[3] -> HEX0[3] -> PIN_AD11
-- sinais[4] -> HEX0[6] -> PIN_V13
-- sinais[5] -> HEX0[0] -> PIN_AF10

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity DATAPATH_MDE is
	generic(N:integer := 4);
	Port(
		Clock_1Hz: buffer std_logic;
		Clock_50MHz, Reset: in std_logic;
		PA, VB: in std_logic;
		Y, Sai_Comp_Cont_1, Sai_Comp_Cont_2: out std_logic;
		Sinais: out std_logic_vector(5 downto 0)
	);
end DATAPATH_MDE;

architecture ARQ_DATAPATH_MDE of DATAPATH_MDE is

	signal Sai_Comp_Cont_11: std_logic;
	signal Sai_Comp_Cont_22: std_logic;
	signal YY: std_logic;
	signal Enable_Cont_11, Enable_Cont_22: std_logic;
	signal Clear_Cont_11, Clear_Cont_22: std_logic;
	signal Sel_Mux_11: std_logic_vector(3 downto 0);
	signal Sel_Mux_22: std_logic_vector(3 downto 0);
	signal A11, A22, A33, A44: std_logic_vector(3 downto 0);
	signal B11, B22, B33, B44: std_logic_vector(3 downto 0);
	
	component DIV_CLOCK
		PORT (
			clk_1hz: buffer STD_LOGIC;
			clk_50mhz, rst: in STD_LOGIC
		);
	end component;
	

	component MDE 
		Port(
			Clock: in std_logic;
			Reset: in std_logic;
			Y: in std_logic;
			Sai_Comp_Cont_1: in std_logic;
			Sai_Comp_Cont_2: in std_logic;
			Enable_Cont_1, Clear_Cont_1: out std_logic;
			Enable_Cont_2, Clear_Cont_2: out std_logic;
			Sel_Mux_1, Sel_Mux_2: out std_logic_vector(3 downto 0);
			Const_Mux1_1, Const_Mux1_2, Const_Mux1_3, Const_Mux1_4: out std_logic_vector(3 downto 0);
			Const_Mux2_1, Const_Mux2_2, Const_Mux2_3, Const_Mux2_4: out std_logic_vector(3 downto 0);
			Sinais: out std_logic_vector(5 downto 0)
		);
	end component;
	
	component DATAPATH
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
			Y: out std_logic;
			Sai_Comp_Cont_1: out std_logic;
			Sai_Comp_Cont_2: out std_logic
		);
	end component;
	
	begin
	
	DIVISOR_DE_CLOCK: DIV_CLOCK port map(Clock_1Hz, Clock_50MHz, Reset);
	
	Sai_Comp_Cont_1 <= Sai_Comp_Cont_11;
	Sai_Comp_Cont_2 <= Sai_Comp_Cont_22;
	
	Y <= YY;
	
	
	
	
	CAMINHO_DE_DADOS: DATAPATH port map(
													PA,
													VB,
													Clock_1Hz,
													Enable_Cont_11,
													Clear_Cont_11,
													Enable_Cont_22,
													Clear_Cont_22,
													A11,
													A22,
													A33,
													A44,
													B11,
													B22,
													B33,
													B44,
													Sel_Mux_11,
													Sel_Mux_22,
													YY,
													Sai_Comp_Cont_11,
													Sai_Comp_Cont_22);
	

	
	MAQUINA_DE_ESTADO: MDE port map(
												Clock_1Hz,
											   Reset, 
												YY, 
												Sai_Comp_Cont_11, 
												Sai_Comp_Cont_22, 
												Enable_Cont_11, 
												Clear_Cont_11, 
												Enable_Cont_22,
												Clear_Cont_22,
												Sel_Mux_11,
												Sel_Mux_22,
												A11,
												A22,
												A33,
												A44,
												B11,
												B22,
												B33,
												B44,
												Sinais);
	
end ARQ_DATAPATH_MDE; 

