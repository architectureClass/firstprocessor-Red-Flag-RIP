
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity register_file_arch is
    Port ( rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           rd : in  STD_LOGIC_VECTOR (5 downto 0);
           rst : in  STD_LOGIC;
           DWR : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end register_file_arch;

architecture Behavioral of register_file_arch is

type RF is array (0 to 39) of std_logic_vector(31 downto 0);

signal R : RF :=(others=>x"00000000"); 

begin

process (rst,rs1,rs2,rd,DWR,R) begin
	R(0)<= (others => '0');
	CRs1 <= R(conv_integer(rs1));
	CRs2 <= R(conv_integer(rs2));
	if rst = '1' then
		Crs1<= (others => '0');
		Crs2<= (others => '0');
	else
		if rd /= 0 then
			R(conv_integer(rd)) <= DWR;
		end if;
	end if;
end process;
end Behavioral;

