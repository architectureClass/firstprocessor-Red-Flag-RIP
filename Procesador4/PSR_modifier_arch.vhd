library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PSR_modifier_arch is
    Port ( rst   : in std_logic;
			  aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluresult : in  STD_LOGIC_VECTOR (31 downto 0);
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
end PSR_modifier_arch;

architecture Behavioral of PSR_modifier_arch is

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

process(rst,aluop,crs1,crs2,aluresult)begin
	if rst='1' then
		nzvc<= (others=>'0');
	else
		nzvc(3)<=aluresult(31);
		if (conv_integer(aluresult)=0) then
			nzvc(2)<='1';
		else
			nzvc(2)<='0';
		end if;
	--operadores logicos
		if aluop = "001001" or aluop = "001010" or aluop = "001011" or aluop = "001101" or aluop = "001110" or aluop = "001111" then
			nzvc(1)<='0';
			nzvc(0)<='0';
		end if;
	--addcc , addxcc		
		if aluop = "001000" or aluop = "010001" then
			nzvc(1)<= (crs1(31) and crs2(31) and (not aluresult(31))) or ((not crs1(31)) and (not crs2(31)) and aluresult(31));
			nzvc(0)<= (crs1(31) and crs2(31)) or ((not aluresult(31)) and (crs1(31) or crs2(31)));
		end if;
	--subcc , subxcc
		if aluop = "001100" or aluop = "010011" then
			nzvc(1)<= (crs1(31) and (not crs2(31)) and (not aluresult(31))) or ((not crs1(31)) and crs2(31) and aluresult(31));
			nzvc(0)<= ((not crs1(31)) and crs2(31)) or (aluresult(31) and ((not crs1(31)) or crs2(31)));
		end if;
	end if;
end process;

end Behavioral;

