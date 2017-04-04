
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity UC_arch is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           aluop : out  STD_LOGIC_VECTOR (2 downto 0));
end UC_arch;

architecture Behavioral of UC_arch is

begin
	process(op,op3) begin
		if op = "10" then
			case op3 is
				when "000000" => aluop<="000"; --Suma
				when "000001" => aluop<="001"; --And
				when "000010" => aluop<="010"; --Or
				when "000011" => aluop<="011"; --Xor
				when "000100" => aluop<="100"; --Resta
				when "000101" => aluop<="101"; --AndN
				when "000110" => aluop<="110"; --OrN
				when "000111" => aluop<="111"; --Xnor
				when others   => aluop<="000";
			end case;
		end if;
	end process;


end Behavioral;

