--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   07:52:54 09/06/2017
-- Design Name:   
-- Module Name:   D:/6.Semester/ES/Projekte/FHDWasalu/asalu2_tb.vhd
-- Project Name:  asalu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: asalu2
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY asalu2_tb IS
END asalu2_tb;
 
ARCHITECTURE behavior OF asalu2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT asalu2
    PORT(
         clk : IN  std_logic;
         x : IN  std_logic_vector(7 downto 0);
         y : IN  std_logic_vector(7 downto 0);
         cmd : IN  std_logic_vector(3 downto 0);
         flow : OUT  std_logic_vector(7 downto 0);
         fhigh : OUT  std_logic_vector(7 downto 0);
         coutF : OUT  std_logic;
         overflowF : OUT  std_logic;
         equalF : OUT  std_logic;
         zeroF : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal x : std_logic_vector(7 downto 0) := (others => '0');
   signal y : std_logic_vector(7 downto 0) := (others => '0');
   signal cmd : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal flow : std_logic_vector(7 downto 0);
   signal fhigh : std_logic_vector(7 downto 0);
   signal coutF : std_logic;
   signal overflowF : std_logic;
   signal equalF : std_logic;
   signal zeroF : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	
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
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: asalu2 PORT MAP (
          clk => clk,
          x => x,
          y => y,
          cmd => cmd,
          flow => flow,
          fhigh => fhigh,
          coutF => coutF,
          overflowF => overflowF,
          equalF => equalF,
          zeroF => zeroF
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	stim_proc: process
  begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		x <= "00000000";
		y <= "00000000";
		cmd <= "0000";
      wait for clk_period*10;

      x <= "00000100";
		y <= "11111101";
		cmd <= add;
		wait for clk_period*2;
		
		cmd <= AsubB;
		
		wait for clk_period*2;
		cmd <= BsubA;
		
		wait for clk_period*2;
		cmd <= idA;
		
		wait for clk_period*2;
		cmd <= idB;
		
		wait for clk_period*2;
		cmd <= negA;
		
		wait for clk_period*2;
		cmd <= negB;
		
		wait for clk_period*2;
		cmd <= sllA;
		
		wait for clk_period*2;
		cmd <= slrA;
		
		wait for clk_period*2;
		cmd <= rllA;
		
		wait for clk_period*2;
		cmd <= rlrA;
		
		--MUL
		
		
		
		wait for clk_period*2;
		cmd <= zero;
		
		wait for clk_period*2;
		cmd <= one;
		
		wait for clk_period*2;
		x <= "10101010";
		y <= "10101010";
		
		wait for clk_period*2;
		cmd <= idA;
		x <= "00000000";
      wait;
   end process;

END;
