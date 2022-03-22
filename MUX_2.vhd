
library ieee;
use ieee.std_logic_1164.all;

entity MUX_2 is
	Port(
		B1, B2, B3, B4: in std_logic_vector(3 downto 0);
		Sel_Mux_2: in std_logic_vector(3 downto 0);
		Sai_Mux_2: out std_logic_vector(3 downto 0)
	);
end MUX_2;

architecture ARQ_MUX_2 of MUX_2 is
	begin
		Sai_Mux_2 <= B1 when Sel_Mux_2 = "0001" else 
					  B2 when Sel_Mux_2 = "0010" else
					  B3 when Sel_Mux_2 = "0011" else
					  B4;
end ARQ_MUX_2;