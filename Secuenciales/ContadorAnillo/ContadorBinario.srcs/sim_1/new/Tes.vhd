library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Tes is
--  Port ( );
end Tes;

architecture Behavioral of Tes is

--Inputs
signal clk : std_logic := '0';
signal reset : std_logic := '0';
signal ce : std_logic := '1';

--Outputs
signal FoutCuenta : STD_LOGIC_VECTOR (7 downto 0);

-- Clock period definitions
constant clk_period : time := 10 ns;
   
begin

-- Instantiate the Unit Under Test (UUT)
   uut:Entity work.SupContador PORT MAP (
          clk => clk,
          reset => reset,
          ce=>ce,
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
        -- CASO 0: Reset inicial estable
        reset <= '1';
        wait for 5 ms;
        reset <= '0';

        -- CASO 1:  Habilitación del contador de anillo
        ce <= '1';
        wait for 20 ms;  

        -- CASO 2:  Deshabilitación del contador de anillo
        ce <= '0';
        wait for 20 ms;

        -- CASO 3: Reset durante operación
        reset <= '1';
        wait for 5 ms;
        reset <= '0';

        -- CASO 4: Rehabilitación del contador tras reset
        ce <= '1';
        wait for 20 ms;

        -- FIN DE SIMULACIÓN
        wait;
    end process;
end Behavioral;
