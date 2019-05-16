--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : test3.vhw
-- /___/   /\     Timestamp : Sat Feb 16 02:04:57 2019
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: test3
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY test3 IS
END test3;

ARCHITECTURE testbench_arch OF test3 IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT subtractor
        PORT (
            a : In std_logic_vector (7 DownTo 0);
            b : In std_logic_vector (7 DownTo 0);
            bin : In std_logic;
            diff : Out std_logic_vector (7 DownTo 0);
            bout : Out std_logic
        );
    END COMPONENT;

    SIGNAL a : std_logic_vector (7 DownTo 0) := "00000000";
    SIGNAL b : std_logic_vector (7 DownTo 0) := "00000000";
    SIGNAL bin : std_logic := '0';
    SIGNAL diff : std_logic_vector (7 DownTo 0) := "00000000";
    SIGNAL bout : std_logic := '0';

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : subtractor
        PORT MAP (
            a => a,
            b => b,
            bin => bin,
            diff => diff,
            bout => bout
        );

        PROCESS    -- clock process for bin
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                bin <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                bin <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  100ns
                WAIT FOR 100 ns;
                b <= "11111111";
                -- -------------------------------------
                -- -------------  Current Time:  185ns
                WAIT FOR 85 ns;
                a <= "11111111";
                b <= "00000000";
                -- -------------------------------------
                WAIT FOR 1015 ns;

            END PROCESS;

    END testbench_arch;

