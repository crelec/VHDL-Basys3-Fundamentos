-- ** Simulacion opción tres **

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Testbench para el codificador genérico
entity Tes is
end Tes;

architecture Behavioral of Tes is

-- Parámetro del test
constant n : integer := 4;
-- Cambiar  a 5, 6, 7, etc.

-- Señales de estímulo y observación
signal DatoIn  : std_logic_vector((2**n)-1 downto 0) := (others => '0');
signal Valido  : std_logic;
signal DatoOut : std_logic_vector(n-1 downto 0);

begin

-- Instancio del DUT : Device Under Test
    
dut: entity work.Codi
     generic map (n => n)
        port map (DatoIn  => DatoIn,
                  Valido  => Valido,
                  DatoOut => DatoOut);
    
    -- Proceso de estimulación

    stim_proc : process
    begin
        -- CASO 0: Todas las entradas en cero
        DatoIn <= (others => '0');
        wait for 10 ns;

        -- CASO 1: Un solo bit activo (barrido completo)
        for i in 0 to (2**n)-1 loop
            DatoIn <= (others => '0');
            DatoIn(i) <= '1';
            wait for 10 ns;
        end loop;

        -- CASO 2: Dos bits activos (prueba de prioridad)
        DatoIn <= (others => '0');
        DatoIn(1) <= '1';
        DatoIn((2**n)-1) <= '1';  -- MSB
        wait for 10 ns;

        -- CASO 3: Múltiples bits activos (patrón genérico)
        DatoIn <= (others => '0');
        for i in 0 to (2**n)-1 loop
            if (i mod 3 = 0) then
                DatoIn(i) <= '1';
            end if;
        end loop;
        wait for 10 ns;

   -- FIN DE SIMULACIÓN
        wait;

    end process;
end Behavioral;
