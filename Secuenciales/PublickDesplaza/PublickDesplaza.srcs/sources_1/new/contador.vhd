library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity contador is
    Port ( clk : in STD_LOGIC;
           clear : in STD_LOGIC;
           salida : out STD_LOGIC_VECTOR (1 downto 0));
end contador;

architecture Behavioral of contador is

signal sig_salida:unsigned(1 downto 0):=(others => '0');

begin
	process(clear,clk)
	begin
		if(clear='1') then
			sig_salida<="00";
		elsif rising_edge(clk)then
			sig_salida<=sig_salida+1;
		end if;
	end process;
	salida <= std_logic_vector(sig_salida);
end Behavioral;
