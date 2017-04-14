--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:14:44 04/04/2017
-- Design Name:   
-- Module Name:   D:/UNIVERSITY/Arquitectura de computadores/Datapath_imm32/instruction_memory_TB.vhd
-- Project Name:  Datapath_imm32
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: instruction_memory_arch
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY instruction_memory_TB IS
END instruction_memory_TB;
 
ARCHITECTURE behavior OF instruction_memory_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instruction_memory_arch
    PORT(
         address : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         dataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';

 	--Outputs
   signal dataOut : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: instruction_memory_arch PORT MAP (
          address => address,
          rst => rst,
          dataOut => dataOut
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		address<="00000000000000000000000000000000";
		rst<='0';
		
		wait for 20 ns;
		
		address<="00000000000000000000000000000001";
		rst<='0';
		
		wait for 20 ns;
		
		address<="00000000000000000000000000000010";
		rst<='0';
		
		wait for 20 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
