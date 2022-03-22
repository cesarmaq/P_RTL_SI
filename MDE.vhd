
-- MDE BAIXO NÍVEL/CONTROLADOR 
-- AUTOR: CÉSAR JULIANO O. ANDRADE

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MDE is
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
end MDE;

architecture ARQ_MDE of MDE is
	
	type estados is (E0, E1, E2, E3, E4, E5, E6, E7, E8);
	signal estado_atual, estado_futuro: estados;
	begin
	
		P1: process(Clock, Reset)
		begin	
			if Reset = '0' then 
				estado_atual <= E0;
			elsif rising_edge(Clock) then
				estado_atual <= estado_futuro;
			end if;
		end process P1;
		
		P2: process(estado_atual, Y, Sai_Comp_Cont_1, Sai_Comp_Cont_2)
		begin
			case estado_atual is
				when E0 =>
					Sinais <= "101101";
					Clear_Cont_1 <= '1';
					Clear_Cont_2 <= '1';
					Enable_Cont_1 <= '0';
					Enable_Cont_2 <= '0';
					Sel_Mux_1 <= "0000";
					Sel_Mux_2 <= "0000";
						if Y = '1' then 
							estado_futuro <= E6;
						else 
							estado_futuro <= E1;
						end if;
				when E1 =>
					Sinais <= "110011";
					Clear_Cont_2 <= '0';
					Enable_Cont_2 <= '1';
					Sel_Mux_2 <= "0001";
					Const_Mux2_1 <= "1011";
						if Sai_Comp_Cont_2 = '0' then 
							estado_futuro <= E1;
						else
							estado_futuro <= E2;
						end if;
				when E2 =>
					Sinais <= "110011";
					Clear_Cont_1 <= '0';
					Enable_Cont_1 <= '1';
					Sel_Mux_1 <= "0001";
					Const_Mux1_1 <= "0010";
						if Sai_Comp_Cont_1 = '0' then 
							estado_futuro <= E2;
						elsif Sai_Comp_Cont_1 = '1' and Y = '1' then
							estado_futuro <= E6;
						else
							estado_futuro <= E3;
						end if;
				when E3 =>
					Sinais <= "110011";
					Clear_Cont_1 <= '0';
					Enable_Cont_1 <= '1';
					Sel_Mux_1 <= "0010";
					Const_Mux1_2 <= "0101";
						if Sai_Comp_Cont_1 = '0' then 
							estado_futuro <= E3;
						elsif Sai_Comp_Cont_1 = '1' and Y = '1' then
							estado_futuro <= E6;
						else
							estado_futuro <= E4;
						end if;
				when E4 =>
					Sinais <= "110011";
					Clear_Cont_1 <= '0';
					Enable_Cont_1 <= '1';
					Sel_Mux_1 <= "0011";
					Const_Mux1_3 <= "1000";
						if Sai_Comp_Cont_1 = '0' then 
							estado_futuro <= E4;
						elsif Sai_Comp_Cont_1 = '1' and Y = '1' then
							estado_futuro <= E6;
						else
							estado_futuro <= E5;
						end if;
				when E5 =>
					Sinais <= "110011";
					Clear_Cont_1 <= '0';
					Enable_Cont_1 <= '1';
					Sel_Mux_1 <= "0100";
					Const_Mux1_4 <= "1011";
						if Sai_Comp_Cont_1 = '0' then 
							estado_futuro <= E5;
						elsif Sai_Comp_Cont_1 = '1' and Y = '1' then
							estado_futuro <= E6;
						else
							estado_futuro <= E0;
						end if;
				when E6 =>
					Sinais <= "101011";
					Clear_Cont_2 <= '0';
					Enable_Cont_2 <= '1';
					Sel_Mux_2 <= "0010";
					Const_Mux2_2 <= "0001";
						if Sai_Comp_Cont_2 = '0' then 
							estado_futuro <= E6;
						elsif Sai_Comp_Cont_1 = '1' and Y = '0' then
							estado_futuro <= E1;
						else
							estado_futuro <= E7;
						end if;
				when E7 =>
					Sinais <= "011110";
					Clear_Cont_2 <= '0';
					Enable_Cont_2 <= '1';
					Sel_Mux_2 <= "0011";
					Const_Mux2_3 <= "0110";
						if Sai_Comp_Cont_2 = '0' then 
							estado_futuro <= E7;
						else
							estado_futuro <= E8;
						end if;
				when E8 =>
					Sinais <= "011101";
					Clear_Cont_2 <= '0';
					Enable_Cont_2 <= '1';
					Sel_Mux_2 <= "0100";
					Const_Mux2_4 <= "1000";
						if Sai_Comp_Cont_2 = '0' then 
							estado_futuro <= E8;
						else
							estado_futuro <= E0;
						end if;
				when others =>
							estado_futuro <= E0;
		end case;
	end process P2;
end ARQ_MDE;
