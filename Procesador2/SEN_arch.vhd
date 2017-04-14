-----------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SEN_arch is
    Port ( imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           extended_sign : out  STD_LOGIC_VECTOR (31 downto 0));
end SEN_arch;

architecture Behavioral of SEN_arch is


begin

process (imm13) begin
	if imm13(12) = '0' then
		extended_sign(31 downto 13) <=  (others=>'0');
		extended_sign(12 downto 0) <= imm13;
	else
	   extended_sign(31 downto 13) <=  (others=>'1');
		extended_sign(12 downto 0) <= imm13;
	end if;
end process;

end Behavioral;

