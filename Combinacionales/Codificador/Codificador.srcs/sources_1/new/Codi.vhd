library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Codificador genérico con prioridad de 2^n a n
-- Genera la posición del bit activo y una señal de validez

entity Codi is
    generic(n:integer :=4);
    Port ( DatoIn : in STD_LOGIC_VECTOR (2**n-1 downto 0);
           Valido : out STD_LOGIC;
           DatoOut : out STD_LOGIC_VECTOR (n-1 downto 0));
end Codi;

architecture Behavioral of Codi is
begin
--Proceso combinacional
process(DatoIn)
	begin
		--valores por defecto
		DatoOut <= (others => '0');  
		valido <= '0';
		-- Recorrido del vector de entrada
        -- Prioridad al bit de mayor índice
		for i in 0 to (2**n-1) loop
			if(DatoIn(i)='1') then
				DatoOut <= std_logic_vector(to_unsigned(i,n));
				valido <='1';
			end if;
		end loop;
	end process;
end Behavioral;