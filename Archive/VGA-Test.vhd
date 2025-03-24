library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity vga_tb is
end vga_tb;

architecture tb of vga_tb is
    -- Testbench signals
    signal clk_tb: std_logic := '0';
    signal reset_tb: std_logic := '1';
    signal sw_tb: std_logic_vector(2 downto 0) := "000";
    signal hsync_tb, vsync_tb: std_logic;
    signal rgb_tb: std_logic_vector(2 downto 0);

    -- Clock period definition (40 ns for 25MHz pixel clock)
    constant clk_period: time := 40 ns;

begin
    -- Instantiate the DUT (Device Under Test)
    DUT: entity work.vga_test
        port map(
            clk => clk_tb,
            reset => reset_tb,
            sw => sw_tb,
            hsync => hsync_tb,
            vsync => vsync_tb,
            rgb => rgb_tb
        );

    -- Clock process: Generates a clock signal
    clk_process: process
    begin
        while now < 10 ms loop  -- Run simulation for 10ms
            clk_tb <= '0';
            wait for clk_period / 2;
            clk_tb <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process: Provides test inputs
    stim_process: process
    begin
        -- Apply reset for first 100 ns
        wait for 100 ns;
        reset_tb <= '0';
        
        -- Change switch values over time
        wait for 200 ns; sw_tb <= "001"; -- Red
        wait for 200 ns; sw_tb <= "010"; -- Green
        wait for 200 ns; sw_tb <= "011"; -- Yellow
        wait for 200 ns; sw_tb <= "100"; -- Blue
        
        -- Run for some more time then stop
        wait for 5 ms;
        assert false report "Simulation completed" severity failure;
    end process;

end tb;
