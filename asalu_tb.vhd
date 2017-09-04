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
   constant clk_period : time := 50 ns;

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

shared variable expectedFlow : STRING(8 DOWNTO 1);
shared variable expectedFhigh : STRING(8 DOWNTO 1);
shared variable expectedCoutF : CHARACTER;
shared variable expectedOverflowF : CHARACTER;
shared variable expectedEqualF : CHARACTER;
shared variable expectedZeroF : CHARACTER;



-- Testbench
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

STIMULI: PROCESS(clk)
  FILE testpattern: TEXT OPEN READ_MODE IS "stimuli.txt";
  VARIABLE zeile: LINE;
  VARIABLE leerzeichen: CHARACTER;
  VARIABLE varA: STRING(8 DOWNTO 1);
  VARIABLE varB: STRING(8 DOWNTO 1);
  VARIABLE varCmd: STRING(4 DOWNTO 1);
BEGIN
 IF(NOW > 100 ns) THEN
  IF(rising_edge(clk)) THEN
    IF(NOT endfile(testpattern)) THEN
      readline(testpattern, zeile);
      read(zeile, varA);
      a <= string2std_logic(varA);
		-- berspringen des Leerzeichens
      read(zeile, leerzeichen);
      read(zeile, varB);
      b <= string2std_logic(varB);
		-- berspringen des Leerzeichens
      read(zeile, leerzeichen);
      read(zeile, varCmd);
      cmd <= string2std_logic(varCmd);
    END IF;
  END IF;
  End if;
END PROCESS STIMULI;

RESPONSE: PROCESS(clk)
  FILE vergleichspattern: TEXT OPEN READ_MODE IS "expected.txt";
  VARIABLE zeile: LINE;
  VARIABLE leerzeichen: CHARACTER;
  VARIABLE varFlow: STRING(8 DOWNTO 1);
  VARIABLE varFhigh: STRING(8 DOWNTO 1);
  VARIABLE varCout: CHARACTER;
  VARIABLE varOverflow: CHARACTER;
  VARIABLE varEqual: CHARACTER;
  VARIABLE varZero: CHARACTER;

BEGIN
  

  IF(rising_edge(clk)) THEN
   IF(NOW > 180 ns) THEN
      IF(NOT endfile(vergleichspattern)) THEN		
        readline(vergleichspattern, zeile);
		   
		  --Fhigh
			read(zeile, varFhigh);	
		    expectedFhigh := varFhigh;
        ASSERT string2std_logic(expectedFhigh) = fhigh
          REPORT "Vergleich fehlerhaft!" & "  Erwartungswert: " & varFhigh & "  Ergebnis: " & std_logic2string(fhigh)
          SEVERITY WARNING;			
			
		  --Flow
		  read(zeile, leerzeichen);
        read(zeile, varFlow);
		  expectedFlow := varFlow;
        ASSERT string2std_logic(expectedFlow) = flow
          REPORT "Vergleich fehlerhaft!" & "  Erwartungswert: " & varFlow & "  Ergebnis: " & std_logic2string(flow)
          SEVERITY WARNING;
			

		    --Cout
		  read(zeile, leerzeichen);		
		  read(zeile, varCout);
		  expectedCoutf := varCout;
		  
        ASSERT char2std_logic(expectedCoutf) = coutF
          REPORT "Vergleich fehlerhaft!" & "  Erwartungswert: " & varCout & "  Ergebnis: " & std_logic2char(coutF)
          SEVERITY WARNING;
			
		--Overflow
		  read(zeile, leerzeichen);		
		  read(zeile, varOverflow);
		  expectedOverflowF := varOverflow;
		  
        ASSERT char2std_logic(expectedOverflowF) = overflowF
          REPORT "Vergleich fehlerhaft!" & "  Erwartungswert: " & varOverflow & "  Ergebnis: " & std_logic2char(overflowF)
          SEVERITY WARNING;
			
			
			
		  --Equal
		  read(zeile, leerzeichen);		
		  read(zeile, varEqual);
		  expectedEqualF := varEqual;
		  
        ASSERT char2std_logic(expectedEqualF) = equalF
          REPORT "Vergleich fehlerhaft!" & "  Erwartungswert: " & varEqual & "  Ergebnis: " & std_logic2char(equalF)
          SEVERITY WARNING;
			
			
			--Zero
			read(zeile, leerzeichen);
			read(zeile, varZero);
		  expectedZeroF := varZero;
        ASSERT char2std_logic(expectedZeroF) = zeroF
          REPORT "Vergleich fehlerhaft!" & "  Erwartungswert: " & varZero & "  Ergebnis: " & std_logic2char(zeroF)
          SEVERITY WARNING;
			 
		ELSE expectedFlow := (others => 'X');
			  expectedFHigh := (others => 'X');
			  expectedCoutF := 'X';
			  expectedOverflowF := 'X';
			  expectedEqualF := 'X';
			  expectedZeroF := 'X';

      END IF;
END IF;
  END IF;
END PROCESS RESPONSE;

MONITOR: PROCESS(clk)
  FILE protokoll: TEXT OPEN WRITE_MODE IS "monitor.txt";
  VARIABLE zeile: LINE;
  VARIABLE leerzeichen: CHARACTER := ' ';
  VARIABLE varA: STRING(8 DOWNTO 1);
  VARIABLE varB: STRING(8 DOWNTO 1);
  VARIABLE varCmd: STRING(4 DOWNTO 1);
  VARIABLE varFlow: STRING(8 DOWNTO 1);
  VARIABLE varFHigh: STRING(8 DOWNTO 1);
  VARIABLE varCoutF: CHARACTER;
  VARIABLE varOverflowF: CHARACTER;
  VARIABLE varEqualF: CHARACTER;
  VARIABLE varZeroF: CHARACTER;

  VARIABLE simulationszeit: TIME;
BEGIN
  IF(NOW > 100 ns) THEN
  IF(rising_edge(clk)) THEN
      varA := std_logic2string(a);
		varB := std_logic2string(b);
		varCmd := std_logic2string(cmd);
		varFlow := std_logic2string(flow);
		varFHigh := std_logic2string(fhigh);
		varCoutF := std_logic2char(coutF);
		varOverflowF := std_logic2char(overflowF);
	   varEqualF := std_logic2char(equalF);
		varZeroF := std_logic2char(zeroF);

      simulationszeit := NOW;
		--Inputs
      write(zeile, "A: " & varA);
      write(zeile, leerzeichen);
		write(zeile, "B: " & varB);
      write(zeile, leerzeichen);
		write(zeile, "CMD: " & varCmd);
		
      write(zeile, leerzeichen);
		write(zeile, "|");
      write(zeile, leerzeichen);

		--Outputs
		write(zeile, "FHigh: e" & expectedFHigh & " a" & varFHigh & ", ");
		write(zeile, "FLow: e" & expectedFlow & " a" & varFlow & ", ");
		write(zeile, "Cout: e" & expectedCoutF & " a" & varCoutF & ", ");
		write(zeile, "OF: e" & expectedOverflowF & " a" & varOverflowF & ", ");
		write(zeile, "Equal: e" & expectedEqualF & " a" & varEqualF & ", ");
		write(zeile, "Zero: e" & expectedZeroF & " a" & varZeroF & " | ");

		--Time
		write(zeile, "t: ");
		write(zeile, simulationszeit);
		
      writeline(protokoll, zeile);
    END IF;
  END IF;	 
END PROCESS MONITOR;

END behavior;