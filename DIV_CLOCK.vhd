

-- Divisor de Clock
-- Aluno: César Juliano Odja Andrade
-- Disciplina: Sistemas Digitais
-- Data de Entrega: 28/11/2021

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;

ENTITY DIV_CLOCK IS 	
PORT (
		clk_1hz: buffer STD_LOGIC;
		clk_50mhz, rst: in STD_LOGIC
	);
	
END DIV_CLOCK;

architecture comportamental of DIV_CLOCK is


	begin

	divisor: Process (clk_50mhz,rst)
	
	variable cont  : natural range 0 to 51000000 := 0;
	
	begin
		if (rst='0') then  
			clk_1hz <='0';
		elsif (clk_50mhz'event) and (clk_50mhz='1')  then
			cont := cont +1;
		if cont = 2 then --- Obs: O valor de cont igual a 2 para teste com o simulador. Na pinagem o valor de cont deve ser igual 50000000; 
			clk_1hz <= not clk_1hz;
			cont := 0;
		end if;
		end if;
	end process divisor;

end comportamental;