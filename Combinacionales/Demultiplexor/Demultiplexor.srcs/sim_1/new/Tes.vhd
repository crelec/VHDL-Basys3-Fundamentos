library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Tes is
end Tes;

architecture Behavioral of Tes is

    -- Parámetro del testbench
    constant n : integer := 4;   
    -- Cambia aquí: 5, 8, 10...

    -- Señales de estímulo
    signal DatoIn : std_logic_vector(n-1 downto 0);
    signal Sel    : std_logic_vector(1 downto 0);
    
    -- Señales de salida
    signal DatoOutA : std_logic_vector(n-1 downto 0);
    signal DatoOutB : std_logic_vector(n-1 downto 0);
    signal DatoOutC : std_logic_vector(n-1 downto 0);
    signal DatoOutD : std_logic_vector(n-1 downto 0);

begin
-- Instancia del DUT: Device Under Test

    dut : entity work.Demux
        generic map (n => n)
        port map (DatoIn   => DatoIn,
                  Sel      => Sel,
                  DatoOutA => DatoOutA,
                  DatoOutB => DatoOutB,
                  DatoOutC => DatoOutC,
                  DatoOutD => DatoOutD);
   
    -- Proceso de estimulación 
        stim_proc : process
    begin
        -- Prueba con varios valores de entrada
        for valor in 0 to 3 loop
            DatoIn <= std_logic_vector(to_unsigned(valor, n));

            -- Recorrer todas las salidas
            Sel <= "00"; wait for 10 ns;
            Sel <= "01"; wait for 10 ns;
            Sel <= "10"; wait for 10 ns;
            Sel <= "11"; wait for 10 ns;
        end loop;
        wait;
    end process;
end Behavioral;
