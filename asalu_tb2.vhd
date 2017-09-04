--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:15:43 09/04/2017
-- Design Name:   
-- Module Name:   /home/torben/sync/FHDW/BES2-U2/vhdl/asalu/asalu_tb2.vhd
-- Project Name:  asalu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: asalu
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
 
ENTITY asalu_tb2 IS
END asalu_tb2;
 
ARCHITECTURE behavior OF asalu_tb2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT asalu
    PORT(
         clk : IN  std_logic;
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
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
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
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
   uut: asalu PORT MAP (
          clk => clk,
          a => a,
          b => b,
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
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		

      wait for clk_period*10;

      -- insert stimulus here 
		
		--ADD
		cmd <= add;
		a <= "00000100";
		b <= "01111111";		
		wait for clk_period*1;
		
		a <= "11111100";
		b <= "10000001";		
		wait for clk_period*1;		
				
		a <= "00000100";
		b <= "11111101";		
		wait for clk_period*1;
		
		--AsubB
		wait for clk_period*2;
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
		cmd <= mul;
		a <= "11111001";
		b <= "00001101";
		wait for clk_period*1;
		a <= "01111111";
		b <= "01111111";
		
		
		
		wait for clk_period*2;
		cmd <= zero;
		
		wait for clk_period*2;
		cmd <= one;
		
		wait for clk_period*2;
		a <= "10101010";
		b <= "10101010";
		
		wait for clk_period*2;
		a <= "00000000";
		
		

      wait;
   end process;

END;
