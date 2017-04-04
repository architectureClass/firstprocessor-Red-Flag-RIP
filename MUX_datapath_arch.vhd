
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity MUX_datapath_arch is
    Port ( i : in  STD_LOGIC;
			  csr : in  STD_LOGIC_VECTOR (31 downto 0);
           imm : in  STD_LOGIC_VECTOR (31 downto 0);
           muxout : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_datapath_arch;

architecture Behavioral of MUX_datapath_arch is

begin

process (i,csr,imm) begin
	if i = '0' then
		muxout<=csr;
	else
		muxout<=imm;
	end if;
end process;

end Behavioral;

