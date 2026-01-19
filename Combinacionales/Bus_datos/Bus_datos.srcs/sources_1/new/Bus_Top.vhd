library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bus_Top is
    Port ( DatoInA : in STD_LOGIC_VECTOR (3 downto 0);
           DatoInB : in STD_LOGIC_VECTOR (3 downto 0);
           DatoInC : in STD_LOGIC_VECTOR (3 downto 0);
           DatoInD : in STD_LOGIC_VECTOR (3 downto 0);
           sel_dato : in STD_LOGIC_VECTOR (1 downto 0);
           sel_display: in STD_LOGIC_VECTOR (1 downto 0);
           segmento : out STD_LOGIC_VECTOR (6 downto 0);
           anodo : out STD_LOGIC_VECTOR (3 downto 0));
end Bus_Top;

architecture Behavioral of Bus_Top is

signal sg_dato: STD_LOGIC_VECTOR (3 downto 0);

begin
u0:entity work.Mux_dato Port map(DatoInA=>DatoInA,DatoInB=>DatoInB,DatoInC=>DatoInC,DatoInD=>DatoInD,SalidaDato=>sg_dato,sel=>sel_dato);
u1:entity work.Display Port map(DatoIn=>sg_dato,segmento=>segmento);
u2:entity work.Mux_anodos Port map(sel_display=>sel_display,anodos=>anodo);
end Behavioral;
