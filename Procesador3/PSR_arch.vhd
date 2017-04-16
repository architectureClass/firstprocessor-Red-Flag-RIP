----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:22:23 04/15/2017 
-- Design Name: 
-- Module Name:    PSR_arch - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PSR_arch is
    Port ( nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           rst : in  STD_LOGIC;
           carry : out  STD_LOGIC);
end PSR_arch;

architecture Behavioral of PSR_arch is

begin
	process(rst,nzvc)
	begin
		if rst='1' then
			carry <= '0';
		else
			carry<=nzvc(0);
		end if;
	end process;
end Behavioral;

