library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Datapath_arch is
    Port ( clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end Datapath_arch;

architecture Behavioral of Datapath_arch is

component  program_counter_arch is
    Port ( data : in  STD_LOGIC_vector(31 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           dataOut : out  STD_LOGIC_vector(31 downto 0));
end component;

component adder_arch is
    Port ( op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component instruction_memory_arch is
    Port ( address : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           dataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component register_file_arch is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           rst : in  STD_LOGIC;
           DWR : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component UC_arch is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           aluop : out  STD_LOGIC_VECTOR (2 downto 0));
end component;

component ALU_arch is
    Port ( SC   : in  STD_LOGIC_VECTOR (2 downto 0);
			  CRS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component SEN_arch is
    Port ( imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           extended_sign : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MUX_datapath_arch is
    Port ( i : in  STD_LOGIC;
			  csr : in  STD_LOGIC_VECTOR (31 downto 0);
           imm : in  STD_LOGIC_VECTOR (31 downto 0);
           muxout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


--signals
signal PCout    : std_logic_vector(31 downto 0) := (others=> '0');
signal adderOut : std_logic_vector(31 downto 0) := (others=> '0');
signal imOut    : std_logic_vector(31 downto 0) := (others=> '0');
signal seuOut   : std_logic_vector(31 downto 0) := (others=> '0');
signal rfOut1   : std_logic_vector(31 downto 0) := (others=> '0');
signal rfOut2   : std_logic_vector(31 downto 0) := (others=> '0');
signal mxOut   : std_logic_vector(31 downto 0) := (others=> '0');
signal ucOut    : std_logic_vector(2 downto 0) := (others=> '0');
signal aluOut   : std_logic_vector(31 downto 0) := (others=> '0');


begin

program_counter: program_counter_arch port map(
							data=>adderOut,
							rst=>rst,
							clk=>clk,
							dataOut=>PCout
							);

adder : adder_arch port map(
			op1=>x"00000001",
			op2=>PCout,
			result=>adderOut
			);
			
IM: instruction_memory_arch port map(
		address=>PCout,
		rst=>rst,
		dataOut=>imOut
		);

SEU: SEN_arch port map(
		imm13=>imOut(12 downto 0),
		extended_sign=>seuOut
		);

RF: register_file_arch port map(
		rs1=>imOut(18 downto 14),
		rs2=>imOut(4 downto 0),
		rd=>imOut(29 downto 25),
		rst=>rst,
		DWR=>aluOut,
		CRS1=>rfOut1,
		CRS2=>rfOut2
		);

MUX: MUX_datapath_arch port map(
		i=>imOut(13),
		csr=>rfOut2,
		imm=>seuOut,
		muxout=>mxOut
		);

UC: UC_arch port map(
		op=>imOut(31 downto 30),
		op3=>imOut (24 downto 19),
		aluop=>ucOut
		);
		
ALU: ALU_arch port map(
		SC=>ucOut,
		CRS1=>rfOut1,
		CRS2=>mxOut,
		result=>aluOut
		);
		
AluResult<=aluOut;
		
end Behavioral;

