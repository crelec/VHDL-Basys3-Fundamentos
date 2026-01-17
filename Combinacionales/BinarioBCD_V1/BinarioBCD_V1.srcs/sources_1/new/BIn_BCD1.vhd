library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BIn_BCD1 is
    Port ( DatoIn : in STD_LOGIC_VECTOR (7 downto 0);
           DatoOut : out STD_LOGIC_VECTOR (9 downto 0));
end BIn_BCD1;

architecture Behavioral of BIn_BCD1 is

begin
    process(all)  -- Solo validoc VHDL-2008 incluye automaticamente todas las señales leidas se usa sie,bre en logica combinacional
	variable z:unsigned(17 downto 0);
	begin
    	--inicialización
    	z:=(others=>'0');
		--Carga inicial binaria
		z(10 downto 3):=unsigned(DatoIN);
		--aplicación algoritmo Double dabble
		for i in 0 to 4 loop
		  if z(11 downto 8) > 4 then
		      z(11 downto 8):=z(11 downto 8)+3;
		  end if;
		  
		  if z(15 downto 12) > 4 then
		      z(15 downto 12):=z(15 downto 12)+3;
		  end if;
		  
		  z := z sll 1; -- esto equivalente a: z(17 downto 1):=z(16 downto 0);
		end loop;
	DatoOut<=std_logic_vector(z(17 downto 8));
end process;
end Behavioral;
