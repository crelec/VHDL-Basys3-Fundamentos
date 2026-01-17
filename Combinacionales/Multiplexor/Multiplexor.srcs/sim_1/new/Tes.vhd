library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Tes is
end entity Tes;

architecture sim of Tes is

    -- Parámetro del testbench
    constant N : positive := 4;
    -- Cambiar a 5, 8, 10, etc.
    
    -- Señales de entrada
    signal EntradaA   : std_logic_vector(N-1 downto 0);
    signal EntradaB   : std_logic_vector(N-1 downto 0);
    signal EntradaC   : std_logic_vector(N-1 downto 0);
    signal EntradaD   : std_logic_vector(N-1 downto 0);
    signal Sel        : std_logic_vector(1 downto 0);

    -- Señal de salida
    signal DatoSalida : std_logic_vector(N-1 downto 0);

begin
    -- Instancia del DUT: Device Under Test) 
    
    dut : entity work.ModuloMux
        generic map (N => N )
        port map (EntradaA   => EntradaA,
                  EntradaB   => EntradaB,
                  EntradaC   => EntradaC,
                  EntradaD   => EntradaD,
                  Sel        => Sel,
                  DatoSalida => DatoSalida );
    
    -- Proceso de estímulos
    stim_proc : process
    begin
        -- Asignación de valores dependientes de N
        EntradaA <= (others => '1');                                  -- Todos 1
        EntradaB <= (others => '0');                                  -- Todos 0
        EntradaC <= std_logic_vector(to_unsigned(2**(N-1), N));      -- MSB = 1
        EntradaD <= std_logic_vector(to_unsigned(3, N));             -- Valor 3

        -- Prueba de cada selección
        Sel <= "00";
        wait for 10 ns;

        Sel <= "01";
        wait for 10 ns;

        Sel <= "10";
        wait for 10 ns;

        Sel <= "11";
        wait for 10 ns;

        -- Fin de simulación
        wait;
    end process;
end architecture sim;
