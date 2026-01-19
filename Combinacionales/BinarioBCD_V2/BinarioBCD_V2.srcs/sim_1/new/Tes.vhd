library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Tes is
end Tes;

architecture Behavioral of Tes is

-- Parámetros del DUT
    constant N : integer := 14;
    constant DIGITOS : integer := (N * 301) / 1000 + 1;

-- Señales
    signal DatoIn  : STD_LOGIC_VECTOR(N-1 downto 0);
    signal DatoOut : STD_LOGIC_VECTOR(DIGITOS*4-1 downto 0);

begin

-- Instancia del DUT 
    uut : entity work.Bin_BCD2
        generic map (N       => N,
                     DIGITOS => DIGITOS)
        port map (DatoIn  => DatoIn,
                  DatoOut => DatoOut);

-- Proceso de estímulos
    stim_proc : process
    begin
        for i in 0 to (2**N - 1) loop
            DatoIn <= std_logic_vector(to_unsigned(i, N));
            wait for 1 ns;
        end loop;
        wait; -- fin de simulación
    end process;
end Behavioral;
