library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity caso is
    Port ( w : in STD_LOGIC_VECTOR (3 downto 0);
           y : out STD_LOGIC_VECTOR (1 downto 0));
end caso;

architecture Behavioral of caso is

begin

y <= "11" when w(3) ='1' else
     "10" when w(2) ='1' else
     "01" when w(1) ='1' else
     "00";
end Behavioral;
