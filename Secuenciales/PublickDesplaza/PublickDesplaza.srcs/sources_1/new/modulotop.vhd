library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity modulotop is
    Port ( clk : in STD_LOGIC;
           clear : in STD_LOGIC;
           segmento : out STD_LOGIC_VECTOR (6 downto 0);
           anodos : out STD_LOGIC_VECTOR (3 downto 0));
end modulotop;

architecture Behavioral of modulotop is

signal sigclk3,sigclk190:std_logic;
signal sigsalida : STD_LOGIC_VECTOR (15 downto 0);
signal sigmux : STD_LOGIC_VECTOR (3 downto 0);
signal sigsel: STD_LOGIC_VECTOR (1 downto 0);

begin
u0:entity work.divfre port map(clk=>clk,clk3=>sigclk3,clk190=>sigclk190);
u1:entity work.arreglo_reg port map(clear=>clear,clk=>sigclk3,salida=>sigsalida);
u2:entity work.mux4a1 port map(a=>sigsalida(3 downto 0),b=>sigsalida(7 downto 4),c=>sigsalida(11 downto 8),d=>sigsalida(15 downto 12),sel=>sigsel,salida=>sigmux);
u3:entity work.Modulodisplay port map(a=>sigmux,seg=>segmento);
u4:entity work.contador port map(clear=>clear,clk=>sigclk190,salida=>sigsel);
u5:entity work.ModuloBotones port map(sel(2)=>clear,sel(1 downto 0)=>sigsel,anodos=>anodos);
end Behavioral;
