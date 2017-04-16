library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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

entity UC_arch is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           aluop : out  STD_LOGIC_VECTOR (5 downto 0));
end UC_arch;

architecture Behavioral of UC_arch is

begin

	process(op,op3) begin
		if op = "10" then
			case op3 is
				when "000000" => aluop<="000000"; --Suma
				when "000001" => aluop<="000001"; --And
				when "000010" => aluop<="000010"; --Or
				when "000011" => aluop<="000011"; --Xor
				when "000100" => aluop<="000100"; --Resta
				when "000101" => aluop<="000101"; --AndN
				when "000110" => aluop<="000110"; --OrN
				when "000111" => aluop<="000111"; --Xnor
				when "001000" => aluop<="001000"; --Sumacc
				when "001001" => aluop<="001001"; --Andcc
				when "001010" => aluop<="001010"; --Orcc
				when "001011" => aluop<="001011"; --Xorcc
				when "001100" => aluop<="001100"; --Restacc
				when "001101" => aluop<="001101"; --Andncc
				when "001110" => aluop<="001110"; --Orncc
				when "001111" => aluop<="001111"; --Xnorcc
				when others   => aluop<="000000";
			end case;
		end if;
	end process;


end Behavioral;

