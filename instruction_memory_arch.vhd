library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use std.textio.all;

entity instruction_memory_arch is
    Port ( address : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           dataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end instruction_memory_arch;

architecture Behavioral of instruction_memory_arch is

type reg is array (0 to 31) of std_logic_vector(31 downto 0);

impure function fill_ram (file_name: in string) return reg is
	file f : text is in file_name;
	variable l : line;
	variable ram : reg;
	variable tmp : bit_vector(31 downto 0);
	begin
		for i in reg'range loop
			readline(f,l);
			read(l,tmp);
			ram(i) := to_stdlogicvector(tmp);
		end loop;
		return ram;
	end function;
	
signal finalRam : reg := fill_ram("filename.txt");



begin

process (rst,address) begin
	if rst = '1' then
		dataOut<= (others => '0');
	else
		dataOut<= finalRam(conv_integer(address(4 downto 0)));
	end if;
end process;



end Behavioral;

