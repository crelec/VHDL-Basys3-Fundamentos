library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Tes is
--  Port ( );
end Tes;

architecture Behavioral of Tes is

-- Señales de estímulo
signal EntA : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal EntB : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal sel  : STD_LOGIC := '0';

-- Señales de observación
signal segmento : STD_LOGIC_VECTOR (6 downto 0);
signal anodos   : STD_LOGIC_VECTOR (3 downto 0);

begin

dut: entity work.TopMuxDisplay port map(EntA=>EntA,EntB=>EntB,sel=>sel,segmento=>segmento,anodos=>anodos);

-- Proceso de estimulación 
    stim_proc : process
    begin
-- CASO 0: Inicialización
        EntA <= "0000";
        EntB <= "0000";
        sel  <= '0';
        wait for 10 ns;
-- CASO 1: Selección de EntA
        EntA <= "0110";  -- 6
        EntB <= "1001";  -- 9
        sel  <= '0';     -- Selecciona EntA
        wait for 20 ns;
-- CASO 2: Selección de EntB
        sel <= '1';      -- Selecciona EntB
        wait for 20 ns;
-- CASO 3: Cambio dinámico de entradas con sel fijo
        EntA <= "0011";  -- 3
        EntB <= "1110";  -- E
        sel  <= '0';
        wait for 20 ns;
-- CASO 4: Cambio rápido de selección
        sel <= '1';
        wait for 10 ns;
        sel <= '0';
        wait for 10 ns;
        sel <= '1';
        wait for 10 ns;
-- FIN DE SIMULACIÓN
        wait;
    end process;
end Behavioral;
