library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Tes is
--  Port ( );
end Tes;

architecture Behavioral of Tes is

--Inputs
signal clk : std_logic := '0';
signal reset : std_logic := '0';
signal load : std_logic := '0';
signal DatoIn: STD_LOGIC_VECTOR (7 downto 0):= "00000000";

--Outputs
signal DatoOut : STD_LOGIC_VECTOR (7 downto 0);

-- Clock period definitions
constant clk_period : time := 10 ns;
   
begin

-- Instantiate the Unit Under Test (UUT)
   uut: Entity work.SupContador PORT MAP (
          clk => clk,
          reset => reset,
          load=>load,
          DatoIn => DatoIn,
          DatoOut =>DatoOut 
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
        load  <= '0';
        wait for 5 ms;
        reset <= '0';

        -- CASO 1: Conteo normal sin carga
        wait for 20 ms;

        -- CASO 2: Carga paralela de un valor
        load   <= '1';
        DatoIn <= "01010101";  -- 85 decimal
        wait for 2 ms;
        load   <= '0';

        -- CASO 3: Conteo posterior a la carga
        wait for 20 ms;

        -- CASO 4: Nueva carga paralela
        load   <= '1';
        DatoIn <= "11110000";  -- 240 decimal
        wait for 2 ms;
        load   <= '0';

        -- CASO 5: Reset durante operación
        wait for 10 ms;
        reset <= '1';
        wait for 5 ms;
        reset <= '0';

        -- CASO 6: Conteo posterior al reset
        wait for 20 ms;

        -- FIN DE SIMULACIÓN
        wait;
    end process;
    
end Behavioral;
