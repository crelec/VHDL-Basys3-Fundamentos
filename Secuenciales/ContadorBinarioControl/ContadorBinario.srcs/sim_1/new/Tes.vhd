library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Tes is
--  Port ( );
end Tes;

architecture Behavioral of Tes is
 
--Inputs
signal clk : std_logic := '0';
signal reset : std_logic := '0';
signal up_dow : std_logic := '1';

--Outputs
signal FoutCuenta : STD_LOGIC_VECTOR (3 downto 0);

-- Clock period definitions
constant clk_period : time := 10 ns;
   
begin

uut: entity work.SupContador PORT MAP(clk =>clk,reset => reset,up_dow=>up_dow,FoutCuenta=>FoutCuenta);

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

        -- CASO 1: Conteo ascendente durante un ciclo completo
        up_dow <= '1';
        wait for 20 ms;  

        -- CASO 2: Cambio a conteo descendente
        up_dow <= '0';
        wait for 20 ms;

        -- CASO 3: Reset durante operación
        reset <= '1';
        wait for 5 ms;
        reset <= '0';

        -- CASO 4: Conteo ascendente nuevamente
        up_dow <= '1';
        wait for 20 ms;

        -- FIN DE SIMULACIÓN
        wait;
    end process;
    
end Behavioral;
