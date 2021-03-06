----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:13:56 09/06/2017 
-- Design Name: 
-- Module Name:    claAdder - behavioral 
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

ENTITY claAdder IS
    PORT
        (
         a      		:  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
         b      		:  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
			enable		: 	IN	  STD_LOGIC;
         sum       	:  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
         carry_out 	:  OUT  STD_LOGIC
        );
END claAdder;

ARCHITECTURE behavioral OF claAdder IS

Shared Variable    h_sum              :    STD_LOGIC_VECTOR(8 DOWNTO 0);
Shared Variable    carry_generate     :    STD_LOGIC_VECTOR(8 DOWNTO 0);
Shared Variable    carry_propagate    :    STD_LOGIC_VECTOR(8 DOWNTO 0);
Shared Variable    carry_in_internal  :    STD_LOGIC_VECTOR(8 DOWNTO 1);

	Shared Variable addA : std_logic_vector(8 downto 0) := "000000000";
	Shared Variable addB : std_logic_vector(8 downto 0) := "000000000";
	Shared Variable addSum : std_logic_vector(8 downto 0) := "000000000";

BEGIN

	
		
	 
    PROCESS (a, b, enable)
    BEGIN
	 if (enable = '1') then
	 addA(8) := a(7);
		addA(7 downto 0) := a;
					
		addB(8) := b(7);
		addB(7 downto 0) := b;
		
    h_sum := addA XOR addB;
    carry_generate := addA AND addB;
    carry_propagate := addA OR addB;
    carry_in_internal(1) := carry_generate(0);
        inst: FOR i IN 1 TO 7 LOOP
              carry_in_internal(i+1) := carry_generate(i) OR (carry_propagate(i) AND carry_in_internal(i));
              END LOOP;
    carry_out <= carry_generate(7) OR (carry_propagate(7) AND carry_in_internal(7));
	 addSum(0) := h_sum(0);
    addSum(8 DOWNTO 1) := h_sum(8 DOWNTO 1) XOR carry_in_internal(8 DOWNTO 1);
	 
	 sum <= addSum (7 downto 0);
	 else 
		sum <= a;
		carry_out <= '0';
		
	end if;
	
    END PROCESS;

    
	
END behavioral;