library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_top is
    port (
        clk, reset : in std_logic;
        we : in std_logic;
        wr_addr : in std_logic_vector(19 downto 0);
        wr_data : in std_logic_vector(7 downto 0);
        hsync, vsync, video_on : out std_logic;
        rgb : out std_logic_vector(7 downto 0)
    );
end vga_top;

architecture rtl of vga_top is

    -- VGA sync signals
    signal pixel_x       : std_logic_vector(10 downto 0);
    signal pixel_y       : std_logic_vector(9 downto 0);

    -- Frame buffer read signals
    signal read_addr     : unsigned(19 downto 0);  -- 1024*768 = 786432 locations
    signal pixel_data    : std_logic_vector(7 downto 0);

    signal read_addr_calc : unsigned(19 downto 0);

begin

    -- VGA Synchronisation Unit
    sync_unit: entity work.vga_sync
        port map (
            clk        => clk,
            reset      => reset,
            hsync      => hsync,
            vsync      => vsync,
            video_on   => video_on,
            pixel_x    => pixel_x,
            pixel_y    => pixel_y
        );

    -- Calculate frame buffer read address (row-major): read_addr = y * 1024 + x
    process(clk)
    begin
        if rising_edge(clk) then
            read_addr_calc <= 
                resize(unsigned(pixel_y) * 1024, 20) + 
                resize(unsigned(pixel_x), 20);
        end if;
    end process;

    -- Select between write address and read address
    process(all)
    begin
        if we = '1' then
            read_addr <= unsigned(wr_addr);  -- Direct assignment
        else
            read_addr <= read_addr_calc;  -- Convert back to slv
        end if;
    end process;

    -- Frame buffer instantiation
    fb: entity work.frame_buffer
        port map (
            clk      => clk,
            we       => we,
            address  => read_addr,
            data_in  => wr_data,
            data_out => pixel_data
        );

    -- Output RGB only when video_on is high
    rgb <= pixel_data when video_on = '1' else (others => '0');

end rtl;
