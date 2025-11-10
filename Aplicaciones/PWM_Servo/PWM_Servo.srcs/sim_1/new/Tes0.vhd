library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Tes0 is
--  Port ( );
end Tes0;

architecture Behavioral of Tes0 is

component TopPWM is
    Port ( clk : in STD_LOGIC;
           Clear : in STD_LOGIC;
           duty : in STD_LOGIC_VECTOR (7 downto 0);
           Fout_PWM : out STD_LOGIC);
end component;

signal clk,Clear,Fout_PWM : STD_LOGIC;
signal duty : STD_LOGIC_VECTOR (7 downto 0);
            
begin
u0:TopPWM Port map(clk=>clk,Clear=>Clear,duty=>duty,Fout_PWM=>Fout_PWM);

-- Clock process definitions
clk_process :process
begin
clk <= '0';
wait for 5ns;
clk <= '1';
wait for 5ns;
end process;

clear_process :process
begin
clear <= '1';
wait for 6ns;
clear <= '0';
wait;
end process;

duty<= "00001101";
   
end Behavioral;
