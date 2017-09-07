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

entity asalu2 is
    Port ( clk : in  STD_LOGIC;
           x : in  STD_LOGIC_VECTOR (7 downto 0);
           y : in  STD_LOGIC_VECTOR (7 downto 0);
           cmd : in  STD_LOGIC_VECTOR (3 downto 0);
           flow : out  STD_LOGIC_VECTOR (7 downto 0);
           fhigh : out  STD_LOGIC_VECTOR (7 downto 0);
           coutF : out  STD_LOGIC;
			  overflowF : out STD_LOGIC;				
           equalF : out  STD_LOGIC;
			  zeroF : out  STD_LOGIC);
end asalu2;

architecture structural of asalu2 is

component claAdder is
	port (a      		:  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
         b      		:  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
         sum       	:  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
         carry_out 	:  OUT  STD_LOGIC
        );
end component;

component aSubB is
	port (a      		:  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
         b      		:  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
         sum       	:  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
         carry_out 	:  OUT  STD_LOGIC
        );
end component;

component bSubA is
	port (a      		:  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
         b      		:  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
         sum       	:  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
         carry_out 	:  OUT  STD_LOGIC
        );
end component;

component mux is
	port 	 (clk : in  STD_LOGIC;
			  cmd : in STD_LOGIC_VECTOR (3 downto 0);
			  a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
			  addResult : in STD_LOGIC_VECTOR (7 downto 0);
			  addCarry: in STD_LOGIC;
			  aSubBResult : in STD_LOGIC_VECTOR (7 downto 0);
			  aSubBCarry: in STD_LOGIC;
			  bSubAResult : in STD_LOGIC_VECTOR (7 downto 0);
			  bSubACarry: in STD_LOGIC;
           outlow : out  STD_LOGIC_VECTOR (7 downto 0);
           outhigh : out  STD_LOGIC_VECTOR (7 downto 0);
			  cOut : out STD_LOGIC;
			  equalOut : out STD_LOGIC;
			  zeroOut : out STD_LOGIC
			 );
end component;

signal resultAdd: STD_LOGIC_VECTOR (7 downto 0);
signal carryAdd: STD_LOGIC;
signal resultASubB: STD_LOGIC_VECTOR (7 downto 0);
signal carryASubB: STD_LOGIC;
signal resultBSubA: STD_LOGIC_VECTOR (7 downto 0);
signal carryBSubA: STD_LOGIC;

begin
u1: claAdder
port map (a => x,
			 b => y,
			 sum => resultAdd,
			 carry_out => carryAdd
			 );
			 
u2: aSubB
port map (a => x,
			 b => y,
			 sum => resultASubB,
			 carry_out => carryASubB
			 );
			 
u3: bSubA
port map (a => x,
			 b => y,
			 sum => resultBSubA,
			 carry_out => carryBSubA
			 );
			 
u4: mux
port map (clk => clk,
			 cmd => cmd,
			 a  => x,
          b  => y,
			 addResult => resultAdd,
			 addCarry => carryAdd,
			 aSubBResult => resultASubB,
			 aSubBCarry => carryASubB,
			 bSubAResult => resultBSubA,
			 bSubACarry => carryBSubA,
          outlow => flow,
          outhigh => fhigh,
			 cout => coutF,
			 equalOut => equalF,
			 zeroOut => zeroF
			 );

end architecture;

