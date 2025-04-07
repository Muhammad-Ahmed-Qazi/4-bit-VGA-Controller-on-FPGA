LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY vga_sync_tb IS
END vga_sync_tb;

ARCHITECTURE testbench OF vga_sync_tb IS
    -- Declare signals to connect to the UUT
    SIGNAL clk, reset: STD_LOGIC := '0';
    SIGNAL hsync, vsync, video_on: STD_LOGIC;
    SIGNAL p_tick: STD_LOGIC;
    SIGNAL pixel_x: STD_LOGIC_VECTOR(10 DOWNTO 0);
	SIGNAL pixel_y: STD_LOGIC_VECTOR(9 DOWNTO 0);
    
    -- Clock period
    CONSTANT clk_period : TIME := 15.385 ns;  -- 25 MHz clock

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    UUT: ENTITY work.vga_sync
    PORT MAP (
        clk => clk,
        reset => reset,
        hsync => hsync,
        vsync => vsync,
        video_on => video_on,
        p_tick => p_tick,
        pixel_x => pixel_x,
        pixel_y => pixel_y
    );

    -- Clock process
    clk_process : PROCESS
    BEGIN
        WHILE NOW < 18 ms LOOP  -- Run simulation for 20 ms
            clk <= '0';
            WAIT FOR clk_period / 4;
            clk <= '1';
            WAIT FOR clk_period / 4;
        END LOOP;
        WAIT;
    END PROCESS;

    -- Stimulus process
    stimulus_process : PROCESS
    BEGIN
        -- Reset the system
        reset <= '1';
        WAIT FOR 100 ns;
        reset <= '0';
        
        -- Run for some time to observe the sync signals
        WAIT FOR 18 ms;
        
        -- Stop the simulation
        WAIT;
    END PROCESS;

END testbench;
