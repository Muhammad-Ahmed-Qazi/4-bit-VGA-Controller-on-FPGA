library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture arch of testbench is

    signal clk, reset: std_logic;
    signal hsync, video_on: std_logic;
    signal pixel_x: std_logic_vector(9 downto 0);

begin
    -- Instantiate the Unit Under Test (UUT)
    UUT: entity work.vga_sync
        port map (
            clk => clk,
            reset => reset,
            hsync => hsync,
            video_on => video_on,
            pixel_X => pixel_x
        );

    -- Clock Generation Process
    process
    begin
        clk <= '0';
        wait for 19.86 ns;
        clk <= '1';
        wait for 19.86 ns;
    end process;

    -- Reset Process
    process
    begin
        reset <= '0'; -- Apply reset
        wait for 350 ns;   -- Keep reset active for 20 ns
        reset <= '1'; -- Release reset
        
		  wait for 35000 ns;
		  assert false report "Simulation Complete" severity failure;             -- Stop process execution
    end process;

end arch;
