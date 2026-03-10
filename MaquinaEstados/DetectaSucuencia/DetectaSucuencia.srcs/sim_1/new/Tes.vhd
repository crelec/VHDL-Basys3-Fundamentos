library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Tes is
--  Port ( );
end Tes;

architecture Behavioral of Tes is

COMPONENT Maq_estado
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         Foutq : OUT  std_logic;
         Int_ext : IN  std_logic
        );
    END COMPONENT;

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Int_ext : std_logic := '0';

 	--Outputs
   signal Foutq : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 	
   uut: Maq_estado PORT MAP (
          Clk => Clk,
          Reset => Reset,
          Foutq => Foutq,
          Int_ext => Int_ext
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 
stim_proc: process
    begin
        reset <= '1';
        Int_ext <= '0';
        wait for 100 ns;  
        reset <= '0'; -- release reset
        wait for clk_period*5;
        
        -- secuencia: 1 0 1 0 correcta
        Int_ext <= '1'; wait for clk_period;
        Int_ext <= '0'; wait for clk_period;
        Int_ext <= '1'; wait for clk_period;
        Int_ext <= '0'; wait for clk_period;
        
        -- secuencia: 1 1 0 incorrecta
        Int_ext <= '1'; wait for clk_period;
        Int_ext <= '1'; wait for clk_period;
        Int_ext <= '0'; wait for clk_period;
                
        -- secuencia: 1 0 1 0 1 0 solapamiento
        Int_ext <= '1'; wait for clk_period;
        Int_ext <= '0'; wait for clk_period;
        Int_ext <= '1'; wait for clk_period;
        Int_ext <= '0'; wait for clk_period;
        Int_ext <= '1'; wait for clk_period;
        Int_ext <= '0'; wait for clk_period;
                
        wait;
    end process;
end Behavioral;