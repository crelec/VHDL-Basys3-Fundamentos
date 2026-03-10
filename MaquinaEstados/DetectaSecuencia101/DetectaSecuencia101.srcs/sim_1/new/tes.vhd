library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tes is
--  Port ( );
end tes;

architecture Behavioral of tes is

component DecSecuencia is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           DatoIn : in STD_LOGIC;
           Foutq : out STD_LOGIC);
end component;

signal clk : STD_LOGIC:='0';
signal reset : STD_LOGIC:='0';
signal DatoIn : STD_LOGIC:='0';
signal Foutq : STD_LOGIC:='0';

constant clk_period : time := 10 ns;

begin

u0: DecSecuencia Port map(clk=>clk,reset=>reset,DatoIn=>DatoIn,Foutq=>Foutq);
           
clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    stim_proc: process
    begin
        reset <= '1';
        DatoIn <= '0';
        wait for 100 ns;  
        
        reset <= '0'; -- reset
        wait for clk_period*5;
        
        -- secuencia: 1 0 1 correcta
        DatoIn <= '1'; wait for clk_period;
        DatoIn <= '0'; wait for clk_period;
        DatoIn <= '1'; wait for clk_period;
        
        -- sequence: 1 1 0 incorrecta
        DatoIn <= '1'; wait for clk_period;
        DatoIn <= '1'; wait for clk_period;
        DatoIn <= '0'; wait for clk_period;
        
        -- sequence: 0 1 0 incorrecta
        DatoIn <= '0'; wait for clk_period;
        DatoIn <= '1'; wait for clk_period;
        DatoIn <= '0'; wait for clk_period;
        
        -- sequence: 1 0 1
        DatoIn <= '1'; wait for clk_period;
        DatoIn <= '0'; wait for clk_period;
        DatoIn <= '1'; wait for clk_period;
        
        -- secuencia solapamiento 10101
        DatoIn <= '1'; wait for clk_period;
        DatoIn <= '0'; wait for clk_period;
        DatoIn <= '1'; wait for clk_period;
        DatoIn <= '0'; wait for clk_period;
        DatoIn <= '1'; wait for clk_period;
        wait;
    end process;
end Behavioral;
