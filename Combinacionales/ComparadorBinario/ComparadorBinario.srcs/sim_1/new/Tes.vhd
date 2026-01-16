library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Testbench para el comparador genérico
entity Tes is
end Tes;

architecture Behavioral of Tes is

    -- Parámetro del testbench
    constant n : integer := 8;
    -- Cambiar a 5, 8, 10, etc.

    -- Señales de estímulo y observación
    signal EntradaA    : STD_LOGIC_VECTOR(n-1 downto 0) := (others => '0');
    signal EntradaB    : STD_LOGIC_VECTOR(n-1 downto 0) := (others => '0');
    signal SalidaIgual : STD_LOGIC;
    signal SalidaMayor : STD_LOGIC;
    signal SalidaMenor : STD_LOGIC;

begin

    -- Instancia del DUT: Device Under Test
    dut: entity work.Comparador
        generic map (n => n)
        port map (EntradaA    => EntradaA,
                  EntradaB    => EntradaB,
                  SalidaIgual => SalidaIgual,
                  SalidaMayor => SalidaMayor,
                  SalidaMenor => SalidaMenor);

    -- Proceso de estimulación
    stim_proc: process
    begin
        -- Caso 1: A = B
        EntradaA <= std_logic_vector(to_unsigned(5, n));
        EntradaB <= std_logic_vector(to_unsigned(5, n));
        wait for 10 ns;

        -- Caso 2: A > B
        EntradaA <= std_logic_vector(to_unsigned(9, n));
        EntradaB <= std_logic_vector(to_unsigned(3, n));
        wait for 10 ns;

        -- Caso 3: A < B
        EntradaA <= std_logic_vector(to_unsigned(2, n));
        EntradaB <= std_logic_vector(to_unsigned(7, n));
        wait for 10 ns;

        -- Caso 4: barrido automático
        for i in 0 to (2**n - 1) loop
            EntradaA <= std_logic_vector(to_unsigned(i, n));
            EntradaB <= std_logic_vector(to_unsigned((2**n - 1) - i, n));
            wait for 10 ns;
        end loop;
        -- Fin de simulación
        wait;
    end process;
end Behavioral;