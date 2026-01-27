library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Contador is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           load : in STD_LOGIC;
           DatoIn: in STD_LOGIC_VECTOR (7 downto 0);
           DatoOut : out STD_LOGIC_VECTOR (7 downto 0));
end Contador;

architecture Behavioral of Contador is

signal dato: unsigned(7 downto 0):=(others=>'0');

begin
	process(clk,reset)
		begin
		if reset = '1' then
		  dato <= (others=>'0');
		elsif rising_edge(clk) then
		  if load='1' then
		      dato<=unsigned(datoIn); 
		  else
		      dato<=dato+1;
		  end if;
		end if; 
	end process;
	DatoOut<=std_logic_vector(dato);
end Behavioral;
