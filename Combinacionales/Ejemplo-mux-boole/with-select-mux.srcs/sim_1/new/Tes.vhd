library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Tes is
--  Port ( );
end Tes;

architecture Behavioral of Tes is
signal Ina : STD_LOGIC_VECTOR (3 downto 0);
signal Inb : STD_LOGIC_VECTOR (3 downto 0);
signal Inc : STD_LOGIC_VECTOR (3 downto 0);
signal sel : STD_LOGIC_VECTOR (1 downto 0);
signal Ind : STD_LOGIC_VECTOR (3 downto 0);
signal Fout : STD_LOGIC_VECTOR (3 downto 0);

begin

u0: entity work.caso port map(Ina=>Ina,Inb=>Inb,Inc=>Inc,Ind=>Ind,Sel=>Sel,Fout=>Fout);

process

begin

Ina<="0001";
Inb<="1010";
Inc<="0101";
Ind<="1111";

Sel <= "00";
wait for 20 ns;

Sel <= "01";
wait for 20 ns;

Sel <= "10";
wait for 20 ns;

Sel <= "11";
wait for 20 ns;
end process;

end Behavioral;
