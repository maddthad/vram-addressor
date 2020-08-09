----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Thad Seeberger
-- 
-- Create Date: 02/13/2019 09:12:45 AM
-- Design Name: 
-- Module Name: vram_addr - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vram_addrB is
    Port ( H2 : in STD_LOGIC;
           H4 : in STD_LOGIC;
           H8 : in STD_LOGIC;
           H16 : in STD_LOGIC;
           H32 : in STD_LOGIC;
           H64 : in STD_LOGIC;
           H128 : in STD_LOGIC;
           H256L : in STD_LOGIC;
           V8 : in STD_LOGIC;
           V16 : in STD_LOGIC;
           V32 : in STD_LOGIC;
           V64 : in STD_LOGIC;
           V128 : in STD_LOGIC;
           FLIP : in STD_LOGIC;
           AB : out STD_LOGIC_VECTOR (11 downto 0));
	attribute pinnum         : string;
	attribute pinnum of H2: signal is "2";
	attribute pinnum of H4: signal is "3";
	attribute pinnum of H8: signal is "5";
	attribute pinnum of H16: signal is "6";
	attribute pinnum of H32: signal is "8";
	attribute pinnum of H64: signal is "10";
	attribute pinnum of H128: signal is "11";	
	attribute pinnum of H256L: signal is "12";
	attribute pinnum of V8: signal is "13";
	attribute pinnum of V16: signal is "14";
	attribute pinnum of V32: signal is "15";
	attribute pinnum of V64: signal is "18";
	attribute pinnum of V128: signal is "19";
	attribute pinnum of FLIP : signal is "42";
	attribute pinnum of AB : signal is "20, 21, 22, 23, 25, 27, 28, 30, 31, 33, 34, 35";
end vram_addrB;

architecture Behavioral of vram_addrB is
    signal A157 : STD_LOGIC_VECTOR( 11 downto 0);
    signal B157 : STD_LOGIC_VECTOR(11 downto 0);
    signal Y157 : STD_LOGIC_VECTOR(11 downto 0);
    signal S157 : STD_LOGIC;
    signal A257 : STD_LOGIC_VECTOR(11 downto 0);
    signal B257 : STD_LOGIC_VECTOR(11 downto 0);
    signal Y257 : STD_LOGIC_VECTOR(11 downto 0);
    signal S257 : STD_LOGIC;
    signal E257L : STD_LOGIC;
    signal VP128 : STD_LOGIC;
    signal VP64 : STD_LOGIC;
    signal VP32 : STD_LOGIC;
    signal VP16 : STD_LOGIC;
    signal VP8 : STD_LOGIC;
    signal HP128 : STD_LOGIC;
    signal HP64 : STD_LOGIC;
    signal HP32 : STD_LOGIC;
    signal HP16 : STD_LOGIC;
    signal HP8 : STD_LOGIC;

begin
VP128 <= V128 XOR FLIP;
VP64 <= V64 XOR FLIP;
VP32 <= V32 XOR FLIP;
VP16 <= V16 XOR FLIP;
VP8 <= V8 XOR FLIP;
HP128 <= H128 XOR FLIP;
HP64 <= H64 XOR FLIP;
HP32 <= H32 XOR FLIP;
HP16 <= H16 XOR FLIP;
HP8 <= H8 XOR FLIP;
S157 <=  (H16 XOR H32) NOR (H32 XOR H64);
S257 <= H256L;

Y157 <= '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & H64 & H32 & H16 & H4
    WHEN S157 = '0'
    ELSE '0' & H4 & HP64 & HP64 & HP64 & HP64 & HP8 & VP128 & VP64 & VP32 & VP16 & VP8;

Y257 <= Y157
    WHEN H256L = '0'
    ELSE '0' & H4 & VP128 & VP64 & VP32 & VP16 & VP8 & HP128 & HP64 & HP32 & HP16 & HP8;
 
 AB <=  Y257
    WHEN H2 = '1'
    ELSE "ZZZZZZZZZZZZ";     
    

end Behavioral;
