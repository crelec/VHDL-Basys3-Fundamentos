library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity tes is
--  Port ( );
end tes;

architecture Behavioral of tes is
signal A : STD_LOGIC_VECTOR (3 downto 0);
signal B : STD_LOGIC_VECTOR (3 downto 0);
signal F : STD_LOGIC_VECTOR (3 downto 0);

begin

u0: entity work.caso port map(a=>a,b=>b,f=>f);

process
    begin
        for i in 0 to 15 loop
            a <= std_logic_vector(to_unsigned(i,4));
        for j in 0 to 15 loop
            b <= std_logic_vector(to_unsigned(j,4));
            wait for 10 ns;
        end loop;
    end loop;
end process;

end Behavioral;
