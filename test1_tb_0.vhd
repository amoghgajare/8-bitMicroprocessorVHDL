--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : test1.vhw
-- /___/   /\     Timestamp : Sat Feb 16 01:32:16 2019
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: test1_tb_0
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY test1_tb_0 IS
END test1_tb_0;

ARCHITECTURE testbench_arch OF test1_tb_0 IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT adder
        PORT (
            a : In std_logic_vector (7 DownTo 0);
            b : In std_logic_vector (7 DownTo 0);
            cin : In std_logic;
            s : Out std_logic_vector (7 DownTo 0);
            cout : Out std_logic
        );
    END COMPONENT;

    SIGNAL a : std_logic_vector (7 DownTo 0) := "00000000";
    SIGNAL b : std_logic_vector (7 DownTo 0) := "00000000";
    SIGNAL cin : std_logic := '0';
    SIGNAL s : std_logic_vector (7 DownTo 0) := "00000000";
    SIGNAL cout : std_logic := '0';

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : adder
        PORT MAP (
            a => a,
            b => b,
            cin => cin,
            s => s,
            cout => cout
        );

        PROCESS    -- clock process for cin
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                cin <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                cin <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  100ns
                WAIT FOR 100 ns;
                a <= "11111111";
                -- -------------------------------------
                -- -------------  Current Time:  185ns
                WAIT FOR 85 ns;
                a <= "00000000";
                b <= "11111111";
                -- -------------------------------------
                -- -------------  Current Time:  385ns
                WAIT FOR 200 ns;
                a <= "10101110";
                b <= "00000000";
                -- -------------------------------------
                -- -------------  Current Time:  585ns
                WAIT FOR 200 ns;
                a <= "00000000";
                -- -------------------------------------
                WAIT FOR 615 ns;

            END PROCESS;

    END testbench_arch;

