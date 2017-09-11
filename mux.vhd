----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:42:08 09/06/2017 
-- Design Name: 
-- Module Name:    mux - Behavioral 
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux is
    Port ( clk : in  STD_LOGIC;
			  cmd: in STD_LOGIC_VECTOR (3 downto 0);
			  a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
			  addResult : in STD_LOGIC_VECTOR (7 downto 0);
			  addCarry: in STD_LOGIC;
			  aSubBResult : in STD_LOGIC_VECTOR (7 downto 0);
			  aSubBCarry: in STD_LOGIC;
			  bSubAResult : in STD_LOGIC_VECTOR (7 downto 0);
			  bSubACarry: in STD_LOGIC;
			  mulResult: in STD_LOGIC_VECTOR (15 downto 0);
           outlow : out  STD_LOGIC_VECTOR (7 downto 0);
           outhigh : out  STD_LOGIC_VECTOR (7 downto 0);
			  cOut : out STD_LOGIC;
			  equalOut : out STD_LOGIC;
			  zeroOut : out STD_LOGIC);
end mux;

architecture Behavioral of mux is

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

signal result: std_logic_vector (7 downto 0) := "00000000";
signal resultHigh: std_logic_vector (7 downto 0) := "00000000";

begin

equalP: process(clk, a, b)
	begin
		if(rising_edge(clk)) then
			if(a=b)then
				equalOut<= '1';
			else
				equalOut <= '0';
			end if;
		end if;
	end process;

	zeroP: process(clk, result)
	begin
		if(rising_edge(clk)) then
			if(result= "00000000")then
				zeroOut<= '1';
			else
				zeroOut <= '0';
			end if;
		end if;
	end process;

process(clk, a, b, cmd)
begin
		if(rising_edge(clk)) then
		
			case cmd is
				when add =>					
					
					result <= addResult;
					resultHigh <= "00000000";
					cOut <= addCarry;
					
					
				when AsubB =>
					
					result <= aSubBResult;
					resultHigh <= "00000000";
					cOut <= aSubBCarry;
					
				when BsubA =>

					result <= bSubAResult;
					resultHigh <= "00000000";
					cOut <= bSubACarry;
					
				when idA =>
					result <= a;
					resultHigh <= "00000000";
					cOut <= '0';
					
				when idB  =>
					result <= b;
					resultHigh <= "00000000";
					cOut <= '0';
					
				when negA =>
					result <= (not a) + 1;
					resultHigh <= "00000000";
					
				when negB =>
					result <= (not b) + 1;
					resultHigh <= "00000000";
					
				when sllA =>
					result(7 downto 1) <= a(6 downto 0);
					result(0) <= '0';				
					resultHigh <= "00000000";
					
				when slrA =>
					result(6 downto 0) <= a(7 downto 1);
					result(7) <= '0';	
					resultHigh <= "00000000";
					
				when rllA =>
					result(7 downto 1) <= a(6 downto 0);
					result(0) <= a(7);
					resultHigh <= "00000000";
					
				when rlrA =>
					result(6 downto 0) <= a(7 downto 1);
					result(7) <= a(0);
					resultHigh <= "00000000";
					
				when mul =>
					result <= mulResult(7 downto 0);
					resultHigh <= mulResult(15 downto 8);
					cOut <= '0';
					
				when zero =>
					result <= "00000000";
					resultHigh <= "00000000";
					
				when one =>
					result <= "11111111";
					resultHigh <= "00000000";

				when others =>
			end case;
			outlow <= result;
			outhigh <= resultHigh;
		end if;
	
	end process;

end architecture;

