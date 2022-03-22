
library ieee;
use ieee.std_logic_1164.all;

entity MUX_1 is
	Port(
		A1, A2, A3, A4: in std_logic_vector(3 downto 0);
		Sel_Mux_1: in std_logic_vector(3 downto 0);
		Sai_Mux_1: out std_logic_vector(3 downto 0)
	);
end MUX_1;

architecture ARQ_MUX_1 of MUX_1 is
	begin
		Sai_Mux_1 <= A1 when Sel_Mux_1 = "0001" else 
					  A2 when Sel_Mux_1 = "0010" else
					  A3 when Sel_Mux_1 ="0011" else
					  A4;
end ARQ_MUX_1;