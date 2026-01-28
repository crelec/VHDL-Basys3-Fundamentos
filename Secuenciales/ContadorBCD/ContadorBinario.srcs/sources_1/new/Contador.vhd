library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Contador is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           FoutCuenta : out STD_LOGIC_VECTOR (13 downto 0));
end Contador;

architecture Behavioral of Contador is

signal cuenta:unsigned(13 downto 0):= (others => '0');

begin
	process(clk,reset)
		begin
		if reset = '1' then
		cuenta <= (others =>'0');
		elsif rising_edge(clk) then
		if cuenta = to_unsigned(9999,14) then 
			cuenta <=(others=>'0');
		else
			cuenta <= cuenta+1;
		end if;
	end if; 
	end process;
FoutCuenta<=std_logic_vector(cuenta);
end Behavioral;
