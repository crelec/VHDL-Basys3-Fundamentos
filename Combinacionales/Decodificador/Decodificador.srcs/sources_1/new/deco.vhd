library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Decodificador genérico n a 2^n
entity deco is
    generic (n : integer := 4);
    port (DatoIn  : in  STD_LOGIC_VECTOR(n-1 downto 0);
          DatoOut : out STD_LOGIC_VECTOR((2**n)-1 downto 0));
end deco;

architecture Behavioral of deco is
begin
    -- Proceso combinacional
    process(all)  -- Solo validoc VHDL-2008 incluye automaticamente todas las señales leidas se usa sie,bre en logica combinacional
        variable idx : integer;
    begin
        -- Valor por defecto
        DatoOut <= (others => '0');
        -- Conversión a entero
        idx := to_integer(unsigned(DatoIn));
        -- Activación de la salida correspondiente
        if idx < 2**n then
            DatoOut(idx) <= '1';
        end if;
    end process;
end Behavioral;
