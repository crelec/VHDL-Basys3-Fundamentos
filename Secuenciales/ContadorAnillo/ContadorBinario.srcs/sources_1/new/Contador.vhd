library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Contador is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce : in STD_LOGIC;
           FoutCuenta : out STD_LOGIC_VECTOR (7 downto 0));
end Contador;

architecture Behavioral of Contador is

signal cuenta: unsigned(7 downto 0):= to_unsigned(1,8);

begin
	process(clk,reset)
		begin
		if reset = '1' then
		  cuenta <= to_unsigned(1,8);
		elsif rising_edge(clk) then
		  if ce='1' then
		      cuenta<=cuenta(6 downto 0) & cuenta(7); --Desplazamiento circular a izquierda
		  end if;
		end if; 
	end process;
	FoutCuenta<=std_logic_vector(cuenta);
end Behavioral;
