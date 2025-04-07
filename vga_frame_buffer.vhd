library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity frame_buffer is
    generic (
        FRAME_WIDTH  : integer := 1024;  -- XGA width
        FRAME_HEIGHT : integer := 768;   -- XGA height
        PIXEL_BITS   : integer := 8      -- 8-bit per pixel (3-3-2 RGB)
    );
    port (
        clk      : in  std_logic;
        we       : in  std_logic;                      -- Write enable
        address  : in  unsigned(19 downto 0);          -- 20-bit address 
        data_in  : in  std_logic_vector(PIXEL_BITS-1 downto 0);
        data_out : out std_logic_vector(PIXEL_BITS-1 downto 0)
    );
end frame_buffer;

architecture rtl of frame_buffer is
    -- Calculate memory depth
    constant MEM_DEPTH : integer := FRAME_WIDTH * FRAME_HEIGHT;
    
    -- Memory array type
    type mem_array is array (0 to MEM_DEPTH-1) of 
         std_logic_vector(PIXEL_BITS-1 downto 0);
    
    -- Memory signal with BRAM inference attributes
    signal memory : mem_array;
    
    -- Quartus BRAM inference directives
    attribute ramstyle : string;
    attribute ramstyle of memory : signal is "M9K";  -- For Cyclone IV/V
    -- attribute ramstyle of memory : signal is "M10K";  -- For Cyclone 10/Intel
    
begin
    -- Single-process synchronous RAM implementation
    process(clk)
    begin
        if rising_edge(clk) then
            -- Write with priority
            if we = '1' then
                memory(to_integer(address)) <= data_in;
            end if;
            
            -- Synchronous read
            data_out <= memory(to_integer(address));
        end if;
    end process;
    
end rtl;