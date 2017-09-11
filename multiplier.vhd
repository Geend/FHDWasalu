----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:21:31 09/11/2017 
-- Design Name: 
-- Module Name:    multiplier - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplier is
    Port ( w : in  STD_LOGIC_VECTOR (7 downto 0);
           v : in  STD_LOGIC_VECTOR (7 downto 0);
           result : out  STD_LOGIC_VECTOR (15 downto 0));
end multiplier;

architecture Behavioral of multiplier is


component claAdder is
	port (a      		:  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
         b      		:  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
			enable		: 	IN	  STD_LOGIC;
         sum       	:  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
         carry_out 	:  OUT  STD_LOGIC
        );
end component;

signal out1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal out2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal out3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal out4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal out5 : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal out6 : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal out7 : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal out8 : STD_LOGIC_VECTOR(7 DOWNTO 0);

signal carryOut1 : STD_LOGIC;
signal carryOut2 : STD_LOGIC;
signal carryOut3 : STD_LOGIC;
signal carryOut4 : STD_LOGIC;
signal carryOut5 : STD_LOGIC;
signal carryOut6 : STD_LOGIC;
signal carryOut7 : STD_LOGIC;
signal carryOut8 : STD_LOGIC;


begin

result(0) <= out1(0);
result(1) <= out2(0);
result(2) <= out3(0);
result(3) <= out4(0);
result(4) <= out5(0);
result(5) <= out6(0);
result(6) <= out7(0);

u1: claAdder
port map (a => "00000000",
			 b => w,
			 enable => v(0),
			 sum => out1,
			 carry_out => carryOut1
			 );

u2: claAdder
port map (a(6 downto 0) => out1(7 downto 1),
			 a(7) => carryOut1,
			 b => w,
			 enable => v(1),
			 sum => out2,
			 carry_out => carryOut2
			 );
			 
u3: claAdder
port map (a(6 downto 0) => out2(7 downto 1),
			 a(7) => carryOut2,
			 b => w,
			 enable => v(2),
			 sum => out3,
			 carry_out => carryOut3
			 );
			 
u4: claAdder
port map (a(6 downto 0) => out3(7 downto 1),
			 a(7) => carryOut3,
			 b => w,
			 enable => v(3),
			 sum => out4,
			 carry_out => carryOut4
			 );
			 
u5: claAdder
port map (a(6 downto 0) => out4(7 downto 1),
			 a(7) => carryOut4,
			 b => w,
			 enable => v(4),
			 sum => out5,
			 carry_out => carryOut5
			 );

u6: claAdder
port map (a(6 downto 0) => out5(7 downto 1),
			 a(7) => carryOut5,
			 b => w,
			 enable => v(5),
			 sum => out6,
			 carry_out => carryOut6
			 );
			 
u7: claAdder
port map (a(6 downto 0) => out6(7 downto 1),
			 a(7) => carryOut6,
			 b => w,
			 enable => v(6),
			 sum => out7,
			 carry_out => carryOut7
			 );
			 
u8: claAdder
port map (a(6 downto 0) => out7(7 downto 1),
			 a(7) => carryOut7,
			 b => w,
			 enable => v(7),
			 sum => result(14 downto 7),
			 carry_out => result(15)
			 );
			 


end Behavioral;

