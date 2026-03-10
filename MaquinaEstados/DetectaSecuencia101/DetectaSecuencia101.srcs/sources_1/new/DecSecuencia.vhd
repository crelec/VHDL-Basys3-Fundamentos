library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DecSecuencia is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           DatoIn : in STD_LOGIC;
           Foutq : out STD_LOGIC);
end DecSecuencia;

architecture Behavioral of DecSecuencia is
type state_type is (s0, s1, s2, s3);
signal estadoactual,estadosiguiente : state_type;

begin
    process(clk, reset)
    begin
        if reset = '1' then
            estadoactual <= s0;
        elsif(clk' event and clk='1') then
            estadoactual<=estadosiguiente;
        end if;
end process;

process(DatoIn,estadoactual)
begin
    case estadoactual is
        when s0 =>
            if DatoIn = '1' then
                estadosiguiente <= s1;
            else
                estadosiguiente <= s0;
            end if;
            
        when s1 =>
            if DatoIn = '0' then
                estadosiguiente <= s2;
            else
                estadosiguiente <= s1;
            end if;
            
        when s2 =>
            if DatoIn = '1' then
                estadosiguiente <= s3;
            else
                estadosiguiente <= s0;
            end if;
        
        when s3 =>
            if DatoIn = '1' then
                estadosiguiente <= s1;
            else
                estadosiguiente <= s2;
           end if;
    end case;
end process;

process(estadoactual)
begin
    case estadoactual is
        when s0=> Foutq <='0';
        when s1=> Foutq <='0';
        when s2=> Foutq <='0';
        when s3=> Foutq <='1';
    end case;
end process;
end Behavioral;

