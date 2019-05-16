--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : maintb.vhw
-- /___/   /\     Timestamp : Sun Feb 17 11:39:15 2019
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: maintb
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY maintb IS
END maintb;

ARCHITECTURE testbench_arch OF maintb IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT MicroprocessorControlUnitModule
        PORT (
            A : In std_logic_vector (7 DownTo 0);
            B : In std_logic_vector (7 DownTo 0);
            S : In std_logic_vector (2 DownTo 0);
            STATUSFLAGS : Out std_logic_vector (2 DownTo 0);
            Y : Out std_logic_vector (7 DownTo 0);
            CorBin : In std_logic;
            CorBout : Out std_logic
        );
    END COMPONENT;

    SIGNAL A : std_logic_vector (7 DownTo 0) := "00000000";
    SIGNAL B : std_logic_vector (7 DownTo 0) := "00000000";
    SIGNAL S : std_logic_vector (2 DownTo 0) := "000";
    SIGNAL STATUSFLAGS : std_logic_vector (2 DownTo 0) := "000";
    SIGNAL Y : std_logic_vector (7 DownTo 0) := "00000000";
    SIGNAL CorBin : std_logic := '0';
    SIGNAL CorBout : std_logic := '0';

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : MicroprocessorControlUnitModule
        PORT MAP (
            A => A,
            B => B,
            S => S,
            STATUSFLAGS => STATUSFLAGS,
            Y => Y,
            CorBin => CorBin,
            CorBout => CorBout
        );

        PROCESS    -- clock process for CorBin
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                CorBin <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                CorBin <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                WAIT FOR 1200 ns;

            END PROCESS;

    END testbench_arch;

