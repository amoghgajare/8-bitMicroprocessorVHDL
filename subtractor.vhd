----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:47:58 02/16/2019 
-- Design Name: 
-- Module Name:    subtractor - Behavioral 
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

entity subtractor is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           bin : in  STD_LOGIC;
           diff : out  STD_LOGIC_VECTOR (7 downto 0);
           bout : out  STD_LOGIC);
end subtractor;

architecture Behavioral of subtractor is
component singlefullsubtractor is
Port( a : in STD_LOGIC;
b : in STD_LOGIC;
bin : in STD_LOGIC;
diff : out STD_LOGIC;
bout : out STD_LOGIC);
end component;

signal br0,br1,br2,br3,br4,br5,br6: std_logic;
begin
fs1: singlefullsubtractor port map(a(0),b(0),bin,diff(0),br0);
fs2: singlefullsubtractor port map(a(1),b(1),br0,diff(1),br1);
fs3: singlefullsubtractor port map(a(2),b(2),br1,diff(2),br2);
fs4: singlefullsubtractor port map(a(3),b(3),br2,diff(3),br3);
fs5: singlefullsubtractor port map(a(4),b(4),br3,diff(4),br4);
fs6: singlefullsubtractor port map(a(5),b(5),br4,diff(5),br5);
fs7: singlefullsubtractor port map(a(6),b(6),br5,diff(6),br6);
fs8: singlefullsubtractor port map(a(7),b(7),br6,diff(7),bout);
end Behavioral;

