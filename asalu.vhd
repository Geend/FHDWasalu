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
use IEEE.NUMERIC_STD.ALL;

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
           cout : out  STD_LOGIC;
           equal : out  STD_LOGIC);
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

	flow <= std_logic_vector(sflow);
	fhigh <= std_logic_vector(sfhigh);

	equalP: process(clk, a, b)
	begin
		if(rising_edge(clk)) then
			if(a=b)then
				equal <= '1';
			else
				equal <= '0';
			end if;
		end if;
	end process;


	process(clk, a, b, cmd)
	variable sA : signed (7 downto 0) := signed(a);
	variable sB : signed (7 downto 0) := signed(b);
	variable sOut: signed (15 downto 0) := "0000000000000000";

	
	begin
		if(rising_edge(clk)) then
		
			case cmd is
				when add =>					
					sOut := sA +sB;					
					sflow <= sOut (7 downto 0);
					sfhigh <= sOut (15 downto 8);

					cOut <= sOut (8);

				when AsubB =>
					sflow <= sA - sB;
				when BsubA =>
					sflow <= sB - sA;
				when idA =>
					sflow <= sA;
					sfhigh <= "00000000";
				when idB  =>
					sflow <= sB;
					sfhigh <= "00000000";
				when negA =>
					sflow <= -sA;
					sfhigh <= "00000000";
				when negB =>
					sflow <= -sB;
					sfhigh <= "00000000";
				when sllA =>
				when slrA =>
				when rllA =>
				when rlrA =>
				when mul =>
				when zero =>
					sflow <= "00000000";
					sfhigh <= "00000000";
				when one =>
					sflow <= "00000001";
					sfhigh <= "00000000";
				when others =>
			end case;
		
		end if;
	
	end process;

end architecture;

