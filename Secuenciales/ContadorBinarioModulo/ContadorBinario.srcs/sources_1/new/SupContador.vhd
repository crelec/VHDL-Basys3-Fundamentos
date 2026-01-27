library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SupContador is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           FoutCuenta : out STD_LOGIC_VECTOR (3 downto 0));
end SupContador;

architecture Behavioral of SupContador is

signal sg_clk: Std_logic;

begin

uo:Entity work.Divisor Port map(clk=>clk,reset=>reset,Foutdivide=>sg_clk);
u1:Entity work.contadorupdow Port map(clk=>sg_clk,reset=>reset,led=>FoutCuenta);

end Behavioral;
