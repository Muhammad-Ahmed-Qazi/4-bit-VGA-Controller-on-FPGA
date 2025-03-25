-- VGA syncronisation module

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_sync is
    port (
        clk, reset: in std_logic;
        hsync, vsync, video_on, p_tick: out std_logic;
        pixel_x, pixel_y: out std_logic_vector (9 downto 0)
    );
end vga_sync;

architecture arch of vga_sync is

    -- 640x480 sync parameters
    constant HD: integer := 640;  -- H. display area
    constant HF: integer := 16;   -- H. front porch
    constant HR: integer := 96;   -- H. retrace
    constant HB: integer := 48;   -- H. back porch

    constant VD: integer := 480;  -- V. display area
    constant VF: integer := 10;   -- V. front porch
    constant VR: integer := 2;    -- V. retrace
    constant VB: integer := 33;   -- V. back porch

    -- Mod-2 counter
    signal mod2_reg, mod2_next: std_logic;
    -- Sync counters
    signal h_count_reg, h_count_next: std_logic_vector (9 downto 0);
    signal v_count_reg, v_count_next: std_logic_vector (9 downto 0);
    -- Output buffer
    signal h_sync_reg, v_sync_reg: std_logic;
    signal h_sync_next, v_sync_next: std_logic;

    -- Status signal
    signal h_end, v_end, pixel_tick: std_logic;

begin

    -- Registers
    process (clk, reset)
    begin
        if reset = '1' then
            mod2_reg <= '0';
            v_count_reg <= (others => '0');
            h_count_reg <= (others => '0');
            v_sync_reg <= '0';
            h_sync_reg <= '0';
        elsif rising_edge(clk) then
            mod2_reg <= mod2_next;
            v_count_reg <= v_count_next;
            h_count_reg <= h_count_next;
            v_sync_reg <= v_sync_next;
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
    v_end <= '1' when (unsigned(v_count_reg) = (VD+VF+VR+VB-1)) else '0';
	 
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

    -- Mod-525 Vertical Synchronisation
    process (v_count_reg, v_end, h_end, pixel_tick)
    begin
        if pixel_tick = '1' and h_end = '1' then
            if (v_end = '1') then
                v_count_next <= (others => '0');
            else
                v_count_next <= std_logic_vector(unsigned(v_count_reg) + 1);
            end if;
        else
            v_count_next <= v_count_reg;
        end if;
    end process;

    -- Horizontal sync, buffered to avoid glitch
    h_sync_next <= '0' when (unsigned(h_count_reg) >= HD+HF) and (unsigned(h_count_reg) < HD+HF+HR) else '1';
    -- Vertical sync, buffered to avoid glitch
    v_sync_next <= '0' when (unsigned(v_count_reg) >= VD+VF) and (unsigned(v_count_reg) < VD+VF+VR) else '1';
    
    -- Video ON/OFF
    video_on <= '1' when (unsigned(h_count_reg) < HD) and (unsigned(v_count_reg) < VD) else '0';

    -- Output
    hsync <= h_sync_reg;
    vsync <= v_sync_reg;
    pixel_x <= std_logic_vector(h_count_reg);
    pixel_y <= std_logic_vector(v_count_reg);
    p_tick <= pixel_tick;

end arch ; -- arch