library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity cuenta is
    Port ( clk : in STD_LOGIC;
           clear : in STD_LOGIC;
           salidacuenta : out STD_LOGIC_VECTOR (2 downto 0));
end cuenta;

architecture Behavioral of cuenta is
signal cuenta:unsigned(2 downto 0):= (others => '0');

begin
	process(clk, clear)
		begin
		if clear = '1' then
			cuenta <= (others =>'0');
		elsif rising_edge(clk) then
			if cuenta ="100" then
				cuenta <= "001";
			else
				cuenta <= (cuenta + 1);
			end if;
		end if;
	end process;
	salidacuenta<=std_logic_vector(cuenta);
end Behavioral;
