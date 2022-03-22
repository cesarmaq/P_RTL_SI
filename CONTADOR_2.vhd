

-- CONTADOR 2

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CONTADOR_2 is
	generic(N:integer := 4);
	Port(
		Clock: in std_logic;
		Clear_Cont_2: in std_logic;
		Enable_Cont_2: in std_logic;
		Sai_Cont_2: out std_logic_vector(N-1 downto 0)
	);
end CONTADOR_2;

architecture ARQ_CONTADOR_2 of CONTADOR_2 is
	signal temp_Sai_Cont_2: std_logic_vector(N-1 downto 0);
	begin
		process(Clock,Clear_Cont_2, Enable_Cont_2)
		begin
			if Clear_Cont_2 = '1' then
				temp_Sai_Cont_2 <= (others => '0');
			elsif clock'event and clock = '1' then
				if(Enable_Cont_2 = '1') then
					temp_Sai_Cont_2 <= temp_Sai_Cont_2 + 1;
				else
					temp_Sai_Cont_2 <= temp_Sai_Cont_2;
				end if;
			end if;
		end process;
	Sai_Cont_2 <= temp_Sai_Cont_2;
end ARQ_CONTADOR_2;