library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Demux is
    generic (N : positive := 4);
    port (DatoIn   : in  std_logic_vector(N-1 downto 0);
        DatoOutA : out std_logic_vector(N-1 downto 0);
        DatoOutB : out std_logic_vector(N-1 downto 0);
        DatoOutC : out std_logic_vector(N-1 downto 0);
        DatoOutD : out std_logic_vector(N-1 downto 0);
        Sel      : in  std_logic_vector(1 downto 0));
end entity Demux;

architecture rtl of Demux is
begin
    process (all)
    begin
        -- Valores por defecto 
        DatoOutA <= (others => '0');
        DatoOutB <= (others => '0');
        DatoOutC <= (others => '0');
        DatoOutD <= (others => '0');

        -- Selección del canal
        case Sel is
            when "00" =>
                DatoOutA <= DatoIn;
            when "01" =>
                DatoOutB <= DatoIn;
            when "10" =>
                DatoOutC <= DatoIn;
            when others =>
                DatoOutD <= DatoIn;
        end case;
    end process;
end architecture rtl;
