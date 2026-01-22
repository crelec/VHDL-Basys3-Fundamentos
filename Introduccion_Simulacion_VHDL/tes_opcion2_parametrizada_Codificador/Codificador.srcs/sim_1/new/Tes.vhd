library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Testbench para el codificador genérico
entity Tes is
end Tes;

architecture Behavioral of Tes is
  -- Parámetro del testbench
    constant n : integer := 4;

    -- Componente bajo prueba
    component Codi is
        generic (n : integer := 4 ); --OJO este n toma el valor definido en constant linea 11
        port (DatoIn  : in  STD_LOGIC_VECTOR(2**n - 1 downto 0);
              Valido  : out STD_LOGIC;
              DatoOut : out STD_LOGIC_VECTOR(n - 1 downto 0));
    end component;

    -- Señales de estímulo y observación
    signal DatoIn  : STD_LOGIC_VECTOR(2**n - 1 downto 0) := (others => '0');
    signal Valido  : STD_LOGIC;
    signal DatoOut : STD_LOGIC_VECTOR(n - 1 downto 0);

begin

    -- Instancia del UUT
UUT: Codi generic map ( n => n )
        port map (DatoIn  => DatoIn,Valido  => Valido,DatoOut => DatoOut);

    -- Proceso de estímulos
    stim_proc: process
    begin
        DatoIn <= (others => '0');
        wait for 10 ns;
        -- Activación secuencial de cada entrada
        for i in 0 to (2**n - 1) loop
            DatoIn <= (others => '0');
            DatoIn(i) <= '1';
            wait for 10 ns;
        end loop;

        -- Caso con múltiples bits activos (prueba de prioridad) OJO debe ser valido n mayor igual a 4
        DatoIn <= (others => '0');
        DatoIn(3) <= '1';
        DatoIn(7) <= '1';
        DatoIn(12) <= '1';
        wait for 10 ns;

         -- Fin de simulación
        wait;
    end process;
 end Behavioral;