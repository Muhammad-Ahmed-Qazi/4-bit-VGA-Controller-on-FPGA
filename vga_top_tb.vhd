LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY vga_top_tb IS
END vga_top_tb;

ARCHITECTURE testbench OF vga_top_tb IS
    -- Constants
    CONSTANT CLK_PERIOD   : TIME := 15.385 ns;  -- 65MHz (XGA)
    CONSTANT FRAME_WIDTH  : NATURAL := 1024;
    CONSTANT FRAME_HEIGHT : NATURAL := 768;
    
    -- DUT Signals
    SIGNAL clk, reset : STD_LOGIC := '0';
    SIGNAL we         : STD_LOGIC := '0';
    SIGNAL wr_addr    : STD_LOGIC_VECTOR(19 DOWNTO 0) := (OTHERS => '0');
    SIGNAL wr_data    : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL hsync, vsync, video_on : STD_LOGIC;
    SIGNAL rgb        : STD_LOGIC_VECTOR(7 DOWNTO 0);
    
    -- Timing Control
    SIGNAL stop_sim   : BOOLEAN := FALSE;
    
BEGIN
    -- Instantiate UUT
    UUT: ENTITY work.vga_top
    PORT MAP (
        clk      => clk,
        reset    => reset,
        we       => we,
        wr_addr  => wr_addr,
        wr_data  => wr_data,
        hsync    => hsync,
        vsync    => vsync,
        video_on => video_on,  -- Make sure this is connected!
        rgb      => rgb
    );

    -- Clock Generation with guaranteed stop
    clk_process : PROCESS
    BEGIN
        WHILE NOT stop_sim LOOP
            clk <= '0';
            WAIT FOR CLK_PERIOD/2;
            clk <= '1';
            WAIT FOR CLK_PERIOD/2;
        END LOOP;
        WAIT;
    END PROCESS;

    -- Absolute 35ms stop trigger
    stop_sim <= TRUE AFTER 35 ms;

    -- Frame Buffer Write + Display Test
    test_sequence : PROCESS
        VARIABLE x, y : NATURAL;
    BEGIN
        -- Reset
        reset <= '1';
        WAIT FOR 100 ns;
        reset <= '0';
        WAIT FOR CLK_PERIOD * 10;
        
        -- Write Test Pattern (Checkerboard)
        we <= '1';
        FOR y IN 0 TO FRAME_HEIGHT-1 LOOP
            FOR x IN 0 TO FRAME_WIDTH-1 LOOP
                wr_addr <= STD_LOGIC_VECTOR(TO_UNSIGNED(y * FRAME_WIDTH + x, 20));
                IF ((x/16) + (y/16)) MOD 2 = 0 THEN
                    wr_data <= x"FF";  -- White
                ELSE
                    wr_data <= x"00";  -- Black
                END IF;
                WAIT FOR CLK_PERIOD;
            END LOOP;
        END LOOP;
        we <= '0';
        
        -- Monitor video_on behavior
        WAIT UNTIL rising_edge(vsync);
        REPORT "First vsync detected - checking video_on";
        
        WAIT UNTIL rising_edge(vsync);
        REPORT "Second vsync detected";
        
        WAIT;
    END PROCESS;

    -- video_on Verification Process
    video_check : PROCESS(clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF video_on = '1' THEN
                ASSERT hsync = '1' 
                    REPORT "video_on active during hsync pulse!" SEVERITY WARNING;
                ASSERT vsync = '1' 
                    REPORT "video_on active during vsync pulse!" SEVERITY WARNING;
            END IF;
        END IF;
    END PROCESS;

    -- Simulation Termination Guard
    assert NOT stop_sim
        REPORT "SIMULATION COMPLETED AT 45ms" SEVERITY NOTE;
END testbench;