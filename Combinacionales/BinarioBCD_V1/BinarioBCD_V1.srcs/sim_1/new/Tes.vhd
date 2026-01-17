library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Tes is
end Tes;

architecture Behavioral of Tes is

    -- Señal de entrada
    signal DatoIn  : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

    -- Señal de salida
    signal DatoOut : STD_LOGIC_VECTOR(9 downto 0);

begin

    -- Instancia del DUT
    uut: entity work.BIn_BCD1
        port map (DatoIn  => DatoIn,
                  DatoOut => DatoOut);

-- Se recorren todos los valores posibles de entrada (0–255)
-- para validar completamente el algoritmo de conversión Binario ? BCD

    stim_proc : process
    begin
        for i in 0 to 255 loop
            DatoIn <= std_logic_vector(to_unsigned(i, 8));
            wait for 1 ns;
        end loop;

        wait; -- fin de simulación
    end process;
end Behavioral;

