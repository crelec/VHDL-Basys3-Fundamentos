library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SupPublick is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           segmento : out STD_LOGIC_VECTOR (6 downto 0);
           anodo : out STD_LOGIC_VECTOR (3 downto 0));
end SupPublick;

architecture Behavioral of SupPublick is

signal sg2:STD_LOGIC_VECTOR (2 downto 0);
signal sg3:STD_LOGIC;
  
begin

u1:Entity work.negacion port map(btn=>sg2,anodo=>anodo);
u2:Entity work.mux4a1 port map(sel=>sg2,foutMux=>segmento);
u3:Entity work.cuenta port map(clk=>sg3,clear=>reset,FoutCuenta=>sg2);
u4:Entity work.divide port map(clk=>clk,foutdivide=>sg3);

end Behavioral;
