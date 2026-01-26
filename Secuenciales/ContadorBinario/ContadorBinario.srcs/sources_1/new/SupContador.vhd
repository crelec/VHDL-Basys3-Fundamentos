library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SupContador is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           FoutCuenta : out STD_LOGIC_VECTOR (7 downto 0));
end SupContador;

architecture Behavioral of SupContador is

signal sg_clk: Std_logic;

begin

uo:entity work.Divisor Port map(clk=>clk,reset=>reset,Foutdivide=>sg_clk);
u1:entity work.contador Port map(clk=>sg_clk,reset=>reset,Foutcuenta=>FoutCuenta);
end Behavioral;
