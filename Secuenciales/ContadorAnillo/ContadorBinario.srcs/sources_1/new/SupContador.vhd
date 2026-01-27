library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SupContador is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce : in STD_LOGIC;
           FoutCuenta : out STD_LOGIC_VECTOR (7 downto 0));
end SupContador;

architecture Behavioral of SupContador is

signal sg_clk: Std_logic;

begin

uo:Entity work.Divisor Port map(clk=>clk,reset=>reset,Foutdivide=>sg_clk);
u1:Entity work.contador Port map(clk=>sg_clk,reset=>reset,ce=>ce,Foutcuenta=>FoutCuenta);

end Behavioral;
