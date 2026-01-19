library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity tes0 is
--  Port ( );
end tes0;

architecture Behavioral of tes0 is

signal DatoInA : STD_LOGIC_VECTOR (3 downto 0):="0110";
signal DatoInB : STD_LOGIC_VECTOR (3 downto 0):="1001";
signal DatoInC : STD_LOGIC_VECTOR (3 downto 0):="0111";
signal DatoInD : STD_LOGIC_VECTOR (3 downto 0):="0001";
signal sel_dato :  STD_LOGIC_VECTOR (1 downto 0):="00";
signal sel_display:  STD_LOGIC_VECTOR (1 downto 0):="00";
signal segmento :  STD_LOGIC_VECTOR (6 downto 0);
signal anodo : STD_LOGIC_VECTOR (3 downto 0);

begin

u0:entity work.Bus_Top Port map( DatoInA =>DatoInA,
           DatoInB =>DatoInB,
           DatoInC =>DatoInC,
           DatoInD =>DatoInD,
           sel_dato =>sel_dato,
           sel_display =>sel_display,
           segmento =>segmento,
           anodo =>anodo);

stim_proc : process
    begin
        -- Recorre selecciones de datos y displays
        for d in 0 to 3 loop
            sel_dato <= std_logic_vector(to_unsigned(d, 2));

            for s in 0 to 3 loop
                sel_display <= std_logic_vector(to_unsigned(s, 2));
                wait for 10 ns;
            end loop;
        end loop;
        wait; -- Fin de simulación
    end process;
end Behavioral;
