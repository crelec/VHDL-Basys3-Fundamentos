library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity divide1 is
    Port ( clk : in STD_LOGIC;
           FoutDivide : out STD_LOGIC);
end divide1;

architecture Behavioral of divide1 is
-- Cálculos para divisor a 125Hz
-- Reloj de la Basys3: 100 MHz ? periodo = 10 ns
-- Frecuencia deseada: 500Hz ? periodo = 2 ms
-- Medio periodo: 4 ms  
-- fincuenta = 2 ms / 10 ns = 200.000 ciclos
-- cuenta = log(fincuenta)/log(2) ejemplo cuenta= log(200000)/log(2)= 17.609 se aproxima a 18

constant DIVIDER_TIME : natural := 200000; -- Número de ciclos para medio periodo
constant COUNTER_WIDTH : natural := 18;   -- Debe cumplirse: 2^N ? DIVIDER_TIME

-- fincuenta: valor límite del contador expresado en binario unsigned
constant fincuenta : unsigned(COUNTER_WIDTH-1 downto 0) :=
                      to_unsigned(DIVIDER_TIME, COUNTER_WIDTH);

signal cuenta : unsigned(COUNTER_WIDTH-1 downto 0) := (others => '0');
signal aux    : std_logic := '0';

begin 

Process (clk)
begin
    if rising_edge(clk) then
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
