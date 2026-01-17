library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ModuloMux is
    generic ( N : integer := 4 );
    port (EntradaA   : in  std_logic_vector(N-1 downto 0);
          EntradaB   : in  std_logic_vector(N-1 downto 0);
          EntradaC   : in  std_logic_vector(N-1 downto 0);
          EntradaD   : in  std_logic_vector(N-1 downto 0);
          Sel        : in  std_logic_vector(1 downto 0);
          DatoSalida : out std_logic_vector(N-1 downto 0));
end entity ModuloMux;

architecture Behavioral of ModuloMux is
begin
    process(all)  -- Solo validoc VHDL-2008 incluye automaticamente todas las señales leidas se usa sie,bre en logica combinacional
    begin
        case Sel is
            when "00" =>
            DatoSalida <= EntradaA;
            when "01" =>
            DatoSalida <= EntradaB;
            when "10" =>
            DatoSalida <= EntradaC;
            when "11" =>
            DatoSalida <= EntradaD;
            when others =>
            DatoSalida <= (others => '0');  -- estado defecto
        end case;
    end process;
end architecture Behavioral;