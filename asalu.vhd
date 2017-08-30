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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

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

begin


end Behavioral;

