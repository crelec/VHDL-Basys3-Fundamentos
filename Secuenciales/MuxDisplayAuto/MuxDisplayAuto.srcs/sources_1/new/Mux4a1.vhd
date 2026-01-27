library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4a1 is
    Port ( DatoInA : in STD_LOGIC_VECTOR (3 downto 0);
           DatoInB : in STD_LOGIC_VECTOR (3 downto 0);
           DatoInC : in STD_LOGIC_VECTOR (3 downto 0);
           DatoInD : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (2 downto 0);
           FoutDato : out STD_LOGIC_VECTOR (3 downto 0));
end Mux4a1;

architecture Behavioral of Mux4a1 is

begin
process (all)
begin
	case sel is
		when "000" =>FoutDato<="1111";
		when "001" =>FoutDato<=DatoInA;
		when "010" =>FoutDato<=DatoInB;
		when "011" =>FoutDato<=DatoInC;
		when others =>FoutDato<=DatoInD;
	end case;
end process;
end Behavioral;
