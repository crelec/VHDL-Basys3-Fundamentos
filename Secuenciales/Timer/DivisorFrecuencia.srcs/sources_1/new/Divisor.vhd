library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Divisor is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce : in STD_LOGIC;
           FoutDivide : out STD_LOGIC);
end Divisor;

architecture Behavioral of Divisor is
-- Cálculos para 1 ms:
-- Reloj Basys3: 100 MHz ? Tclk = 10 ns
-- 1 ms / 10 ns = 100 000 ciclos

constant DIVIDER_TIME  : natural := 100000; -- 1 ms
constant COUNTER_WIDTH : natural := 17;      -- 2^17 = 131072 > 100000

constant fincuenta : unsigned(COUNTER_WIDTH-1 downto 0) :=
                      to_unsigned(DIVIDER_TIME - 1, COUNTER_WIDTH);

signal cuenta : unsigned(COUNTER_WIDTH-1 downto 0) := (others => '0');
signal aux    : std_logic := '0';

begin 
 process(clk, reset)
    begin
        if reset = '1' then
            cuenta <= (others => '0');
            aux    <= '0';
        elsif rising_edge(clk) then
            if ce = '1' then
                if cuenta = fincuenta then
                    cuenta <= (others => '0');
                    aux    <= '1';  -- Pulso activo por 1 ciclo
                else
                    cuenta <= cuenta + 1;
                    aux    <= '0';
                end if;
            else
                cuenta <= cuenta;  -- Temporizador inhibido
                aux    <= '0';
            end if;
        end if;
    end process;
    FoutDivide <= aux;
end Behavioral;