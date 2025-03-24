-- VGA syncronisation module

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_sync is
    port (
        clk, reset: in std_logic;
        hsync, video_on, p_tick: out std_logic;
        pixel_x: out std_logic_vector (9 downto 0)
    );
end vga_sync;

architecture arch of vga_sync is

    -- 640x480 sync parameters
    constant HD: integer := 640;  -- H. display area
    constant HF: integer := 16;   -- H. front porch
    constant HR: integer := 96;   -- H. retrace
    constant HB: integer := 48;   -- H. back porch

    -- Mod-2 counter
    signal mod2_reg, mod2_next: std_logic;
    -- Sync counters
    signal h_count_reg, h_count_next: std_logic_vector (9 downto 0);
    -- Output buffer
    signal h_sync_reg: std_logic;
    signal h_sync_next: std_logic;

    -- Status signal
    signal h_end, pixel_tick: std_logic;

begin

    -- Registers
    process (clk, reset)
    begin
        if reset = '1' then
            mod2_reg <= '0';
            h_count_reg <= (others => '0');
            h_sync_reg <= '0';
        elsif rising_edge(clk) then
            mod2_reg <= mod2_next;
            h_count_reg <= h_count_next;
            h_sync_reg <= h_sync_next;
        end if;
    end process;

    -- Mod-2 circuit to generate 25 MHz enable tick
    mod2_next <= not mod2_reg;
    -- 25 MHz pixel tick
    pixel_tick <= '1' when (mod2_reg = '1') else '0';

    -- Status
    --h_end <= '1' when (h_count_reg = (HD+HF+HR+HB-1)) else '0';
	 h_end <= '1' when (unsigned(h_count_reg) = (HD+HF+HR+HB-1)) else '0';

	 
    -- Mod-800 Horizontal Synchronisation
    process (h_count_reg, h_end, pixel_tick)
    begin
        if pixel_tick = '1' then
            if h_end = '1' then
                h_count_next <= (others => '0');
            else
                h_count_next <= std_logic_vector(unsigned(h_count_reg) + 1);
            end if;
        else
            h_count_next <= h_count_reg;
        end if;
    end process;

    -- Horizontal sync, buffered to avoid glitch
    h_sync_next <= '1' when (unsigned(h_count_reg) >= HD+HF) and (unsigned(h_count_reg) < HD+HF+HR) else '0';
    
    -- Video ON/OFF
    video_on <= '1' when (unsigned(h_count_reg) < HD) else '0';

    -- Output
    hsync <= h_sync_reg;
    pixel_x <= std_logic_vector(h_count_reg);
    p_tick <= pixel_tick;

end arch ; -- arch