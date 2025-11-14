library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tes0 is
--  Port ( );
end tes0;

architecture Behavioral of tes0 is

component Bus_Top is
    Port ( DatoInA : in STD_LOGIC_VECTOR (3 downto 0);
           DatoInB : in STD_LOGIC_VECTOR (3 downto 0);
           DatoInC : in STD_LOGIC_VECTOR (3 downto 0);
           DatoInD : in STD_LOGIC_VECTOR (3 downto 0);
           sel_dato : in STD_LOGIC_VECTOR (1 downto 0);
           sel_display: in STD_LOGIC_VECTOR (1 downto 0);
           segmento : out STD_LOGIC_VECTOR (6 downto 0);
           anodo : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal DatoInA : STD_LOGIC_VECTOR (3 downto 0);
signal DatoInB :  STD_LOGIC_VECTOR (3 downto 0);
signal DatoInC :  STD_LOGIC_VECTOR (3 downto 0);
signal DatoInD :  STD_LOGIC_VECTOR (3 downto 0);
signal sel_dato :  STD_LOGIC_VECTOR (1 downto 0);
signal sel_display:  STD_LOGIC_VECTOR (1 downto 0);
signal segmento :  STD_LOGIC_VECTOR (6 downto 0);
signal anodo : STD_LOGIC_VECTOR (3 downto 0);

begin
u0:component Bus_Top Port map( DatoInA =>DatoInA,
           DatoInB =>DatoInB,
           DatoInC =>DatoInC,
           DatoInD =>DatoInD,
           sel_dato =>sel_dato,
           sel_display =>sel_display,
           segmento =>segmento,
           anodo =>anodo);

DatoInA <="0110";
DatoInB <="1001";
DatoInC <="1100";
DatoInD <="0001";

S_sel_display0:PROCESS
BEGIN
sel_display(0)<= '0';
WAIT FOR 1ns;
sel_display(0)<= '1';
wait for 1ns;
end process;

S_sel_display1:PROCESS
BEGIN
sel_display(1)<= '0';
WAIT FOR 2ns;
sel_display(1)<= '1';
wait for 2ns;
end process;

S_sel_dato0:PROCESS
BEGIN
sel_dato(0)<= '0';
WAIT FOR 4ns;
sel_dato(0)<= '1';
wait for 4ns;
end process;

S_sel_dato1:PROCESS
BEGIN
sel_dato(1)<= '0';
WAIT FOR 8ns;
sel_dato(1)<= '1';
wait for 8ns;
end process;

end Behavioral;
