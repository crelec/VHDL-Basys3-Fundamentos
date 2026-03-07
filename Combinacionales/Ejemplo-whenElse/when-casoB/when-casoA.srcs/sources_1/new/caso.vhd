library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity caso is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           F : out STD_LOGIC_VECTOR (3 downto 0));
end caso;

architecture Behavioral of caso is

begin

f <= "1111" when unsigned(a) > unsigned(b) else a;

end Behavioral;
