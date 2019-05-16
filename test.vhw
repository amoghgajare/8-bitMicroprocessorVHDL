--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : test.vhw
-- /___/   /\     Timestamp : Sat Feb 16 02:52:31 2019
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: test
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY test IS
END test;

ARCHITECTURE testbench_arch OF test IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT equalitychecker
        PORT (
            a : In std_logic_vector (7 DownTo 0);
            b : In std_logic_vector (7 DownTo 0);
            y : Out std_logic
        );
    END COMPONENT;

    SIGNAL a : std_logic_vector (7 DownTo 0) := "00000000";
    SIGNAL b : std_logic_vector (7 DownTo 0) := "00000000";
    SIGNAL y : std_logic := '0';

    BEGIN
        UUT : equalitychecker
        PORT MAP (
            a => a,
            b => b,
            y => y
        );

        PROCESS
            BEGIN
                -- -------------  Current Time:  100ns
                WAIT FOR 100 ns;
                a <= "10000000";
                -- -------------------------------------
                -- -------------  Current Time:  200ns
                WAIT FOR 100 ns;
                a <= "00000000";
                -- -------------------------------------
                -- -------------  Current Time:  500ns
                WAIT FOR 300 ns;
                a <= "01000000";
                -- -------------------------------------
                -- -------------  Current Time:  600ns
                WAIT FOR 100 ns;
                a <= "00000000";
                -- -------------------------------------
                WAIT FOR 400 ns;

            END PROCESS;

    END testbench_arch;

