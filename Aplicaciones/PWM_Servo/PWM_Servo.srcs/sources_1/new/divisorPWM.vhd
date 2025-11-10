library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity divisorPWM is
    Port ( clk : in STD_LOGIC;
           clear : in STD_LOGIC;
           Fout_Divide : out STD_LOGIC);
end divisorPWM;

architecture Behavioral of divisorPWM is

constant DIVIDER_TIME : natural := 16;   -- Ajustado para 3.125 MHz
constant COUNTER_WIDTH : natural := 8;
constant fincuenta : unsigned(COUNTER_WIDTH-1 downto 0) := to_unsigned(DIVIDER_TIME, COUNTER_WIDTH);

signal cuenta : unsigned(COUNTER_WIDTH-1 downto 0) := (others => '0');
signal aux : std_logic := '0';

begin
process (clear, clk)
begin
    if clear = '1' then
        cuenta <= (others => '0');
        aux <= '0';
    elsif rising_edge(clk) then
        if cuenta = fincuenta-1 then
            cuenta <= (others => '0');
            aux <= not aux;
        else
            cuenta <= cuenta + 1;
        end if;
    end if;
end process;
Fout_Divide <= aux;
end Behavioral;
