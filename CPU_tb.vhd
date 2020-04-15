LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_ARITH.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.numeric_std.ALL;

entity CPU_tb is
end CPU_tb;

architecture behavior of CPU_tb is

component CPU
 port(  A : in std_logic_vector (15 downto 0);
        B : in std_logic_vector (15 downto 0);
        ALU_out : out std_logic_vector(31 downto 0);
	Overflow, EQ, GT, ZA, ZB : in std_logic;
	enable : in std_logic;
	loadIR : out std_logic;
	opcode2 : in std_logic_vector (2 downto 0);
	Mode1   : in std_logic_vector (1 downto 0)); 
end component;

signal  A_tb : std_logic_vector (15 downto 0);
signal  B_tb : std_logic_vector (15 downto 0);
signal  ALU_out_tb : std_logic_vector(31 downto 0);
signal	Overflow_tb, EQ_tb, GT_tb, ZA_tb, ZB_tb :  std_logic;
signal	enable_tb, loadIR_tb :  std_logic;
signal	opcode2_tb :  std_logic_vector (2 downto 0);
signal	Mode1_tb   :  std_logic_vector (1 downto 0); 

begin

DUT : CPU port map (A_tb, B_tb, ALU_out_tb, Overflow_tb, EQ_tb, GT_tb, ZA_tb, ZB_tb, enable_tb, loadIR_tb, opcode2_tb, Mode1_tb);

process
begin

	
	loadIR_tb <= '1';
	Mode1_tb <= "10";
        opcode2_tb <= "000";
	A_tb <= "0111011111000110";
        
	wait for 10 ns;
	
	enable_tb <='1';
	loadIR_tb <= '1';
	Mode1_tb <= "10";
        opcode2_tb <= "001";
	B_tb <= "0101000001010101";
	
	wait for 10 ns;
	enable_tb <= '1';
	loadIR_tb <= '1';
	A_tb <= "0000000000000000";
        B_tb <= "0000000000000000";
        Mode1_tb <= "10";
        opcode2_tb <= "010";
	wait for 10 ns;
	
	Mode1_tb <= "00";
        opcode2_tb <= "011";
	B_tb <= "0000000011111111";
	wait for 10 ns;
	
-------------NOR-------------
	Mode1_tb <= "01";
        opcode2_tb <= "011";

	wait for 20 ns;
	
	enable_tb <= '1';
	Mode1_tb <= "11";
        opcode2_tb <= "000";

	wait for 20 ns;
	enable_tb <= '1';
 	A_tb <= "0000011111000110";
        B_tb <= "0101010101010101";
        Mode1_tb <= "01";
        opcode2_tb <= "110";
	loadIR_tb <= '1';

        wait for 10 ns;

	enable_tb <='0';
	wait for 20 ns;

	enable_tb <= '1';
	loadIR_tb <= '0';
	
	wait for 10 ns;
	enable_tb <= '1';
	loadIR_tb <= '1';
	A_tb <= "1111111111000110";
        B_tb <= "0000000000000000";
        Mode1_tb <= "11";
        opcode2_tb <= "001";

end process;
end behavior;