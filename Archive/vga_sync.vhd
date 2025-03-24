library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- VGA-sync module
entity vga_sync is
    port (
        clk, reset: in std_logic;
        hsync, video_on: out std_logic;
        pixel_x: out std_logic_vector (9 downto 0)
        -- pixel_x, pixel_y: out std_logic_vector (9 downto 0)
    );
end vga_sync;

architecture arch of vga_sync is

    -- Component declaration: 10-bit counter
    component counter_10bit
        port (
            clk, reset_bar: in std_logic;
            count: out std_logic_vector (9 downto 0)
        );
    end component;

    constant HD: integer := 640;  -- H. display area
    constant HF: integer := 16;   -- H. front porch
    constant HR: integer := 96;   -- H. retrace
    constant HB: integer := 48;   -- H. back porch

    -- constant VD: integer := 480;  -- V. display area
    -- constant VF: integer := 10;   -- V. front porch
    -- constant VB: integer := 33;   -- V. back porch
    -- constant VR: integer := 2;    -- V. retrace

    signal h_count: std_logic_vector (9 downto 0);
	 
	 signal pixel_x_internal: std_logic_vector (9 downto 0);

    signal pixel_tick: std_logic;
    signal h_end: std_logic;

begin
    counter_x: counter_10bit 
        port map (clk => pixel_tick, reset_bar => h_end, count => pixel_x_internal);

    -- Reset Process
    -- process (reset)
    -- begin
    --     if reset = '1' then
    --         h_end <= '1';
    --     end if;
    -- end process;

    -- Pixel tick
    pixel_tick <= clk;

    -- MOD-800 Horizontal Synchronisation
    process (pixel_tick, reset)
    begin
        if reset = '1' then
            h_end <= '0';
        -- elsif rising_edge(pixel_tick) then
        end if;
    end process;

    h_end <= '1' when (unsigned(pixel_x_internal) = (HD + HF + HB + HR - 1)) else '0';
    hsync <= '1' when (unsigned(pixel_x_internal) < (HD + HF - 1)) and (unsigned(pixel_x_internal) > (HD + HF + HR - 1)) else '0';

    -- Video signal ON/OFF
    video_on <= '1' when (unsigned(pixel_x_internal) < HD) else '0';
	 
	 pixel_x <= pixel_x_internal;

end arch;
