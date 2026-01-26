library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Tes is
--  Port ( );
end Tes;

architecture Behavioral of Tes is

-- Señales de estímulo y observación
signal clk        : std_logic := '0';
signal reset      : std_logic := '1';
signal FoutDivide : std_logic;

-- Definición del periodo de reloj
constant clk_period : time := 10 ns;
 
BEGIN
 
-- Instantiate the Unit Under Test (UUT)
uut: entity work.Divisor PORT MAP (
          clk => clk,
          reset => reset,
          Foutdivide => Foutdivide
        );

   -- proceso generación de reloj
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
-- Proceso de estímulo del reset
    
    stim_proc : process
    begin
        -- Reset activo al inicio
        reset <= '1';
        wait for 5 ms;
        -- Liberación del reset
        reset <= '0';

        -- simulación continua
        wait;
    end process;

end Behavioral;
