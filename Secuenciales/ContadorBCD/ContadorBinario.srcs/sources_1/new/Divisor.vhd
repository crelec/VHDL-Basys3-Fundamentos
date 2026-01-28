library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Divisor is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           FoutDivide : out STD_LOGIC);
end Divisor;

architecture Behavioral of Divisor is
-- Cálculos para divisor a 1 kHz
-- Reloj de la Basys3: 100 MHz ? periodo = 10 ns
-- Frecuencia deseada: 1Hz ? periodo = 1 s
-- Medio periodo: 0.5 s = 500 ms
-- fincuenta = 500 ms / 10 ns = 50.000.000 ciclos
-- cuenta = log(fincuenta)/log(2) ejemplo cuenta= log(50000000)/log(2)= 25.575 se aproxima a 26

constant DIVIDER_TIME : natural := 50000000; -- Número de ciclos para medio periodo
constant COUNTER_WIDTH : natural := 26;   -- Debe cumplirse: 2^N ? DIVIDER_TIME

-- fincuenta: valor límite del contador expresado en binario unsigned
constant fincuenta : unsigned(COUNTER_WIDTH-1 downto 0) :=
                      to_unsigned(DIVIDER_TIME, COUNTER_WIDTH);

signal cuenta : unsigned(COUNTER_WIDTH-1 downto 0) := (others => '0');
signal aux    : std_logic := '0';

begin 

Process (reset, clk)
begin
    if reset = '1' then
        cuenta <= (others => '0');
        aux    <= '0';
    elsif rising_edge(clk) then
        if cuenta = fincuenta - 1 then 
            cuenta <= (others => '0');
            aux    <= not aux;      -- conmuta cada medio periodo
        else
            cuenta <= cuenta + 1;
        end if;
    end if;
end process;
FoutDivide <= aux;
end Behavioral;
