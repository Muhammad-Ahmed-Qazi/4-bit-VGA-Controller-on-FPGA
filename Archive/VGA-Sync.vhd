library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_sync is
	port(
		clk, reset: in std_logic;
		hsync, vsync: out std_logic;
		video_on, p_tick: out std_logic;
		pixel_x, pixel_y: out std_logic_vector (9 downto 0)
	);
end vga_sync;

architecture arch of vga_sync is

	-- VGA 640x480 sync parameters
	constant HD: integer := 640; -- Horizontal Display
	constant HF: integer := 16; -- Horizontal Front Porch
	constant HB: integer := 48; -- Horizontal Back Porch
	constant HR : integer := 96; -- Horizontal Retrace

	constant VD: integer := 480; -- Vertical Display
	constant VF: integer := 10; -- Vertical Front Porch
	constant VB: integer := 33; -- Vertical Back Porch
	constant VR: integer := 2; -- Vertical Retrace

	-- Mod-2 counter
	signal mod2_reg, mod2_next: std_logic;

	-- sync counters
	signal v_count_reg, v_count_next: unsigned(9 downto 0);
	signal h_count_reg, h_count_next: unsigned(9 downto 0);

	-- output buffer
	signal v_sync_reg, h_sync_reg: std_logic;
	signal v_sync_next, h_sync_next: std_logic;

	-- status signal
	signal h_end, v_end, pixel_tick: std_logic;

begin

	-- registers
	process(clk, reset)
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
	pixel_tick <= '1' when mod2_reg = '1' else '0';

	-- status
	h_end <= -- end of horizontal counter
		'1' when h_count_reg = (HD + HF + HB + HR - 1) else -- 799
		'0';
	v_end <= -- end of vertical counter
		'1' when v_count_reg = (VD + VF + VB + VR - 1) else -- 524
		'0';

	-- Mod-800 horizontal sync counter
	process (h_count_reg, h_end, pixel_tick)
	begin
		if pixel_tick = '1' then
			if h_end = '1' then
				h_count_next <= (others => '0');
			else
				h_count_next <= h_count_reg + 1;
			end if;
		else
			h_count_next <= h_count_reg;
		end if;
	end process;

	-- Mod-525 vertical sync counter
	process (v_count_reg, v_end, pixel_tick)
	begin
		if pixel_tick = '1' then
			if v_end = '1' then
				v_count_next <= (others => '0');
			else
				v_count_next <= v_count_reg + 1;
			end if;
		else
			v_count_next <= v_count_reg;
		end if;
	end process;

	-- Horizontal and Vertical sync, buffered to avoid glitches
	h_sync_next <=
		'1' when (h_count_reg >= (HD + HF))					-- 656
			 and (h_count_reg <= (HD + HF + HR - 1)) else	-- 751
		'0';
	v_sync_next <=
		'1' when (v_count_reg >= (VD + VF))					-- 490
			 and (v_count_reg <= (VD + VF + VR - 1)) else	-- 491
		'0';
	
	-- Video ON/OFF
	video_on <= 
		'1' when (h_count_reg < HD) and (v_count_reg < VD) else 
		'0';
	
	-- Output signals
	hsync <= h_sync_reg;
	vsync <= v_sync_reg;
	pixel_x <= std_logic_vector(h_count_reg);
	pixel_y <= std_logic_vector(v_count_reg);
	p_tick <= pixel_tick;

end arch ; -- arch

