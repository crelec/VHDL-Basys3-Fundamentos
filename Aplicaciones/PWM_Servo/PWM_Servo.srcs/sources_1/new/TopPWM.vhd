library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TopPWM is
    Port ( clk : in STD_LOGIC;
           Clear : in STD_LOGIC;
           duty : in STD_LOGIC_VECTOR (7 downto 0);
           Fout_PWM : out STD_LOGIC);
end TopPWM;

architecture Behavioral of TopPWM is

component divisorPWM is
    Port ( clk : in STD_LOGIC;
           clear : in STD_LOGIC;
           Fout_Divide : out STD_LOGIC);
end component;

component ModuloPWM is
    Port ( Clear : in STD_LOGIC;
           clk : in STD_LOGIC;
           duty : in STD_LOGIC_VECTOR (7 downto 0);
           Fout_PWM : out STD_LOGIC);
end component;

signal sg1: std_logic;

begin

u0:divisorPWM Port map(clk=>clk,clear=>clear,Fout_Divide=>sg1);
u1:ModuloPWM Port map(Clear=>clear,clk=>sg1,duty=>duty,Fout_PWM=>Fout_PWM);
end Behavioral;
