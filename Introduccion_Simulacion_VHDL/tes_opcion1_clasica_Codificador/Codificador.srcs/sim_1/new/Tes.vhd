library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Testbench para el codificador genérico
entity Tes is
end Tes;

architecture Behavioral of Tes is
component Codi is
    --generic(n:integer :=4);
    Port ( DatoIn : in STD_LOGIC_VECTOR (15 downto 0);
           Valido : out STD_LOGIC;
           DatoOut : out STD_LOGIC_VECTOR (3 downto 0));
end component;
--Inputs
   signal DatoIn : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal valido : std_logic;
   signal DatoOut : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: codi PORT MAP (
          DatoIn => DatoIn,
          valido => valido,
          DatoOut => DatoOut
        );


s_entrada0: process
begin		
DatoIn(0)<='0';
wait for 1 ns;	
DatoIn(0)<='1';
wait for 1 ns;
end process;

s_entrada1: process
begin		
DatoIn(1)<='0';
wait for 2 ns;	
DatoIn(1)<='1';
wait for 2 ns;
end process;

s_entrada2: process
begin		
DatoIn(2)<='0';
wait for 4 ns;	
DatoIn(2)<='1';
wait for 4 ns;
end process;

s_entrada3: process
begin		
DatoIn(3)<='0';
wait for 8 ns;	
DatoIn(3)<='1';
wait for 8 ns;
end process;

s_entrada4: process
begin		
DatoIn(4)<='0';
wait for 16 ns;	
DatoIn(4)<='1';
wait for 16 ns;
end process;

s_entrada5: process
begin		
DatoIn(5)<='0';
wait for 32 ns;	
DatoIn(5)<='1';
wait for 32 ns;
end process;

s_entrada6: process
begin		
DatoIn(6)<='0';
wait for 64 ns;	
DatoIn(6)<='1';
wait for 64 ns;
end process;

s_entrada7: process
begin		
DatoIn(7)<='0';
wait for 128 ns;	
DatoIn(7)<='1';
wait for 128 ns;
end process;

end Behavioral;
