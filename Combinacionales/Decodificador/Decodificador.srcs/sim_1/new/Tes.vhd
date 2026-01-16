library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Testbench genérico para el decodificador n a 2^n
entity Tes is
end Tes;

architecture Behavioral of Tes is

    -- Parámetro del testbench
    constant n : integer := 4;
    -- Cambiar a 3, 5, 8, etc. 

    -- Señales de estímulo y observación
    signal DatoIn  : STD_LOGIC_VECTOR(n-1 downto 0) := (others => '0');
    signal DatoOut : STD_LOGIC_VECTOR((2**n)-1 downto 0);

begin
    -- Instancia del DUT (Device Under Test) – VHDL-2008
    
    dut : entity work.deco
        generic map (n => n)
        port map (DatoIn  => DatoIn,
                  DatoOut => DatoOut);
    -- Proceso de estimulación
    
    stim_proc : process
    begin
        -- Recorre todas las combinaciones posibles de entrada
        for i in 0 to (2**n - 1) loop
            DatoIn <= std_logic_vector(to_unsigned(i, n));
            wait for 10 ns;
        end loop;
        -- Fin de simulación
        wait;
    end process;
end Behavioral;
