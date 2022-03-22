
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity COMPARADOR_1 is
	Port(
		A, B: in std_logic_vector(3 downto 0);
		AeqB: out std_logic
	);
end COMPARADOR_1;

architecture ARQ_COMPARADOR_1 of COMPARADOR_1 is
	begin
		AeqB <= '1' when A = B else '0';
end ARQ_COMPARADOR_1;