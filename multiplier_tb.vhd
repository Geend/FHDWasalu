--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:35:51 09/11/2017
-- Design Name:   
-- Module Name:   D:/6.Semester/ES/Projekte/FHDWasalu/multiplier_tb.vhd
-- Project Name:  asalu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: multiplier
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
 
ENTITY multiplier_tb IS
END multiplier_tb;
 
ARCHITECTURE behavior OF multiplier_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplier
    PORT(
         x : IN  std_logic_vector(7 downto 0);
         y : IN  std_logic_vector(7 downto 0);
         result : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(7 downto 0) := (others => '0');
   signal y : std_logic_vector(7 downto 0) := (others => '0');
	signal clock: std_logic := '0';

 	--Outputs
   signal result : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplier PORT MAP (
          x => x,
          y => y,
          result => result
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

      wait for clock_period*10;

      x <= "00000000";
		y <= "00000000";
      wait for clock_period*10;

      x <= "00000100";
		y <= "00000011"; 
		
		 wait for clock_period*10;

      x <= "00000010";
		y <= "00001111"; 
		
		 wait for clock_period*10;

      x <= "10001100";
		y <= "00100011"; 

      wait;
   end process;

END;
