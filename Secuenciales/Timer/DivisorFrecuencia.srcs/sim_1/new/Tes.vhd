library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Tes is
--  Port ( );
end Tes;

architecture Behavioral of Tes is

--Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal ce: STD_LOGIC := '0';
 	
--Outputs
   signal Foutdivide : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.Divisor PORT MAP (
          clk => clk,
          reset => reset,
          ce=>ce,
          Foutdivide => Foutdivide
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
-- Estímulos
    stim_proc : process
    begin
        -- Reset inicial
        reset <= '1';
        wait for 100 ns;
        reset <= '0';

        -- Habilitar temporizador
        ce <= '1';
        wait for 5 ms;

        -- Inhibir temporizador
        ce <= '0';
        wait for 2 ms;

        -- Reactivar temporizador
        ce <= '1';
        wait for 5 ms;

        wait;
    end process;
end Behavioral;
