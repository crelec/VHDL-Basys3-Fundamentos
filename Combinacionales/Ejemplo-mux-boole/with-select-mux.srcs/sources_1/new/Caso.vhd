library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Caso is
    Port ( Ina, Inb, Inc, Ind : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           Fout : out STD_LOGIC_VECTOR (3 downto 0));
end Caso;

architecture Behavioral of Caso is

begin

Fout <= (Ina AND (not sel(1)) AND (not sel(0))) OR
        (Inb AND (not sel(1)) AND sel(0)) OR
        (Inc AND sel(1) AND (not sel(0))) OR
        (Ind AND sel(1) AND sel(0));
         
end Behavioral;
