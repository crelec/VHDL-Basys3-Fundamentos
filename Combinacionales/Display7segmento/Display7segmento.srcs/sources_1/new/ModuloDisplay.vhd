library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Decodificador hexadecimal a display de 7 segmentos
-- Display de ánodo común (segmentos activos en '0')

entity ModuloDisplay is
    Port ( DatoIn : in STD_LOGIC_VECTOR (3 downto 0);
           anodos : out STD_LOGIC_VECTOR (3 downto 0);
           segmento : out STD_LOGIC_VECTOR (6 downto 0));
end ModuloDisplay;

architecture Behavioral of ModuloDisplay is

begin
-- Habilitación de un solo display (ánodo común, activo en '0')
anodos<="1110";

process(all)  -- Solo validoc VHDL-2008 incluye automaticamente todas las señales leidas se usa sie,bre en logica combinacional
	begin
	-- Valor por defecto: display apagado
    segmento <= "1111111"; -- Segmentos apagados
	
	case DatoIn is
	   when "0000" =>segmento<="1000000"; -- 0
	   when "0001" =>segmento<="1111001"; -- 1
	   when "0010" =>segmento<="0100100"; -- 2
	   when "0011" =>segmento<="0110000"; -- 3
	   when "0100" =>segmento<="0011001"; -- 4
	   when "0101" =>segmento<="0010010"; -- 5
	   when "0110" =>segmento<="0000010"; -- 6
	   when "0111" =>segmento<="1111000"; -- 7
	   when "1000" =>segmento<="0000000"; -- 8
	   when "1001" =>segmento<="0011000"; -- 9
	   when "1010" =>segmento<="0001000"; -- A
	   when "1011" =>segmento<="0000011"; -- B
	   when "1100" =>segmento<="1000110"; -- C
	   when "1101" =>segmento<="0100001"; -- D
	   when "1110" =>segmento<="0000110"; -- E
	   when "1111" =>segmento<="0001110"; -- F
	   when others =>segmento<="1111111"; -- Segmentos apagados
	   end case;
	end process;
end Behavioral;