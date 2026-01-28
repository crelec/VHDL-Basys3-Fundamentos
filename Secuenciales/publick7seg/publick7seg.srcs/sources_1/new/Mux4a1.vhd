library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4a1 is
    Port ( sel : in STD_LOGIC_VECTOR (2 downto 0);
           FoutMux : out STD_LOGIC_VECTOR (6 downto 0));
end Mux4a1;

architecture Behavioral of Mux4a1 is

begin
process (all)
begin
	case sel is
	when "000" =>FoutMux<="1111111";
	when "001" =>FoutMux<="0001000";--A
	when "010" =>FoutMux<="1000111";--L
	when "011" =>FoutMux<="1000000";--O
	when others =>FoutMux<="0001001";--H
	end case;
end process;
end Behavioral;
