library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Tes is
--  Port ( );
end Tes;

architecture Behavioral of Tes is

signal Byte_ready : STD_LOGIC;
signal clk: STD_LOGIC;
signal reset: STD_LOGIC;
signal LineRD_in: STD_LOGIC;
signal DatoOut :STD_LOGIC_VECTOR (7 downto 0);
           
begin

u0:entity work.Receptor Port map(clk=>clk,reset=>reset,LineRD_in=>LineRD_in,DatoOut=>DatoOut,Byte_ready=>Byte_ready);

clk_process :process
begin
clk <= '0';
wait for 5ns;
clk <= '1';
wait for 5ns;
end process;
 
-- Stimulus process
sig_reset:process
begin
reset<='1';
wait for 6 ns;
reset<='0';
wait;
end process;

sig_LineRD_in:process
begin
LineRD_in <= '1',
         '0' after 500 ns,    -- StartBit
         '1' after 9150 ns,   -- LSb
         '0' after 17800 ns,
         '0' after 26450 ns,
         '1' after 35100 ns,
         '1' after 43750 ns,
         '1' after 52400 ns,
         '1' after 61050 ns,
         '0' after 69700 ns,  -- MSb
         '1' after 78350 ns;  -- Stopbit
         --'1' after 87000 ns;wait;
wait;
end process;

end Behavioral;
