library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
---------------------
--ENTITY DECLARATION
---------------------
entity MicroprocessorControlUnitModule is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC_VECTOR (3 downto 0);
			  MEMORYBUFFER : in  STD_LOGIC_VECTOR (31 downto 0);
			  STATUSFLAGS : out  STD_LOGIC_VECTOR (2 downto 0):="000";
           Y : out  STD_LOGIC_VECTOR (7 downto 0);
			  CorBin:in STD_LOGIC:='0';
			  CLK:in STD_LOGIC;
			  CorBout:out STD_LOGIC:='0');
end MicroprocessorControlUnitModule;
---------------------------
--ARCHITECTURE DECLARATION
---------------------------
architecture Behavioral of MicroprocessorControlUnitModule is
------------------------
--COMPONENT DECLARATION
------------------------
component memory45 is
Port ( d : in  STD_LOGIC_VECTOR (31 downto 0);
           out1 : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
			  --buffclr : in  STD_LOGIC;
			  clr : in  STD_LOGIC;
			  pr : in  STD_LOGIC);
end component;
component ANDOperation is
Port(  a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           y : out  STD_LOGIC_VECTOR (7 downto 0));
end component;
component ORoperation is
Port(  a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           y : out  STD_LOGIC_VECTOR (7 downto 0));
end component;
component NOTOperation is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           y : out  STD_LOGIC_VECTOR (7 downto 0));
end component;
component adder is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           cin : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (7 downto 0);
           cout : out  STD_LOGIC);
end component;
component subtractor is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           bin : in  STD_LOGIC;
           diff : out  STD_LOGIC_VECTOR (7 downto 0);
           bout : out  STD_LOGIC);
end component;
signal t_and,t_or,t_notA,t_notB,t_adder,t_sub:std_logic_vector(7 downto 0):= (others => '0');
signal t_memOut:std_logic_vector(31 downto 0):= (others => '0');
signal t_cout,t_bout,t_memClr,t_memPr:std_logic;
begin
------------
--PORT MAPS
------------
G1:ANDOperation port map(A,B,t_and);
G2:ORoperation port map(A,B,t_or);
G3:NOTOperation port map(A,t_notA);
G4:NOTOperation port map(B,t_notB);
G5:adder port map(A,B,CorBin,t_adder,t_cout);
G6:subtractor port map(A,B,CorBin,t_sub,t_bout);
G7:memory45 port map(MEMORYBUFFER,t_memOut,CLK,t_memClr,t_memPr);
----------------
--OUTPUT STATES
----------------
process(S,t_and,t_or,t_notA,t_notB,t_adder,t_sub,t_cout,t_bout)
begin
if S="0000" then Y<=t_and;                       --AND
elsif S="0001" then Y<=t_or;                     --OR
elsif S="0010" then Y<=t_notA;                   --NOT A
elsif S="0011" then Y<=t_notB;                   --NOT B
elsif S="0100" then 
Y<=t_adder;
CorBout<=t_cout;                                --ADDITION
elsif S="0101" then 
Y<=t_sub;
CorBout<=t_bout;                                --SUBTRACTION
elsif S="0110" then Y<=A;                        --DATA A
elsif S="0111" then Y<=B;                        --DATA B
--elsif S="1000" then Y<=B;                        --DATA B --RESERVED FOR FURTHER INSTRUCTION SET EXPANSION
--elsif S="1001" then Y<=B;                        --DATA B
--elsif S="1010" then Y<=B;                        --DATA B
--elsif S="1011" then Y<=B;                        --DATA B
--elsif S="1100" then Y<=B;                        --DATA B
--elsif S="1101" then Y<=B;                        --DATA B
--elsif S="1110" then Y<=B;                        --DATA B
--elsif S="1111" then Y<=B;                        --DATA B
else 
Y<="00000000";
CorBout<='0';
end if;
end process;
---------------------
--STATUS FLAG STATES
---------------------
process(t_cout,t_bout,s)
begin
if (t_cout='1')or(t_bout='1') then STATUSFLAGS<="001"; --CARRY/BORROW FLAG
else STATUSFLAGS<="000";
end if;
if S(2)='0' then STATUSFLAGS<="010"; --LOGICAL OPERATION
elsif S(2)='1' then STATUSFLAGS<="100"; --ARITHMETIC OPERATION 
else STATUSFLAGS<="000";
end if;
end process;
end Behavioral;

