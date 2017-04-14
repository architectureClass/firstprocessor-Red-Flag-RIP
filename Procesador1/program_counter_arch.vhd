-------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity program_counter_arch is
    Port ( data : in  STD_LOGIC_vector(31 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           dataOut : out  STD_LOGIC_vector(31 downto 0):=(others=>'0'));
end program_counter_arch;

architecture Behavioral of program_counter_arch is


begin

process (clk, rst) begin
	if rst = '1' then
		dataOut<= (others => '0');
	else
		if rising_edge (clk) then
			dataOut<=data;
		end if;
	end if;
end process;	
			
end Behavioral;