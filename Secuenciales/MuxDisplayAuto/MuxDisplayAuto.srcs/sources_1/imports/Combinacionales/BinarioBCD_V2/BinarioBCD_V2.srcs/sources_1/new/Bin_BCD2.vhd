library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Bin_BCD2 is
    Port ( DatoIn : in STD_LOGIC_VECTOR (13 downto 0);
           DatoOut : out STD_LOGIC_VECTOR (15 downto 0));
end Bin_BCD2;

architecture Behavioral of Bin_BCD2 is

begin
process(all)  
    variable z:unsigned(29 downto 0);
	begin
	   z:=(others=>'0');
	   z(16 downto 3):=unsigned(DatoIn);
	   for i in 0 to 10 loop
        if z(17 downto 14) > 4 then
		  z(17 downto 14):=z(17 downto 14)+3;
		end if;
		if z(21 downto 18) > 4 then
		  z(21 downto 18):=z(21 downto 18)+3;
		end if;
		if z(25 downto 22) > 4 then
		  z(25 downto 22):=z(25 downto 22)+3;
		end if;
	z := z sll 1;--z(29 downto 1):=z(28 downto 0);
	end loop;
	DatoOut<=std_logic_vector(z(29 downto 14));
end process;
end Behavioral;
