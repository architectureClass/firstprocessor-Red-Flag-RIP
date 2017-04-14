
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY program_counter_TB IS
END program_counter_TB;
 
ARCHITECTURE behavior OF program_counter_TB IS 
 
    
 
    COMPONENT program_counter_arch
    PORT(
         data : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         clk : IN  std_logic;
         dataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal dataOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: program_counter_arch PORT MAP (
          data => data,
          rst => rst,
          clk => clk,
          dataOut => dataOut
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      data<= x"10010000";
		rst<= '0';
		
		wait for 20 ms;
		
		data<= x"10010000";
		rst<= '1';
		
		wait for 20 ms;
		
		data<= x"11111111";
		rst<= '0';
		
		wait for 20 ms;
		
		data<= x"00000001";
		rst<= '0';
		
		wait for 20 ms;

      wait;
   end process;

END;
