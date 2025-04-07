library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity frame_buffer_tb is
end frame_buffer_tb;

architecture Behavioral of frame_buffer_tb is
    -- Constants
    constant CLK_PERIOD : time := 10 ns;  -- 100 MHz clock for testing
    
    -- Signals
    signal clk      : std_logic := '0';
    signal reset    : std_logic := '1';
    signal we       : std_logic := '0';
    signal address  : unsigned(19 downto 0) := (others => '0');
    signal data_in  : std_logic_vector(7 downto 0) := (others => '0');
    signal data_out : std_logic_vector(7 downto 0);
    
    -- Test control
    signal test_done : boolean := false;
begin
    -- Instantiate the frame buffer
    uut: entity work.frame_buffer
    port map (
        clk      => clk,
        we       => we,
        address  => address,
        data_in  => data_in,
        data_out => data_out
    );
    
    -- Clock generation (fixed)
	clk_process: process
	begin
		 for i in 1 to (36 ms / CLK_PERIOD) loop  -- Precise cycle count
			  clk <= '0';
			  wait for CLK_PERIOD/2;
			  clk <= '1';
			  wait for CLK_PERIOD/2;
		 end loop;
		 report "Simulation finished at 36ms";
		 wait;
	end process;
    
    -- Test sequence
    stimulus: process
    begin
        -- Reset phase
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait for CLK_PERIOD;
        
        -- Test 1: Sequential write/read
        report "Starting sequential write/read test...";
        we <= '1';
        for i in 0 to 1023 loop  -- Test 1K addresses (adjust as needed)
            address <= to_unsigned(i, 20);
            data_in <= std_logic_vector(to_unsigned(i mod 256, 8));
            wait for CLK_PERIOD;
        end loop;
        we <= '0';
        
        -- Verify reads
        for i in 0 to 1023 loop
            address <= to_unsigned(i, 20);
            wait for CLK_PERIOD;
            assert data_out = std_logic_vector(to_unsigned(i mod 256, 8))
                report "Read mismatch at address " & integer'image(i)
                severity error;
        end loop;
        
        -- Test 2: Random write/read
        report "Starting random write/read test...";
        we <= '1';
        for i in 0 to 99 loop  -- 100 random writes
            address <= to_unsigned(500 + i*10, 20);
            data_in <= std_logic_vector(to_unsigned(255 - i, 8));
            wait for CLK_PERIOD;
        end loop;
        we <= '0';
        
        -- Verify random reads
        for i in 0 to 99 loop
            address <= to_unsigned(500 + i*10, 20);
            wait for CLK_PERIOD;
            assert data_out = std_logic_vector(to_unsigned(255 - i, 8))
                report "Random read mismatch at address " & integer'image(500 + i*10)
                severity error;
        end loop;
        
        -- Test 3: Corner cases (min/max addresses)
        report "Testing corner cases...";
        we <= '1';
        address <= (others => '0');  -- Min address
        data_in <= x"AA";
        wait for CLK_PERIOD;
        
        address <= (others => '1');  -- Max address (20-bit)
        data_in <= x"55";
        wait for CLK_PERIOD;
        we <= '0';
        
        -- Verify corners
        address <= (others => '0');
        wait for CLK_PERIOD;
        assert data_out = x"AA" report "Min address failed" severity error;
        
        address <= (others => '1');
        wait for CLK_PERIOD;
        assert data_out = x"55" report "Max address failed" severity error;
        
        -- Done
        report "All tests passed!";
        test_done <= true;
        wait;
    end process;
	 
	 -- Stimulus process (add this at the end)
	stop_simulation: process
	begin
		 wait for 36 ms;
		 assert false report "Simulation completed" severity note;
		 std.env.stop;  -- VHDL-2008 standard stop
		 wait;
end process;

end Behavioral;