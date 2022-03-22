
library ieee;
use ieee.std_logic_1164.all;

entity PORTA_OR is
	Port(
		A: in std_logic;
		B: in std_logic;
		Z: out std_logic
	);
end PORTA_OR;

architecture ARQ_PORTA_OR of PORTA_OR is
	begin
		Z <= A OR B;
end ARQ_PORTA_OR;

