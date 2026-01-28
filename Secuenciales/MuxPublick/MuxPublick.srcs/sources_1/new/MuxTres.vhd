library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MuxTres is
    Port ( sel : in STD_LOGIC_VECTOR (2 downto 0);
           Fout : out STD_LOGIC_VECTOR (6 downto 0));
end MuxTres;

architecture Behavioral of MuxTres is

begin
process (all)
begin
	case sel is
	when "001" =>fout<="1000001";--u
	when "010" =>fout<="0001000";--a
	when "011" =>fout<="1000000";--o
	when "100" =>fout<="0111111";---
	when "101" =>fout<="0111111";---
	when others =>fout<="1111111";-- off
	end case;
end process;
end Behavioral;
