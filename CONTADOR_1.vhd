
-- CONTADOR 1

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CONTADOR_1 is
	generic(N:integer := 4);
	Port(
		Clock: in std_logic;
		Clear_Cont_1: in std_logic;
		Enable_Cont_1: in std_logic;
		Sai_Cont_1: out std_logic_vector(N-1 downto 0)
	);
end CONTADOR_1;

architecture ARQ_CONTADOR_1 of CONTADOR_1 is
	signal temp_Sai_Cont_1: std_logic_vector(N-1 downto 0);
	begin
		process(Clock,Clear_Cont_1, Enable_Cont_1)
		begin
			if Clear_Cont_1 = '1' then
				temp_Sai_Cont_1 <= (others => '0');
			elsif clock'event and clock = '1' then
				if(Enable_Cont_1 = '1') then
					temp_Sai_Cont_1 <= temp_Sai_Cont_1 + 1;
				else
					temp_Sai_Cont_1 <= temp_Sai_Cont_1;
				end if;
			end if;
		end process;
	Sai_Cont_1 <= temp_Sai_Cont_1;
end ARQ_CONTADOR_1;