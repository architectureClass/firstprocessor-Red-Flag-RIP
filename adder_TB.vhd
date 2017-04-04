--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:06:09 04/04/2017
-- Design Name:   
-- Module Name:   D:/UNIVERSITY/Arquitectura de computadores/Datapath_imm32/adder_TB.vhd
-- Project Name:  Datapath_imm32
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: adder_arch
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
 
ENTITY adder_TB IS
END adder_TB;
 
ARCHITECTURE behavior OF adder_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adder_arch
    PORT(
         op1 : IN  std_logic_vector(31 downto 0);
         op2 : IN  std_logic_vector(31 downto 0);
         result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op1 : std_logic_vector(31 downto 0) := (others => '0');
   signal op2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: adder_arch PORT MAP (
          op1 => op1,
          op2 => op2,
          result => result
        );

 
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		op1<=x"00000001";
		op2<=x"00000000";
		
		wait for 20 ns;
		
		op1<=x"00000001";
		op2<=x"00000001";
		
		wait for 20 ns;
		
		op1<=x"00000001";
		op2<=x"00000010";
		
		wait for 20 ns;
		
		op1<=x"00000001";
		op2<=x"00000011";
		
		wait for 20 ns;
		
		op1<=x"00000001";
		op2<=x"00000100";
		
		wait for 20 ns;
		
		op1<=x"00000001";
		op2<=x"00000101";
		
		wait for 20 ns;
		
      wait;
   end process;

END;
