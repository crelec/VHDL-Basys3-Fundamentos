library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Receptor is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           LineRD_in : in STD_LOGIC;
           Byte_rready : out STD_LOGIC;
           DatoOut : out STD_LOGIC_VECTOR (7 downto 0));
end Receptor;

architecture Behavioral of Receptor is

signal sg1,sg2,sg3: std_logic;

begin

u0:entity work.Baudios Port map(clk=>clk,reset=>reset,fbaudio=>sg1);
u1:entity work.mod_rx Port map(clk=>clk,reset=>reset,tick=>sg1,LineRD_in=>LineRD_in,Valid_out=>sg2,code_out=>sg3,Byte_ready=>Byte_rready);
u2:entity work.Registro Port map(InD=>sg3,clk=>clk,reset=>reset,ce=>sg2,FoutQ=>DatoOut);
 
end Behavioral;
