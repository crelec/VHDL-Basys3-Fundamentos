library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Comparador binario genérico de n bits
-- Genera salidas para: A = B, A > B y A < B

entity Comparador is
    generic (n : integer := 8);
    port (EntradaA     : in  STD_LOGIC_VECTOR(n-1 downto 0);
          EntradaB     : in  STD_LOGIC_VECTOR(n-1 downto 0);
          SalidaIgual  : out STD_LOGIC;
          SalidaMayor  : out STD_LOGIC;
          SalidaMenor  : out STD_LOGIC);
end Comparador;

architecture Behavioral of Comparador is
begin

     process(all)  -- Solo validoc VHDL-2008 incluye automaticamente todas las señales leidas se usa sie,bre en logica combinacional
        variable A_u : unsigned(n-1 downto 0);
        variable B_u : unsigned(n-1 downto 0);
    begin
        -- Conversión a unsigned
        A_u := unsigned(EntradaA);
        B_u := unsigned(EntradaB);

        -- Valores por defecto
        SalidaIgual  <= '0';
        SalidaMayor  <= '0';
        SalidaMenor  <= '0';

        -- Comparación
        if A_u = B_u then
            SalidaIgual <= '1';
        elsif A_u > B_u then
            SalidaMayor <= '1';
        else
            SalidaMenor <= '1';
        end if;
    end process;
end Behavioral;