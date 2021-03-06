--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   07:17:05 09/06/2017
-- Design Name:   
-- Module Name:   D:/6.Semester/ES/Projekte/FHDWasalu/claAdder_tb.vhd
-- Project Name:  asalu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: claAdder
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
 
ENTITY aSubB_tb IS
END aSubB_tb;
 
ARCHITECTURE behavior OF aSubB_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT aSubB
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         sum : OUT  std_logic_vector(7 downto 0);
         carry_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
	signal clock: std_logic := '0';

 	--Outputs
   signal sum : std_logic_vector(7 downto 0);
   signal carry_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: aSubB PORT MAP (
          a => a,
          b => b,
          sum => sum,
          carry_out => carry_out
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		a <= "00000100";
		b <= "11111101";
      wait for clock_period*10;

      
		wait for clock_period*2;

      wait;
   end process;

END;
