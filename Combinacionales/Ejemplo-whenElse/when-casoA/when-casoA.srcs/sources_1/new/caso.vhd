library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity caso is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           F : out STD_LOGIC);
end caso;

architecture Behavioral of caso is

begin

f <= '1' when unsigned(a) > 9 else '0';

end Behavioral;
