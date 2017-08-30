--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:08:28 08/30/2017
-- Design Name:   
-- Module Name:   D:/6.Semester/ES/Projekte/FHDWasalu/asalu_tb.vhd
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE STD.TEXTIO.ALL;
USE ieee.numeric_std.ALL;
use IEEE.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY asalu_tb IS
END asalu_tb;
 
ARCHITECTURE behavior OF asalu_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT asalu
    PORT(
         clk : IN  std_logic;
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         cmd : IN  std_logic_vector(3 downto 0);
         flow : OUT  std_logic_vector(7 downto 0);
         fhigh : OUT  std_logic_vector(7 downto 0);
         cout : OUT  std_logic;
         equal : OUT  std_logic
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
   signal cout : std_logic;
   signal equal : std_logic;

    --Functions
FUNCTION char2std_logic (ch: IN CHARACTER) RETURN STD_LOGIC IS
BEGIN
  CASE ch IS
    WHEN 'U' | 'u' => RETURN 'U';
    WHEN 'X' | 'x' => RETURN 'X';
    WHEN '0' => RETURN '0';
    WHEN '1'=> RETURN '1';
    WHEN 'Z' | 'z' => RETURN 'Z';
    WHEN 'W' | 'w' => RETURN 'W';
    WHEN 'L' | 'l' => RETURN 'L';
    WHEN 'H' | 'h' => RETURN 'H';
    WHEN '-' => RETURN '-';
    WHEN OTHERS =>
  ASSERT FALSE
    REPORT "Illegal Character found" & ch
    SEVERITY ERROR;
  RETURN 'U';
  END CASE;
END;

FUNCTION string2std_logic (s: STRING) RETURN STD_LOGIC_VECTOR IS
VARIABLE vector: STD_LOGIC_VECTOR(s'LEFT - 1 DOWNTO 0);
BEGIN
  FOR i IN s'RANGE LOOP
    vector(i-1) := char2std_logic(s(i));
  END LOOP;
  RETURN vector;
END;

-- converts std_logic into a character
FUNCTION std_logic2char(sl: std_logic) return character is
    variable c: character;
    begin
      case sl is
         when 'U' => c:= 'U';
         when 'X' => c:= 'X';
         when '0' => c:= '0';
         when '1' => c:= '1';
         when 'Z' => c:= 'Z';
         when 'W' => c:= 'W';
         when 'L' => c:= 'L';
         when 'H' => c:= 'H';
         when '-' => c:= '-';
      end case;
    return c;
   end std_logic2char;

FUNCTION std_logic2string(slv: std_logic_vector) return string is
  variable result : string (1 to slv'length);
  variable r : integer;
begin
  r := 1;
  for i in slv'range loop
    result(r) := std_logic2char(slv(i));
    r := r + 1;
  end loop;
  return result;
end std_logic2string;

shared variable expected1 : STRING(8 DOWNTO 1);
shared variable expected2 : STRING(8 DOWNTO 1);
shared variable expected3 : CHARACTER;
shared variable expected4 : CHARACTER;

-- Testbench
BEGIN
-- Taktgenerator
clk <= NOT clk AFTER 50 ns;

UUT: asalu PORT MAP(a=>a, b=>b, cmd=>cmd, flow=>flow, fhigh=>fhigh, cout=>cout, equal=>equal, clk=>clk);

STIMULI: PROCESS(clk)
  FILE testpattern: TEXT OPEN READ_MODE IS "stimuli.txt";
  VARIABLE zeile: LINE;
  VARIABLE leerzeichen: CHARACTER;
  VARIABLE var1: STRING(8 DOWNTO 1);
  VARIABLE var2: STRING(8 DOWNTO 1);
  VARIABLE var3: STRING(4 DOWNTO 1);
BEGIN
  IF(clk'EVENT AND clk = '1') THEN
    IF(NOT endfile(testpattern)) THEN
      readline(testpattern, zeile);
      read(zeile, var1);
      a <= string2std_logic(var1);
-- Überspringen des Leerzeichens
      read(zeile, leerzeichen);
      read(zeile, var2);
      b <= string2std_logic(var2);
		-- Überspringen des Leerzeichens
      read(zeile, leerzeichen);
      read(zeile, var3);
      cmd <= string2std_logic(var3);
    END IF;
  END IF;
END PROCESS STIMULI;

RESPONSE: PROCESS(clk)
  FILE vergleichspattern: TEXT OPEN READ_MODE IS "expected.txt";
  VARIABLE zeile: LINE;
  VARIABLE leerzeichen: CHARACTER;
  VARIABLE var1: STRING(8 DOWNTO 1);
  VARIABLE var2: STRING(8 DOWNTO 1);
  VARIABLE var3: CHARACTER;
  VARIABLE var4: CHARACTER;
BEGIN
  IF(clk'EVENT AND clk = '1') THEN
    IF(NOW > 100 ns) THEN
      IF(NOT endfile(vergleichspattern)) THEN
        readline(vergleichspattern, zeile);
        read(zeile, var1);
		  expected1 := var1;
        ASSERT string2std_logic(var1) = flow
          REPORT "Vergleich fehlerhaft!" & "  Erwartungswert: " & var1 & "  Ergebnis: " & std_logic2string(flow)
          SEVERITY WARNING;
			-- Überspringen des Leerzeichens
			read(zeile, leerzeichen);
			read(zeile, var2);
		  expected2 := var2;
        ASSERT string2std_logic(var2) = fhigh
          REPORT "Vergleich fehlerhaft!" & "  Erwartungswert: " & var2 & "  Ergebnis: " & std_logic2string(fhigh)
          SEVERITY WARNING;
			 -- Überspringen des Leerzeichens
			read(zeile, leerzeichen);
			read(zeile, var3);
		  expected3 := var3;
        ASSERT char2std_logic(var3) = cout
          REPORT "Vergleich fehlerhaft!" & "  Erwartungswert: " & var3 & "  Ergebnis: " & std_logic2char(cout)
          SEVERITY WARNING;
			 -- Überspringen des Leerzeichens
			read(zeile, leerzeichen);
			read(zeile, var4);
		  expected4 := var4;
        ASSERT char2std_logic(var4) = equal
          REPORT "Vergleich fehlerhaft!" & "  Erwartungswert: " & var4 & "  Ergebnis: " & std_logic2char(equal)
          SEVERITY WARNING;
		ELSE expected1 := (others => 'X');
			  expected2 := (others => 'X');
			  expected3 := 'X';
			  expected4 := 'X';
      END IF;
    END IF;
  END IF;
END PROCESS RESPONSE;

MONITOR: PROCESS(clk)
  FILE protokoll: TEXT OPEN WRITE_MODE IS "monitor.txt";
  VARIABLE zeile: LINE;
  VARIABLE leerzeichen: CHARACTER := ' ';
  VARIABLE var1: STRING(8 DOWNTO 1);
  VARIABLE var2: STRING(8 DOWNTO 1);
  VARIABLE var3: STRING(4 DOWNTO 1);
  VARIABLE var4: STRING(8 DOWNTO 1);
  VARIABLE var5: STRING(8 DOWNTO 1);
  VARIABLE var6: CHARACTER;
  VARIABLE var7: CHARACTER;
  VARIABLE simulationszeit: TIME;
BEGIN
  IF(NOW > 100 ns) THEN
    IF(clk'EVENT AND clk = '1') THEN
      var1 := std_logic2string(a);
		var2 := std_logic2string(b);
		var3 := std_logic2string(cmd);
		var4 := std_logic2string(flow);
		var5 := std_logic2string(fhigh);
		var6 := std_logic2char(cout);
		var7 := std_logic2char(equal);
      simulationszeit := NOW;
      write(zeile, "A: " & var1);
      write(zeile, leerzeichen);
		write(zeile, "B: " & var2);
      write(zeile, leerzeichen);
		write(zeile, "CMD: " & var3);
      write(zeile, leerzeichen);
		write(zeile, "ExpectedFLow: " & expected1);
      write(zeile, leerzeichen);
		write(zeile, "ExpectedFHigh: " & expected2);
      write(zeile, leerzeichen);
		write(zeile, "ExpectedCout: " & expected3);
      write(zeile, leerzeichen);
		write(zeile, "ExpectedEqual: " & expected4);
      write(zeile, leerzeichen);
		write(zeile, "FLow: " & var4);
      write(zeile, leerzeichen);
		write(zeile, "FHigh: " & var5);
      write(zeile, leerzeichen);
		write(zeile, "Cout: " & var6);
      write(zeile, leerzeichen);
		write(zeile, "Equal: " & var7);
      write(zeile, leerzeichen);
      write(zeile, "Time: ");
		write(zeile, simulationszeit);
      writeline(protokoll, zeile);
    END IF;
  END IF;	 
END PROCESS MONITOR;

END behavior;