library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_dato is
    Port ( DatoInA : in STD_LOGIC_VECTOR (3 downto 0);
           DatoInB : in STD_LOGIC_VECTOR (3 downto 0);
           DatoInC : in STD_LOGIC_VECTOR (3 downto 0);
           DatoInD : in STD_LOGIC_VECTOR (3 downto 0);
           SalidaDato : out STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0));
end Mux_dato;

architecture Behavioral of Mux_dato is

begin
process(all)
	begin
		case Sel is
			when "00" => SalidaDato <= DatoInA;
			when "01" => SalidaDato <= DatoInB;
			when "10" => SalidaDato <= DatoInC;
			when "11" => SalidaDato <= DatoInD;
			when others => SalidaDato <=(others => '0');
		end case;
		end process;
end Behavioral;
