library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALU_arch is
    Port ( SC   : in  STD_LOGIC_VECTOR (2 downto 0);
			  CRS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU_arch;

architecture Behavioral of ALU_arch is


begin

process (SC,CRS1,CRS2) begin
	case SC is
		when "000"=> result<= CRS1 + CRS2;
		when "001"=> result<= CRS1 and CRS2;
		when "010"=> result<= CRS1 or CRS2;
		when "011"=> result<= CRS1 xor CRS2;
		when "100"=> result<= CRS1 - CRS2;
		when "101"=> result<= CRS1 and not CRS2;
		when "110"=> result<= CRS1 or not CRS2;
		when "111"=> result<= CRS1 xnor CRS2;
		when others=> result<= CRS1 + CRS2;
	end case;
end process;

end Behavioral;

