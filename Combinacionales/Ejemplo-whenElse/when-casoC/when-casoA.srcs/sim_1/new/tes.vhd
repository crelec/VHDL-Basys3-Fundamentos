library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity tes is
--  Port ( );
end tes;

architecture Behavioral of tes is
signal w : STD_LOGIC_VECTOR (3 downto 0);
signal y : STD_LOGIC_VECTOR (1 downto 0);

begin

u0: entity work.caso port map(w=>w,y=>y);

process
    begin
        for i in 0 to 15 loop
            w <= std_logic_vector(to_unsigned(i,4));
            wait for 10 ns;
        end loop;
end process;

end Behavioral;
