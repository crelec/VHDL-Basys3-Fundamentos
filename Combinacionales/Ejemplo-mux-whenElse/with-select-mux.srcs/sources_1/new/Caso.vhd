library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Caso is
    Port ( Ina, Inb, Inc, Ind : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           Fout : out STD_LOGIC_VECTOR (3 downto 0));
end Caso;

architecture Behavioral of Caso is

begin

Fout <= Ina WHEN sel="00" else
        Inb WHEN sel="01" else
        Inc WHEN sel="10" else
        Ind;
         
end Behavioral;
