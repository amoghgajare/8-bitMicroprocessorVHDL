--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : maintb2.vhw
-- /___/   /\     Timestamp : Thu Apr 25 22:09:16 2019
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: maintb2
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY maintb2 IS
END maintb2;

ARCHITECTURE testbench_arch OF maintb2 IS
    COMPONENT MicroprocessorControlUnitModule
        PORT (
            A : In std_logic_vector (7 DownTo 0);
            B : In std_logic_vector (7 DownTo 0);
            S : In std_logic_vector (3 DownTo 0);
            MEMORYBUFFER : In std_logic_vector (31 DownTo 0);
            STATUSFLAGS : Out std_logic_vector (2 DownTo 0);
            Y : Out std_logic_vector (7 DownTo 0);
            CorBin : In std_logic;
            CLK : In std_logic;
            CorBout : Out std_logic
        );
    END COMPONENT;

    SIGNAL A : std_logic_vector (7 DownTo 0) := "00000000";
    SIGNAL B : std_logic_vector (7 DownTo 0) := "00000000";
    SIGNAL S : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL MEMORYBUFFER : std_logic_vector (31 DownTo 0) := "00000000000000000000000000000000";
    SIGNAL STATUSFLAGS : std_logic_vector (2 DownTo 0) := "000";
    SIGNAL Y : std_logic_vector (7 DownTo 0) := "00000000";
    SIGNAL CorBin : std_logic := '0';
    SIGNAL CLK : std_logic := '0';
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
            MEMORYBUFFER => MEMORYBUFFER,
            STATUSFLAGS => STATUSFLAGS,
            Y => Y,
            CorBin => CorBin,
            CLK => CLK,
            CorBout => CorBout
        );

        PROCESS    -- clock process for CLK
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                CLK <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                CLK <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  185ns
                WAIT FOR 185 ns;
                A <= "10111101";
                -- -------------------------------------
                -- -------------  Current Time:  385ns
                WAIT FOR 200 ns;
                S <= "0010";
                -- -------------------------------------
                -- -------------  Current Time:  585ns
                WAIT FOR 200 ns;
                S <= "0100";
                -- -------------------------------------
                -- -------------  Current Time:  785ns
                WAIT FOR 200 ns;
                S <= "0110";
                -- -------------------------------------
                -- -------------  Current Time:  985ns
                WAIT FOR 200 ns;
                S <= "1000";
                -- -------------------------------------
                -- -------------  Current Time:  1185ns
                WAIT FOR 200 ns;
                S <= "1010";
                -- -------------------------------------
                -- -------------  Current Time:  1385ns
                WAIT FOR 200 ns;
                S <= "1100";
                -- -------------------------------------
                -- -------------  Current Time:  1585ns
                WAIT FOR 200 ns;
                S <= "1110";
                -- -------------------------------------
                -- -------------  Current Time:  1785ns
                WAIT FOR 200 ns;
                S <= "0000";
                -- -------------------------------------
                WAIT FOR 6415 ns;

            END PROCESS;

    END testbench_arch;

