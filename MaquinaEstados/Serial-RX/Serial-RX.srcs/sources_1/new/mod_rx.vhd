library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity mod_rx is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           tick : in STD_LOGIC;
           LineRD_in : in STD_LOGIC;
           Valid_out : out STD_LOGIC;     -- pulso por cada bit
           Byte_ready : out STD_LOGIC;    -- pulso por byte completo
           code_out : out STD_LOGIC);
end mod_rx;

architecture Behavioral of mod_rx is
type state_type is (idle, start, data, stop);
signal state_reg, state_next : state_type;

signal s_reg, s_next : unsigned(3 downto 0);
signal n_reg, n_next : unsigned(2 downto 0);

begin
 
------------------------------------------------
-- REGISTROS
------------------------------------------------

process(clk,reset)
begin
    if reset='1' then
        state_reg <= idle;
        s_reg <= (others=>'0');
        n_reg <= (others=>'0');
    elsif rising_edge(clk) then
        state_reg <= state_next;
        s_reg <= s_next;
        n_reg <= n_next;
    end if;
end process;

------------------------------------------------
-- FSM
------------------------------------------------

process(state_reg,s_reg,n_reg,tick,LineRD_in)
begin

state_next <= state_reg;
s_next <= s_reg;
n_next <= n_reg;

valid_out  <= '0';
byte_ready <= '0';

case state_reg is

------------------------------------------------
when idle =>
code_out <= '1';

    if LineRD_in='0' then
        state_next <= start;
        s_next <= (others=>'0');
    end if;

------------------------------------------------
when start =>

    if tick='1' then
        if s_reg=7 then
            state_next <= data;
            s_next <= (others=>'0');
            n_next <= (others=>'0');
        else
            s_next <= s_reg + 1;
        end if;
    end if;

------------------------------------------------
when data =>
if tick='1' then

        if s_reg=15 then

            code_out <= LineRD_in;  -- muestreo del bit
            valid_out <= '1';       -- pulso para registro
            s_next <= (others=>'0');

            if n_reg=7 then
                state_next <= stop;
                byte_ready <= '1';  -- BYTE COMPLETO
            else
                n_next <= n_reg + 1;
            end if;

        else
            s_next <= s_reg + 1;
        end if;

    end if;

------------------------------------------------
when stop =>
if tick='1' then
        if s_reg=15 then
            state_next <= idle;
        else
            s_next <= s_reg + 1;
        end if;
    end if;

end case;
end process;

end Behavioral;
