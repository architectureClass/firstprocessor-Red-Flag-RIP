library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALU_arch is
    Port ( SC   : in  STD_LOGIC_VECTOR (5 downto 0);
			  CRS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  carry: in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU_arch;

architecture Behavioral of ALU_arch is

--add		: "000000"
--and		: "000001"
--or 		: "000010"
--xor		: "000011"
--sub		: "000100"
--andn	: "000101"
--orn		: "000110"
--xnor	: "000111"

--addcc	: "001000"
--andcc	: "001001"
--orcc	: "001010"
--xorcc	: "001011"
--subcc	: "001100"
--andncc	: "001101"
--orncc	: "001110"
--xnorcc	: "001111"

--addx	: "010000"
--addxcc	: "010001"
--subx 	: "010010"
--subxcc : "010011"

begin

process (SC,CRS1,CRS2,carry) begin
	case SC is
		when "000000" | "001000"=> result<= CRS1 + CRS2;
		when "000001" | "001001"=> result<= CRS1 and CRS2;
		when "000010" | "001010"=> result<= CRS1 or CRS2;
		when "000011" | "001011"=> result<= CRS1 xor CRS2;
		when "000100" | "001100"=> result<= CRS1 - CRS2;
		when "000101" | "001101"=> result<= CRS1 and not CRS2;
		when "000110" | "001110"=> result<= CRS1 or not CRS2;
		when "000111" | "001111"=> result<= CRS1 xnor CRS2;
		when "010000" | "010001"=> result<= CRS1 + CRS2 + carry;
		when "010010" | "010011"=> result<= CRS1 - CRS2 - carry;
		when others=> result<= CRS1+CRS2;
	end case;
end process;

end Behavioral;

