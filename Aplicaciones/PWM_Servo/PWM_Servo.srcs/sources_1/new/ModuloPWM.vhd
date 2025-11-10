library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity ModuloPWM is
    Port ( Clear : in STD_LOGIC;
           clk : in STD_LOGIC;
           duty : in STD_LOGIC_VECTOR (7 downto 0);
           Fout_PWM : out STD_LOGIC);
end ModuloPWM;

architecture Behavioral of ModuloPWM is
signal count: unsigned(15 downto 0);
signal duty_scaled : unsigned(15 downto 0);

begin

-- Escala duty (0-255) a rango PWM (0-62500)
duty_scaled <= unsigned(duty) * 245;

process (clk, clear)
begin
    if clear = '1' then
        count <= (others => '0');
    elsif rising_edge(clk) then
        if count = 62500 then
            count <= (others => '0');
        else
            count <= count + 1;
        end if;
    end if;
end process;

process(count, duty_scaled)
begin
    if count < duty_scaled then
        Fout_PWM <= '1';
    else
        Fout_PWM <= '0';
    end if;
end process;
end Behavioral;
