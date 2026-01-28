library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SupContador is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           FoutCuenta : out STD_LOGIC_VECTOR (15 downto 0));
end SupContador;

architecture Behavioral of SupContador is

signal sg_clk: Std_logic;
signal sg_cuenta:STD_LOGIC_VECTOR (13 downto 0);

begin
uo:Entity work.Divisor Port map(clk=>clk,reset=>reset,Foutdivide=>sg_clk);
u1:Entity work.contador Port map(clk=>sg_clk,reset=>reset,Foutcuenta=>sg_cuenta);
u2:Entity work.BinarioBCD_V2 Port map(DatoIn=>sg_cuenta,DatoOut=>FoutCuenta);
end Behavioral;
