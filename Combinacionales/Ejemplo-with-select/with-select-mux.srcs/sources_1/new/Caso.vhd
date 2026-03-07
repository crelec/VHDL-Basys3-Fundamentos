library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Caso is
    Port ( Ina, Inb, Inc, Ind : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           Fout : out STD_LOGIC_VECTOR (3 downto 0));
end Caso;

architecture Behavioral of Caso is

begin

WITH sel SELECT
    Fout <= Ina WHEN "00",
         Inb WHEN "01",
         Inc WHEN "10",
         Ind WHEN Others;
end Behavioral;
