library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TopMuxDisplay is
    Port ( EntA : in STD_LOGIC_VECTOR (3 downto 0);
           EntB : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC;
           segmento : out STD_LOGIC_VECTOR (6 downto 0);
           anodos : out STD_LOGIC_VECTOR (3 downto 0));
end TopMuxDisplay;

architecture Behavioral of TopMuxDisplay is

signal sg_dato: STD_LOGIC_VECTOR(3 downto 0);

begin
u0:Entity work.mux4a1 Port map(DatoInA=>EntA,DatoInB=>EntB,sel=>sel,fout=>sg_dato);
u1:Entity work.negacion Port map(btn=>sel,anodo=>Anodos);
u2:Entity work.display Port map(digito=>sg_dato,segmento=>segmento);			 
end Behavioral;
