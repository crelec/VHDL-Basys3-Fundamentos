library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4a1 is
    Port ( DatoInA : in STD_LOGIC_VECTOR (3 downto 0);
           DatoInB : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC;
           Fout : out STD_LOGIC_VECTOR (3 downto 0));
end Mux4a1;

architecture Behavioral of Mux4a1 is
begin
process (all)
begin
	case sel is
		when '0' =>fout<=DatoInA;
		when '1' =>fout<=DatoInB;
		when others =>fout<="0000";
	end case;
end process;

end Behavioral;
