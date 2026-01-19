library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Conversor Binario a BCD genérico
-- Implementación combinacional del algoritmo Double Dabble

entity Bin_BCD2 is
    generic (
        -- Número de bits del valor binario de entrada
        N : integer := 14;
        -- Número de dígitos decimales necesarios
        -- Aproximación:
        --   log10(2) ? 0.301 ? 301 / 1000
        -- Dígitos ? floor(N * log10(2)) + 1
        -- Dígitos ? (N * 301) / 1000 + 1
        ------------------------------------------------------------------
        DIGITOS : integer := (N * 301) / 1000 + 1
    );
    port (DatoIn  : in  STD_LOGIC_VECTOR(N-1 downto 0);
          DatoOut : out STD_LOGIC_VECTOR(DIGITOS*4-1 downto 0));
end Bin_BCD2;

architecture Behavioral of Bin_BCD2 is

    -- Ancho total del registro auxiliar:
    -- bits binarios + bits BCD
    constant Z_WIDTH : integer := N + DIGITOS*4;

begin

    process(all)  -- Sensibilidad automática (VHDL-2008)
        variable z : unsigned(Z_WIDTH-1 downto 0);
    begin
        -- Inicialización
        z := (others => '0');

        -- Carga del dato binario en la parte baja
        z(N-1 downto 0) := unsigned(DatoIn);

        -- Algoritmo Double Dabble
        for i in 0 to N-1 loop

            -- Corrección BCD (sumar 3 si el dígito > 4)
            for d in 0 to DIGITOS-1 loop
                if z(N + d*4 + 3 downto N + d*4) > 4 then
                    z(N + d*4 + 3 downto N + d*4) :=
                        z(N + d*4 + 3 downto N + d*4) + 3;
                end if;
            end loop;

            -- Desplazamiento a la izquierda
            z := z sll 1;
        end loop;
        -- Salida BCD
        DatoOut <= std_logic_vector(z(Z_WIDTH-1 downto N));
    end process;
end Behavioral;
