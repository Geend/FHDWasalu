----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:22:03 08/30/2017 
-- Design Name: 
-- Module Name:    asalu - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
--use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity asalu is
    Port ( clk : in  STD_LOGIC;
           a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           cmd : in  STD_LOGIC_VECTOR (3 downto 0);
           flow : out  STD_LOGIC_VECTOR (7 downto 0);
           fhigh : out  STD_LOGIC_VECTOR (7 downto 0);
           coutF : out  STD_LOGIC;
			  overflowF : out STD_LOGIC;				
           equalF : out  STD_LOGIC;
			  zeroF : out  STD_LOGIC);
end asalu;

architecture architecture1 of asalu is

constant add : std_logic_vector(3 downto 0) 		:= "0000";
constant AsubB : std_logic_vector(3 downto 0)	:= "0001";
constant BsubA : std_logic_vector(3 downto 0)	:= "0010";
constant idA : std_logic_vector(3 downto 0)		:= "0011";
constant idB : std_logic_vector(3 downto 0)		:= "0100";
constant negA : std_logic_vector(3 downto 0)		:= "0101";
constant negB : std_logic_vector(3 downto 0)		:= "0110";
constant sllA : std_logic_vector(3 downto 0) 	:= "0111";
constant slrA : std_logic_vector(3 downto 0) 	:= "1000";
constant rllA : std_logic_vector(3 downto 0) 	:= "1001";
constant rlrA : std_logic_vector(3 downto 0) 	:= "1010";
constant mul : std_logic_vector(3 downto 0)		:= "1011";
constant zero : std_logic_vector(3 downto 0) 	:= "1100";
constant one : std_logic_vector(3 downto 0) 		:= "1101";



signal sflow: signed (7 downto 0) := "00000000";
signal sfhigh: signed (7 downto 0) := "00000000";

begin

	--flow <= std_logic_vector(sflow);
	--fhigh <= std_logic_vector(sfhigh);

	equalP: process(clk, a, b)
	begin
		if(rising_edge(clk)) then
			if(a=b)then
				equalF<= '1';
			else
				equalF <= '0';
			end if;
		end if;
	end process;

	zeroP: process(clk, a)
	begin
		if(rising_edge(clk)) then
			if(a= "00000000")then
				zeroF<= '1';
			else
				zeroF <= '0';
			end if;
		end if;
	end process;


	process(clk, a, b, cmd)
	variable sA : signed (7 downto 0) := signed(a);
	variable sB : signed (7 downto 0) := signed(b);
	variable sOut: std_logic_vector (15 downto 0) := "0000000000000000";
	
	
	variable addA : std_logic_vector(8 downto 0) := "000000000";
	variable addB : std_logic_vector(8 downto 0) := "000000000";
	variable addSum : std_logic_vector(8 downto 0) := "000000000";
	
	
	variable mulA : std_logic_vector(15 downto 0) := "0000000000000000";
	variable mulB : std_logic_vector(15 downto 0) := "0000000000000000";
	variable prodMul : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";

	begin
		if(rising_edge(clk)) then
		
			case cmd is
				when add =>					
				
					addA(8) := a(7);
					addA(7 downto 0) := a;
					
					addB(8) := b(7);
					addB(7 downto 0) := b;
					
					addSum := addA + addB;
					
					flow <= addSum (7 downto 0);
					overflowF <= addSum(8) xor addSum(7);					
			
					coutF <= addSum (8);
					fhigh <= "00000000";
					
				when AsubB =>
					addA(8) := a(7);
					addA(7 downto 0) := a;
					
					addB(8) := not b(7);
					addB(7 downto 0) := not b;
					
					addSum := addA + addB +1;
					
					flow <= addSum (7 downto 0);
					overflowF <= addSum(8) xor addSum(7);					
			
					coutF <= addSum (8);
					
					fhigh <= "00000000";
					
				when BsubA =>

					addA(8) := not a(7);
					addA(7 downto 0) := not a;
					
					addB(8) := b(7);
					addB(7 downto 0) := b;
					
					addSum := addA + addB +1;
					
					flow <= addSum (7 downto 0);
					overflowF <= addSum(8) xor addSum(7);					
			
					coutF <= addSum (8);
					
					fhigh <= "00000000";
					
				when idA =>
					flow <= a;
					fhigh <= "00000000";
					
				when idB  =>
					flow <= b;
					fhigh <= "00000000";
					
				when negA =>
					flow <= (not a) + 1;
					fhigh <= "00000000";
					
				when negB =>
					flow <= (not b) + 1;
					fhigh <= "00000000";
					
				when sllA =>
					flow(7 downto 1) <= a(6 downto 0);
					flow(0) <= '0';				
					fhigh <= "00000000";
					
				when slrA =>
					flow(6 downto 0) <= a(7 downto 1);
					flow(7) <= '0';	
					fhigh <= "00000000";
					
				when rllA =>
					flow(7 downto 1) <= a(6 downto 0);
					flow(0) <= a(7);
					fhigh <= "00000000";
					
				when rlrA =>
					flow(6 downto 0) <= a(7 downto 1);
					flow(7) <= a(0);
					fhigh <= "00000000";
					
				when mul =>
				
					mulA(15) := a(7);
					mulA(14) := a(7);
					mulA(13) := a(7);
					mulA(12) := a(7);
					mulA(11) := a(7);
					mulA(10) := a(7);
					mulA(9) := a(7);
					mulA(8) := a(7);
					mulA(7 downto 0) := a;
					
					mulB(15) := b(7);
					mulB(14) := b(7);
					mulB(13) := b(7);
					mulB(12) := b(7);
					mulB(11) := b(7);
					mulB(10) := b(7);
					mulB(9) := b(7);
					mulB(8) := b(7);
					mulB(7 downto 0) := b;
					
					
					prodMul := mulA * mulB;					
				
					flow <= prodMul (7 downto 0);
					fhigh <=  prodMul(15 downto 8);
					
				when zero =>
					flow <= "00000000";
					fhigh <= "00000000";
					
				when one =>
					flow <= "00000001";
					fhigh <= "00000000";
				when others =>
			end case;
		
		end if;
	
	end process;

end architecture;

