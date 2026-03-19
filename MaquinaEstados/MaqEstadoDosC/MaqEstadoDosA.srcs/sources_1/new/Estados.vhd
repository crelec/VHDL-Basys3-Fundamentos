library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Estados is
    Port ( clk : in STD_LOGIC;
           int_ext : in STD_LOGIC;
           sel : in STD_LOGIC;
           reset : in STD_LOGIC;
           Foutq : out STD_LOGIC);
end Estados;

architecture Behavioral of Estados is
Type estados is (Inc, s0, s1, pulso);
signal estadoActual,estadoSiguiente: estados;
begin
FSM:process(clk,reset)
begin
	if reset ='1' then 
		estadoActual<=Inc;  --esdado de reset
	elsif(clk'event and clk='1') then
      EstadoActual<=estadoSiguiente;
	end if;
end process;
			
siguiente:process(estadoActual,int_ext,sel)
begin
    case estadoActual is

        when Inc =>
            if int_ext='0' then
                estadoSiguiente <= s0;
            else
                estadoSiguiente <= s1;
            end if;

        when s0 =>
            if int_ext='1' then
                if sel='0' then      -- detector subida
                    estadoSiguiente <= pulso;
                else
                    estadoSiguiente <= s1;
                end if;
            else
                estadoSiguiente <= s0;
            end if;

        when s1 =>
            if int_ext='0' then
                if sel='1' then      -- detector bajada
                    estadoSiguiente <= pulso;
                else
                    estadoSiguiente <= s0;
                end if;
            else
                estadoSiguiente <= s1;
            end if;
        when pulso =>
            if int_ext='0' then
                estadoSiguiente <= s0;
            else
                estadoSiguiente <= s1;
            end if;
    end case;
end process;

salida:process(EstadoActual)
begin
	case estadoActual is
        when pulso => Foutq <= '1';
        when others => Foutq <= '0';
    end case;
end process;
end Behavioral;
