library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity cuenta1 is
    Port ( clk : in STD_LOGIC;
           clear : in STD_LOGIC;
           FoutCuenta : out STD_LOGIC_VECTOR (2 downto 0));
end cuenta1;

architecture Behavioral of cuenta1 is

signal cuenta:unsigned(2 downto 0):= (others => '0');

begin
	process(clk,clear)
		begin
		if clear = '1' then
		cuenta <= (others =>'0');
		elsif rising_edge(clk) then
		if cuenta = "100" then
			cuenta <="001"; --(others=>'0') ;
		else
			cuenta <= (cuenta + 1);
		end if;
		end if;
	end process;
	FoutCuenta<=std_logic_vector(cuenta);
end Behavioral;
