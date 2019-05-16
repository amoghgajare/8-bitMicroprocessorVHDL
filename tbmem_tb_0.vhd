--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : tbmem.vhw
-- /___/   /\     Timestamp : Thu Apr 25 22:02:05 2019
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: tbmem_tb_0
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY tbmem_tb_0 IS
END tbmem_tb_0;

ARCHITECTURE testbench_arch OF tbmem_tb_0 IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT memory45
        PORT (
            d : In std_logic_vector (31 DownTo 0);
            out1 : Out std_logic_vector (31 DownTo 0);
            clk : In std_logic;
            clr : In std_logic;
            pr : In std_logic
        );
    END COMPONENT;

    SIGNAL d : std_logic_vector (31 DownTo 0) := "00000000000000000000000000000000";
    SIGNAL out1 : std_logic_vector (31 DownTo 0) := "00000000000000000000000000000000";
    SIGNAL clk : std_logic := '0';
    SIGNAL clr : std_logic := '0';
    SIGNAL pr : std_logic := '0';

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : memory45
        PORT MAP (
            d => d,
            out1 => out1,
            clk => clk,
            clr => clr,
            pr => pr
        );

        PROCESS    -- clock process for clk
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                clk <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                clk <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  585ns
                WAIT FOR 585 ns;
                d <= "11010100101001001000000000000000";
                -- -------------------------------------
                WAIT FOR 615 ns;

            END PROCESS;

    END testbench_arch;

