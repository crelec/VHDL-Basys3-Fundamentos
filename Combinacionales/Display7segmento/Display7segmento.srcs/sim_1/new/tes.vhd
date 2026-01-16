library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Testbench para ModuloDisplay
entity tes is
end tes;

architecture Behavioral of tes is

    -- Señales de estímulo y observación
    signal DatoIn   : std_logic_vector(3 downto 0) := (others => '0');
    signal anodos   : std_logic_vector(3 downto 0);
    signal segmento : std_logic_vector(6 downto 0);

begin
    -- Instancia del DUT : Device Under Test
    dut: entity work.ModuloDisplay
        port map (DatoIn   => DatoIn,
                  anodos   => anodos,
                  segmento => segmento);

    -- Proceso de estímulos
    stim_proc: process
    begin
        -- Recorrido completo de 0 a F
        for i in 0 to 15 loop
            DatoIn <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
        end loop;
        -- Fin de simulación
        wait;
    end process;
end Behavioral;