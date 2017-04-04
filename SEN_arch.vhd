-----------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SEN_arch is
    Port ( imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           extended_sign : out  STD_LOGIC_VECTOR (31 downto 0));
end SEN_arch;

architecture Behavioral of SEN_arch is

signal tmp : std_logic_vector(31 downto 0);

begin

process (imm13) begin
	if imm13(12) = '0' then
		tmp(31 downto 13)<= (others=>'0');
	else
	   tmp(31 downto 13)<= (others=>'1');
	end if;
	tmp(12 downto 0)<=imm13;
end process;

extended_sign<=tmp;

end Behavioral;

