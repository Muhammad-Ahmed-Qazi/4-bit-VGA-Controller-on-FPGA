-- VGA synchronization module (Updated: pixel_tick removed, using clk directly)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_sync is
    port (
        clk, reset: in std_logic;
        hsync, vsync, video_on: out std_logic; 
        -- p_tick : out std_logic; -- Removed as clk is used directly
        pixel_x: out std_logic_vector (10 downto 0);
        pixel_y: out std_logic_vector (9 downto 0)
    );
end vga_sync;

architecture arch of vga_sync is

    -- 1024x768 sync parameters (1344x806 total)
    constant HD: integer := 1024;  -- Horizontal display area
    constant HF: integer := 24;    -- Horizontal front porch
    constant HR: integer := 136;   -- Horizontal retrace
    constant HB: integer := 160;   -- Horizontal back porch

    constant VD: integer := 768;   -- Vertical display area
    constant VF: integer := 3;     -- Vertical front porch
    constant VR: integer := 6;     -- Vertical retrace
    constant VB: integer := 29;    -- Vertical back porch

    -- Sync counters
    signal h_count_reg, h_count_next: std_logic_vector (10 downto 0);
    signal v_count_reg, v_count_next: std_logic_vector (9 downto 0);

    -- Output buffer
    signal h_sync_reg, v_sync_reg: std_logic;
    signal h_sync_next, v_sync_next: std_logic;

    -- Status signal
    signal h_end, v_end: std_logic;

begin

    -- Registers
    process (clk, reset)
    begin
        if reset = '1' then
            v_count_reg <= (others => '0');
            h_count_reg <= (others => '0');
            v_sync_reg <= '0';
            h_sync_reg <= '0';
        elsif rising_edge(clk) then
            v_count_reg <= v_count_next;
            h_count_reg <= h_count_next;
            v_sync_reg <= v_sync_next;
            h_sync_reg <= h_sync_next;
        end if;
    end process;

    -- End-of-line and frame detection
    h_end <= '1' when (unsigned(h_count_reg) = (HD + HF + HR + HB - 1)) else '0';
    v_end <= '1' when (unsigned(v_count_reg) = (VD + VF + VR + VB - 1)) else '0';

    -- Horizontal counter logic
    process (h_count_reg, h_end)
    begin
        if h_end = '1' then
            h_count_next <= (others => '0');
        else
            h_count_next <= std_logic_vector(unsigned(h_count_reg) + 1);
        end if;
    end process;

    -- Vertical counter logic
    process (v_count_reg, v_end, h_end)
    begin
        if h_end = '1' then
            if v_end = '1' then
                v_count_next <= (others => '0');
            else
                v_count_next <= std_logic_vector(unsigned(v_count_reg) + 1);
            end if;
        else
            v_count_next <= v_count_reg;
        end if;
    end process;

    -- Horizontal sync logic (active low during retrace)
    h_sync_next <= '0' when (unsigned(h_count_reg) >= HD + HF) and
                            (unsigned(h_count_reg) < HD + HF + HR) else '1';

    -- Vertical sync logic (active low during retrace)
    v_sync_next <= '0' when (unsigned(v_count_reg) >= VD + VF) and
                            (unsigned(v_count_reg) < VD + VF + VR) else '1';

    -- Video ON when within display area
    video_on <= '1' when (unsigned(h_count_reg) < HD) and
                         (unsigned(v_count_reg) < VD) else '0';

    -- Output assignments
    hsync    <= h_sync_reg;
    vsync    <= v_sync_reg;
    pixel_x  <= h_count_reg;
    pixel_y  <= v_count_reg;

    -- Removed pixel_tick:
    -- signal pixel_tick was removed as clk is already running at 65 MHz

end arch;
