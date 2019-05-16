----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:35:19 02/16/2019 
-- Design Name: 
-- Module Name:    adder - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           cin : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (7 downto 0);
           cout : out  STD_LOGIC);
end adder;

architecture Behavioral of adder is
component singlefulladder
port( a : in STD_LOGIC;
b : in STD_LOGIC;
cin : in STD_LOGIC;
s : out STD_LOGIC;
cout : out STD_LOGIC);
end component;

signal c1,c2,c3,c4,c5,c6,c7:std_logic;
begin
fa1:singlefulladder port map(a(0),b(0),cin,s(0),c1);
fa2:singlefulladder port map(a(1),b(1),c1,s(1),c2);
fa3:singlefulladder port map(a(2),b(2),c2,s(2),c3);
fa4:singlefulladder port map(a(3),b(3),c3,s(3),c4);
fa5:singlefulladder port map(a(4),b(4),c4,s(4),c5);
fa6:singlefulladder port map(a(5),b(5),c5,s(5),c6);
fa7:singlefulladder port map(a(6),b(6),c6,s(6),c7);
fa8:singlefulladder port map(a(7),b(7),c7,s(7),cout);
end Behavioral;

