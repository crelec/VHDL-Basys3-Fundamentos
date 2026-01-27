library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SupMuxDisplayAuto is
    Port ( DatoEntrada : in STD_LOGIC_VECTOR (13 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           segmento : out STD_LOGIC_VECTOR (6 downto 0);
           anodo : out STD_LOGIC_VECTOR (3 downto 0));
end SupMuxDisplayAuto;

architecture Behavioral of SupMuxDisplayAuto is

signal sg1:STD_LOGIC_VECTOR (15 downto 0);
signal sg2:STD_LOGIC_VECTOR (2 downto 0);
signal sg3:STD_LOGIC_VECTOR (3 downto 0);
signal sg4:STD_LOGIC;

begin

u0:Entity work.Bin_BCD2 port map(DatoIn=>DatoEntrada,DatoOut=>sg1);
u1:Entity work.Mux4a1 port map(DatoInA=>sg1(3 downto 0),DatoInB=>sg1(7 downto 4),DatoInC=>sg1(11 downto 8),DatoInD=>sg1(15 downto 12),sel=>sg2,FoutDato=>sg3);
u2:Entity work.ModuloDisplay port map(DatoIn=>sg3,segmento=>segmento);
u3:Entity work.cuenta1 port map(clk=>sg4,clear=>reset,FoutCuenta=>sg2);
u4:Entity work.negacion port map(btn=>sg2,anodo=>anodo);
u5:Entity work.divide1 port map(clk=>clk,Foutdivide=>sg4);

end Behavioral;
