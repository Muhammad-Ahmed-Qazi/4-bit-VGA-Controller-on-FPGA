LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY vga_top_tb IS
END vga_top_tb;

ARCHITECTURE tb OF vga_top_tb IS
    -- Signals
    SIGNAL clk        : STD_LOGIC := '0';
    SIGNAL reset      : STD_LOGIC := '1';
    SIGNAL hsync      : STD_LOGIC;
    SIGNAL vsync      : STD_LOGIC;
    SIGNAL video_on   : STD_LOGIC;
    SIGNAL rgb        : STD_LOGIC_VECTOR(23 DOWNTO 0);
    SIGNAL we         : STD_LOGIC := '0';
    SIGNAL fb_addr    : UNSIGNED(19 DOWNTO 0);
    SIGNAL fb_data_in : STD_LOGIC_VECTOR(23 DOWNTO 0);
    
    -- Clock Periods
    CONSTANT clk_period      : TIME := 15.385 ns; -- 65 MHz pixel clock
    CONSTANT sim_duration    : TIME := 20 ms;
BEGIN
    -- Instantiate UUT (Top Module)
    UUT: ENTITY work.vga_top
    PORT MAP (
        clk       => clk,
        reset     => reset,
        hsync     => hsync,
        vsync     => vsync,
        video_on  => video_on,
        rgb       => rgb,
        we        => we,
        fb_addr   => fb_addr,
        fb_data_in => fb_data_in
    );
    
    -- Clock Process
    clk_process : PROCESS
    BEGIN
        WHILE NOW < sim_duration LOOP
            clk <= '0';
            WAIT FOR clk_period / 2;
            clk <= '1';
            WAIT FOR clk_period / 2;
        END LOOP;
        WAIT;
    END PROCESS;
    
    -- Stimulus Process
    stimulus_process : PROCESS
    BEGIN
        -- Reset
        WAIT FOR 100 ns;
        reset <= '0';
        
        -- Write a test pattern to the frame buffer
        FOR x IN 0 TO 1023 LOOP
            FOR y IN 0 TO 767 LOOP
                we        <= '1';
                fb_addr   <= TO_UNSIGNED((y * 1024) + x, 20);
                fb_data_in <= STD_LOGIC_VECTOR( TO_UNSIGNED((x MOD 256) & (y MOD 256) & ((x * y) MOD 256), 24) );
                WAIT FOR clk_period;
            END LOOP;
        END LOOP;
        we <= '0'; -- Stop writing
        
        -- Run for display verification
        WAIT FOR sim_duration;
        WAIT;
    END PROCESS;

END tb;
