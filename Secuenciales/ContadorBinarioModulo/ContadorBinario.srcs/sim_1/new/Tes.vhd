library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Tes is
--  Port ( );
end Tes;

architecture Behavioral of Tes is

--Inputs
signal clk : std_logic := '0';
signal reset : std_logic := '0';

--Outputs
signal FoutCuenta : STD_LOGIC_VECTOR (3 downto 0);

-- Clock period definitions
constant clk_period : time := 10 ns;
   
begin

-- Instantiate the Unit Under Test (UUT)
uut:Entity work.SupContador PORT MAP (
          clk => clk,
          reset => reset,
          FoutCuenta => FoutCuenta
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
stim_proc : process
    begin
-- Caso 0: Reset inicial
   reset <= '1';
   wait for 5 ms;
   reset <= '0';

-- Caso 1: Conteo normal
-- Observa FoutCuenta incrementarse lentamente por el divisor
   wait for 90 ms;

-- Caso 2: Reset durante operación
   reset <= '1';
   wait for 30 ms;
   reset <= '0';

-- Nuevo periodo de observación
   wait for 100 ms;

-- Fin de simulación
   wait;
 end process;   
  
end Behavioral;
