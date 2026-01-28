library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SupMuxPublick is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           sel_dato : in STD_LOGIC_VECTOR (2 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end SupMuxPublick;

architecture Behavioral of SupMuxPublick is

signal s_fdivide:STD_LOGIC;
signal s_fcuenta:STD_LOGIC_VECTOR (2 downto 0);
signal s_mux1,s_mux2,s_mux3,s_mux4:STD_LOGIC_VECTOR (6 downto 0);

begin
U0:Entity work.divide Port MAP(clk=>CLK,Foutdivide=>s_fdivide);
u1:Entity work.cuenta Port map(clk=>s_fdivide,clear=>reset,salidacuenta=>s_fcuenta);
u2:Entity work.negacion Port map(btn=>s_fcuenta,anodo=>an);
u3:Entity work.MuxUno Port map(sel=>sel_dato,Fout=>s_mux1);
u4:Entity work.MuxDos Port map(sel=>sel_dato,Fout=>s_mux2);
u5:Entity work.MuxTres Port map(sel=>sel_dato,Fout=>s_mux3);
u6:Entity work.Muxcuatro Port map(sel=>sel_dato,Fout=>s_mux4);
u7:Entity work.MuxFin Port map(dato_a =>s_mux1,dato_b=>s_mux2,dato_c=>s_mux3,dato_d=>s_mux4,dato_fout=>seg,sel=>s_fcuenta);
end Behavioral;
