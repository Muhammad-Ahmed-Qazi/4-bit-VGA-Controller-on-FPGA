-- Copyright (C) 2025  Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Altera and sold by Altera or its authorized distributors.  Please
-- refer to the Altera Software License Subscription Agreements 
-- on the Quartus Prime software download page.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 24.1std.0 Build 1077 03/04/2025 SC Lite Edition"

-- DATE "03/20/2025 11:46:53"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for QuestaSim (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	vga_test IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	sw : IN std_logic_vector(2 DOWNTO 0);
	hsync : BUFFER std_logic;
	vsync : BUFFER std_logic;
	rgb : BUFFER std_logic_vector(2 DOWNTO 0)
	);
END vga_test;

-- Design Ports Information
-- hsync	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vsync	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rgb[0]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rgb[1]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rgb[2]	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sw[0]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sw[1]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sw[2]	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF vga_test IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_sw : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_hsync : std_logic;
SIGNAL ww_vsync : std_logic;
SIGNAL ww_rgb : std_logic_vector(2 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \vga_sync_unit|Add0~33_sumout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \vga_sync_unit|Add0~18\ : std_logic;
SIGNAL \vga_sync_unit|Add0~9_sumout\ : std_logic;
SIGNAL \vga_sync_unit|mod2_reg~0_combout\ : std_logic;
SIGNAL \vga_sync_unit|mod2_reg~q\ : std_logic;
SIGNAL \vga_sync_unit|Add0~10\ : std_logic;
SIGNAL \vga_sync_unit|Add0~5_sumout\ : std_logic;
SIGNAL \vga_sync_unit|h_count_reg[8]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|Add0~6\ : std_logic;
SIGNAL \vga_sync_unit|Add0~1_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Equal0~0_combout\ : std_logic;
SIGNAL \vga_sync_unit|Equal0~1_combout\ : std_logic;
SIGNAL \vga_sync_unit|Equal0~2_combout\ : std_logic;
SIGNAL \vga_sync_unit|Add0~34\ : std_logic;
SIGNAL \vga_sync_unit|Add0~29_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add0~30\ : std_logic;
SIGNAL \vga_sync_unit|Add0~25_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add0~26\ : std_logic;
SIGNAL \vga_sync_unit|Add0~37_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add0~38\ : std_logic;
SIGNAL \vga_sync_unit|Add0~13_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add0~14\ : std_logic;
SIGNAL \vga_sync_unit|Add0~21_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add0~22\ : std_logic;
SIGNAL \vga_sync_unit|Add0~17_sumout\ : std_logic;
SIGNAL \vga_sync_unit|h_sync_next~0_combout\ : std_logic;
SIGNAL \vga_sync_unit|h_sync_reg~q\ : std_logic;
SIGNAL \vga_sync_unit|Add1~37_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add1~38\ : std_logic;
SIGNAL \vga_sync_unit|Add1~21_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add1~22\ : std_logic;
SIGNAL \vga_sync_unit|Add1~26\ : std_logic;
SIGNAL \vga_sync_unit|Add1~29_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add1~30\ : std_logic;
SIGNAL \vga_sync_unit|Add1~33_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add1~34\ : std_logic;
SIGNAL \vga_sync_unit|Add1~5_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add1~6\ : std_logic;
SIGNAL \vga_sync_unit|Add1~9_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add1~10\ : std_logic;
SIGNAL \vga_sync_unit|Add1~13_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add1~14\ : std_logic;
SIGNAL \vga_sync_unit|Add1~17_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add1~18\ : std_logic;
SIGNAL \vga_sync_unit|Add1~1_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Equal1~1_combout\ : std_logic;
SIGNAL \vga_sync_unit|Equal1~0_combout\ : std_logic;
SIGNAL \vga_sync_unit|Add1~25_sumout\ : std_logic;
SIGNAL \vga_sync_unit|v_count_reg[2]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|LessThan5~0_combout\ : std_logic;
SIGNAL \vga_sync_unit|v_sync_next~0_combout\ : std_logic;
SIGNAL \vga_sync_unit|v_sync_reg~q\ : std_logic;
SIGNAL \vga_sync_unit|v_count_reg[9]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|h_count_reg[7]~DUPLICATE_q\ : std_logic;
SIGNAL \sw[0]~input_o\ : std_logic;
SIGNAL \rgb~0_combout\ : std_logic;
SIGNAL \sw[1]~input_o\ : std_logic;
SIGNAL \rgb~1_combout\ : std_logic;
SIGNAL \sw[2]~input_o\ : std_logic;
SIGNAL \rgb~2_combout\ : std_logic;
SIGNAL rgb_reg : std_logic_vector(2 DOWNTO 0);
SIGNAL \vga_sync_unit|h_count_reg\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \vga_sync_unit|v_count_reg\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \vga_sync_unit|ALT_INV_v_count_reg[2]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_h_count_reg[8]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_v_count_reg[9]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_Equal1~1_combout\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_mod2_reg~q\ : std_logic;
SIGNAL ALT_INV_rgb_reg : std_logic_vector(2 DOWNTO 0);
SIGNAL \vga_sync_unit|ALT_INV_LessThan5~0_combout\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_h_count_reg\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \vga_sync_unit|ALT_INV_v_count_reg\ : std_logic_vector(9 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_sw <= sw;
hsync <= ww_hsync;
vsync <= ww_vsync;
rgb <= ww_rgb;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\vga_sync_unit|ALT_INV_v_count_reg[2]~DUPLICATE_q\ <= NOT \vga_sync_unit|v_count_reg[2]~DUPLICATE_q\;
\vga_sync_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\ <= NOT \vga_sync_unit|h_count_reg[7]~DUPLICATE_q\;
\vga_sync_unit|ALT_INV_h_count_reg[8]~DUPLICATE_q\ <= NOT \vga_sync_unit|h_count_reg[8]~DUPLICATE_q\;
\vga_sync_unit|ALT_INV_v_count_reg[9]~DUPLICATE_q\ <= NOT \vga_sync_unit|v_count_reg[9]~DUPLICATE_q\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\vga_sync_unit|ALT_INV_Equal1~1_combout\ <= NOT \vga_sync_unit|Equal1~1_combout\;
\vga_sync_unit|ALT_INV_Equal0~1_combout\ <= NOT \vga_sync_unit|Equal0~1_combout\;
\vga_sync_unit|ALT_INV_Equal0~0_combout\ <= NOT \vga_sync_unit|Equal0~0_combout\;
\vga_sync_unit|ALT_INV_mod2_reg~q\ <= NOT \vga_sync_unit|mod2_reg~q\;
ALT_INV_rgb_reg(2) <= NOT rgb_reg(2);
ALT_INV_rgb_reg(1) <= NOT rgb_reg(1);
\vga_sync_unit|ALT_INV_LessThan5~0_combout\ <= NOT \vga_sync_unit|LessThan5~0_combout\;
ALT_INV_rgb_reg(0) <= NOT rgb_reg(0);
\vga_sync_unit|ALT_INV_h_count_reg\(3) <= NOT \vga_sync_unit|h_count_reg\(3);
\vga_sync_unit|ALT_INV_h_count_reg\(0) <= NOT \vga_sync_unit|h_count_reg\(0);
\vga_sync_unit|ALT_INV_h_count_reg\(1) <= NOT \vga_sync_unit|h_count_reg\(1);
\vga_sync_unit|ALT_INV_h_count_reg\(2) <= NOT \vga_sync_unit|h_count_reg\(2);
\vga_sync_unit|ALT_INV_v_count_reg\(0) <= NOT \vga_sync_unit|v_count_reg\(0);
\vga_sync_unit|ALT_INV_v_count_reg\(4) <= NOT \vga_sync_unit|v_count_reg\(4);
\vga_sync_unit|ALT_INV_v_count_reg\(3) <= NOT \vga_sync_unit|v_count_reg\(3);
\vga_sync_unit|ALT_INV_v_count_reg\(2) <= NOT \vga_sync_unit|v_count_reg\(2);
\vga_sync_unit|ALT_INV_v_count_reg\(1) <= NOT \vga_sync_unit|v_count_reg\(1);
\vga_sync_unit|ALT_INV_h_count_reg\(5) <= NOT \vga_sync_unit|h_count_reg\(5);
\vga_sync_unit|ALT_INV_h_count_reg\(6) <= NOT \vga_sync_unit|h_count_reg\(6);
\vga_sync_unit|ALT_INV_h_count_reg\(4) <= NOT \vga_sync_unit|h_count_reg\(4);
\vga_sync_unit|ALT_INV_v_count_reg\(8) <= NOT \vga_sync_unit|v_count_reg\(8);
\vga_sync_unit|ALT_INV_v_count_reg\(7) <= NOT \vga_sync_unit|v_count_reg\(7);
\vga_sync_unit|ALT_INV_v_count_reg\(6) <= NOT \vga_sync_unit|v_count_reg\(6);
\vga_sync_unit|ALT_INV_v_count_reg\(5) <= NOT \vga_sync_unit|v_count_reg\(5);
\vga_sync_unit|ALT_INV_h_count_reg\(7) <= NOT \vga_sync_unit|h_count_reg\(7);
\vga_sync_unit|ALT_INV_h_count_reg\(8) <= NOT \vga_sync_unit|h_count_reg\(8);
\vga_sync_unit|ALT_INV_h_count_reg\(9) <= NOT \vga_sync_unit|h_count_reg\(9);
\vga_sync_unit|ALT_INV_v_count_reg\(9) <= NOT \vga_sync_unit|v_count_reg\(9);

-- Location: IOOBUF_X89_Y37_N39
\hsync~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga_sync_unit|h_sync_reg~q\,
	devoe => ww_devoe,
	o => ww_hsync);

-- Location: IOOBUF_X89_Y35_N45
\vsync~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga_sync_unit|v_sync_reg~q\,
	devoe => ww_devoe,
	o => ww_vsync);

-- Location: IOOBUF_X89_Y36_N5
\rgb[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgb~0_combout\,
	devoe => ww_devoe,
	o => ww_rgb(0));

-- Location: IOOBUF_X89_Y37_N56
\rgb[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgb~1_combout\,
	devoe => ww_devoe,
	o => ww_rgb(1));

-- Location: IOOBUF_X89_Y37_N5
\rgb[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgb~2_combout\,
	devoe => ww_devoe,
	o => ww_rgb(2));

-- Location: IOIBUF_X89_Y35_N61
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: LABCELL_X88_Y37_N30
\vga_sync_unit|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add0~33_sumout\ = SUM(( \vga_sync_unit|h_count_reg\(0) ) + ( VCC ) + ( !VCC ))
-- \vga_sync_unit|Add0~34\ = CARRY(( \vga_sync_unit|h_count_reg\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(0),
	cin => GND,
	sumout => \vga_sync_unit|Add0~33_sumout\,
	cout => \vga_sync_unit|Add0~34\);

-- Location: IOIBUF_X89_Y37_N21
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: LABCELL_X88_Y37_N48
\vga_sync_unit|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add0~17_sumout\ = SUM(( \vga_sync_unit|h_count_reg\(6) ) + ( GND ) + ( \vga_sync_unit|Add0~22\ ))
-- \vga_sync_unit|Add0~18\ = CARRY(( \vga_sync_unit|h_count_reg\(6) ) + ( GND ) + ( \vga_sync_unit|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(6),
	cin => \vga_sync_unit|Add0~22\,
	sumout => \vga_sync_unit|Add0~17_sumout\,
	cout => \vga_sync_unit|Add0~18\);

-- Location: LABCELL_X88_Y37_N51
\vga_sync_unit|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add0~9_sumout\ = SUM(( \vga_sync_unit|h_count_reg\(7) ) + ( GND ) + ( \vga_sync_unit|Add0~18\ ))
-- \vga_sync_unit|Add0~10\ = CARRY(( \vga_sync_unit|h_count_reg\(7) ) + ( GND ) + ( \vga_sync_unit|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(7),
	cin => \vga_sync_unit|Add0~18\,
	sumout => \vga_sync_unit|Add0~9_sumout\,
	cout => \vga_sync_unit|Add0~10\);

-- Location: MLABCELL_X87_Y37_N51
\vga_sync_unit|mod2_reg~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|mod2_reg~0_combout\ = ( !\vga_sync_unit|mod2_reg~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \vga_sync_unit|ALT_INV_mod2_reg~q\,
	combout => \vga_sync_unit|mod2_reg~0_combout\);

-- Location: FF_X87_Y37_N53
\vga_sync_unit|mod2_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|mod2_reg~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|mod2_reg~q\);

-- Location: FF_X88_Y37_N52
\vga_sync_unit|h_count_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~9_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg\(7));

-- Location: FF_X88_Y37_N55
\vga_sync_unit|h_count_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~5_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg\(8));

-- Location: LABCELL_X88_Y37_N54
\vga_sync_unit|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add0~5_sumout\ = SUM(( \vga_sync_unit|h_count_reg\(8) ) + ( GND ) + ( \vga_sync_unit|Add0~10\ ))
-- \vga_sync_unit|Add0~6\ = CARRY(( \vga_sync_unit|h_count_reg\(8) ) + ( GND ) + ( \vga_sync_unit|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(8),
	cin => \vga_sync_unit|Add0~10\,
	sumout => \vga_sync_unit|Add0~5_sumout\,
	cout => \vga_sync_unit|Add0~6\);

-- Location: FF_X88_Y37_N56
\vga_sync_unit|h_count_reg[8]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~5_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg[8]~DUPLICATE_q\);

-- Location: LABCELL_X88_Y37_N57
\vga_sync_unit|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add0~1_sumout\ = SUM(( \vga_sync_unit|h_count_reg\(9) ) + ( GND ) + ( \vga_sync_unit|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(9),
	cin => \vga_sync_unit|Add0~6\,
	sumout => \vga_sync_unit|Add0~1_sumout\);

-- Location: FF_X88_Y37_N58
\vga_sync_unit|h_count_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~1_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg\(9));

-- Location: LABCELL_X88_Y37_N24
\vga_sync_unit|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Equal0~0_combout\ = ( \vga_sync_unit|h_count_reg[8]~DUPLICATE_q\ & ( \vga_sync_unit|h_count_reg\(9) & ( (\vga_sync_unit|h_count_reg\(1) & \vga_sync_unit|h_count_reg\(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \vga_sync_unit|ALT_INV_h_count_reg\(1),
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(0),
	datae => \vga_sync_unit|ALT_INV_h_count_reg[8]~DUPLICATE_q\,
	dataf => \vga_sync_unit|ALT_INV_h_count_reg\(9),
	combout => \vga_sync_unit|Equal0~0_combout\);

-- Location: LABCELL_X88_Y37_N9
\vga_sync_unit|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Equal0~1_combout\ = ( \vga_sync_unit|h_count_reg\(4) & ( (!\vga_sync_unit|h_count_reg\(6) & (\vga_sync_unit|h_count_reg\(3) & !\vga_sync_unit|h_count_reg\(5))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001010000000000000101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_h_count_reg\(6),
	datac => \vga_sync_unit|ALT_INV_h_count_reg\(3),
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(5),
	dataf => \vga_sync_unit|ALT_INV_h_count_reg\(4),
	combout => \vga_sync_unit|Equal0~1_combout\);

-- Location: LABCELL_X88_Y37_N6
\vga_sync_unit|Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Equal0~2_combout\ = ( \vga_sync_unit|Equal0~1_combout\ & ( (!\vga_sync_unit|h_count_reg\(7) & (\vga_sync_unit|Equal0~0_combout\ & \vga_sync_unit|h_count_reg\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011000000000000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \vga_sync_unit|ALT_INV_h_count_reg\(7),
	datac => \vga_sync_unit|ALT_INV_Equal0~0_combout\,
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(2),
	dataf => \vga_sync_unit|ALT_INV_Equal0~1_combout\,
	combout => \vga_sync_unit|Equal0~2_combout\);

-- Location: FF_X88_Y37_N32
\vga_sync_unit|h_count_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~33_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg\(0));

-- Location: LABCELL_X88_Y37_N33
\vga_sync_unit|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add0~29_sumout\ = SUM(( \vga_sync_unit|h_count_reg\(1) ) + ( GND ) + ( \vga_sync_unit|Add0~34\ ))
-- \vga_sync_unit|Add0~30\ = CARRY(( \vga_sync_unit|h_count_reg\(1) ) + ( GND ) + ( \vga_sync_unit|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(1),
	cin => \vga_sync_unit|Add0~34\,
	sumout => \vga_sync_unit|Add0~29_sumout\,
	cout => \vga_sync_unit|Add0~30\);

-- Location: FF_X88_Y37_N35
\vga_sync_unit|h_count_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~29_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg\(1));

-- Location: LABCELL_X88_Y37_N36
\vga_sync_unit|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add0~25_sumout\ = SUM(( \vga_sync_unit|h_count_reg\(2) ) + ( GND ) + ( \vga_sync_unit|Add0~30\ ))
-- \vga_sync_unit|Add0~26\ = CARRY(( \vga_sync_unit|h_count_reg\(2) ) + ( GND ) + ( \vga_sync_unit|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(2),
	cin => \vga_sync_unit|Add0~30\,
	sumout => \vga_sync_unit|Add0~25_sumout\,
	cout => \vga_sync_unit|Add0~26\);

-- Location: FF_X88_Y37_N38
\vga_sync_unit|h_count_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~25_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg\(2));

-- Location: LABCELL_X88_Y37_N39
\vga_sync_unit|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add0~37_sumout\ = SUM(( \vga_sync_unit|h_count_reg\(3) ) + ( GND ) + ( \vga_sync_unit|Add0~26\ ))
-- \vga_sync_unit|Add0~38\ = CARRY(( \vga_sync_unit|h_count_reg\(3) ) + ( GND ) + ( \vga_sync_unit|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(3),
	cin => \vga_sync_unit|Add0~26\,
	sumout => \vga_sync_unit|Add0~37_sumout\,
	cout => \vga_sync_unit|Add0~38\);

-- Location: FF_X88_Y37_N41
\vga_sync_unit|h_count_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~37_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg\(3));

-- Location: LABCELL_X88_Y37_N42
\vga_sync_unit|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add0~13_sumout\ = SUM(( \vga_sync_unit|h_count_reg\(4) ) + ( GND ) + ( \vga_sync_unit|Add0~38\ ))
-- \vga_sync_unit|Add0~14\ = CARRY(( \vga_sync_unit|h_count_reg\(4) ) + ( GND ) + ( \vga_sync_unit|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(4),
	cin => \vga_sync_unit|Add0~38\,
	sumout => \vga_sync_unit|Add0~13_sumout\,
	cout => \vga_sync_unit|Add0~14\);

-- Location: FF_X88_Y37_N44
\vga_sync_unit|h_count_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~13_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg\(4));

-- Location: LABCELL_X88_Y37_N45
\vga_sync_unit|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add0~21_sumout\ = SUM(( \vga_sync_unit|h_count_reg\(5) ) + ( GND ) + ( \vga_sync_unit|Add0~14\ ))
-- \vga_sync_unit|Add0~22\ = CARRY(( \vga_sync_unit|h_count_reg\(5) ) + ( GND ) + ( \vga_sync_unit|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(5),
	cin => \vga_sync_unit|Add0~14\,
	sumout => \vga_sync_unit|Add0~21_sumout\,
	cout => \vga_sync_unit|Add0~22\);

-- Location: FF_X88_Y37_N47
\vga_sync_unit|h_count_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~21_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg\(5));

-- Location: FF_X88_Y37_N50
\vga_sync_unit|h_count_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~17_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg\(6));

-- Location: LABCELL_X88_Y37_N12
\vga_sync_unit|h_sync_next~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|h_sync_next~0_combout\ = ( \vga_sync_unit|h_count_reg\(7) & ( \vga_sync_unit|h_count_reg\(9) & ( (!\vga_sync_unit|h_count_reg[8]~DUPLICATE_q\ & ((!\vga_sync_unit|h_count_reg\(6) & ((\vga_sync_unit|h_count_reg\(4)) # 
-- (\vga_sync_unit|h_count_reg\(5)))) # (\vga_sync_unit|h_count_reg\(6) & ((!\vga_sync_unit|h_count_reg\(5)) # (!\vga_sync_unit|h_count_reg\(4)))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000111000011100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_h_count_reg\(6),
	datab => \vga_sync_unit|ALT_INV_h_count_reg\(5),
	datac => \vga_sync_unit|ALT_INV_h_count_reg[8]~DUPLICATE_q\,
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(4),
	datae => \vga_sync_unit|ALT_INV_h_count_reg\(7),
	dataf => \vga_sync_unit|ALT_INV_h_count_reg\(9),
	combout => \vga_sync_unit|h_sync_next~0_combout\);

-- Location: FF_X88_Y37_N13
\vga_sync_unit|h_sync_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|h_sync_next~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_sync_reg~q\);

-- Location: MLABCELL_X87_Y37_N0
\vga_sync_unit|Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add1~37_sumout\ = SUM(( \vga_sync_unit|v_count_reg\(0) ) + ( VCC ) + ( !VCC ))
-- \vga_sync_unit|Add1~38\ = CARRY(( \vga_sync_unit|v_count_reg\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(0),
	cin => GND,
	sumout => \vga_sync_unit|Add1~37_sumout\,
	cout => \vga_sync_unit|Add1~38\);

-- Location: FF_X87_Y37_N1
\vga_sync_unit|v_count_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~37_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg\(0));

-- Location: MLABCELL_X87_Y37_N3
\vga_sync_unit|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add1~21_sumout\ = SUM(( \vga_sync_unit|v_count_reg\(1) ) + ( GND ) + ( \vga_sync_unit|Add1~38\ ))
-- \vga_sync_unit|Add1~22\ = CARRY(( \vga_sync_unit|v_count_reg\(1) ) + ( GND ) + ( \vga_sync_unit|Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(1),
	cin => \vga_sync_unit|Add1~38\,
	sumout => \vga_sync_unit|Add1~21_sumout\,
	cout => \vga_sync_unit|Add1~22\);

-- Location: FF_X87_Y37_N5
\vga_sync_unit|v_count_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~21_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg\(1));

-- Location: MLABCELL_X87_Y37_N6
\vga_sync_unit|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add1~25_sumout\ = SUM(( \vga_sync_unit|v_count_reg\(2) ) + ( GND ) + ( \vga_sync_unit|Add1~22\ ))
-- \vga_sync_unit|Add1~26\ = CARRY(( \vga_sync_unit|v_count_reg\(2) ) + ( GND ) + ( \vga_sync_unit|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(2),
	cin => \vga_sync_unit|Add1~22\,
	sumout => \vga_sync_unit|Add1~25_sumout\,
	cout => \vga_sync_unit|Add1~26\);

-- Location: MLABCELL_X87_Y37_N9
\vga_sync_unit|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add1~29_sumout\ = SUM(( \vga_sync_unit|v_count_reg\(3) ) + ( GND ) + ( \vga_sync_unit|Add1~26\ ))
-- \vga_sync_unit|Add1~30\ = CARRY(( \vga_sync_unit|v_count_reg\(3) ) + ( GND ) + ( \vga_sync_unit|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(3),
	cin => \vga_sync_unit|Add1~26\,
	sumout => \vga_sync_unit|Add1~29_sumout\,
	cout => \vga_sync_unit|Add1~30\);

-- Location: FF_X87_Y37_N11
\vga_sync_unit|v_count_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~29_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg\(3));

-- Location: MLABCELL_X87_Y37_N12
\vga_sync_unit|Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add1~33_sumout\ = SUM(( \vga_sync_unit|v_count_reg\(4) ) + ( GND ) + ( \vga_sync_unit|Add1~30\ ))
-- \vga_sync_unit|Add1~34\ = CARRY(( \vga_sync_unit|v_count_reg\(4) ) + ( GND ) + ( \vga_sync_unit|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(4),
	cin => \vga_sync_unit|Add1~30\,
	sumout => \vga_sync_unit|Add1~33_sumout\,
	cout => \vga_sync_unit|Add1~34\);

-- Location: FF_X87_Y37_N14
\vga_sync_unit|v_count_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~33_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg\(4));

-- Location: MLABCELL_X87_Y37_N15
\vga_sync_unit|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add1~5_sumout\ = SUM(( \vga_sync_unit|v_count_reg\(5) ) + ( GND ) + ( \vga_sync_unit|Add1~34\ ))
-- \vga_sync_unit|Add1~6\ = CARRY(( \vga_sync_unit|v_count_reg\(5) ) + ( GND ) + ( \vga_sync_unit|Add1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(5),
	cin => \vga_sync_unit|Add1~34\,
	sumout => \vga_sync_unit|Add1~5_sumout\,
	cout => \vga_sync_unit|Add1~6\);

-- Location: FF_X87_Y37_N17
\vga_sync_unit|v_count_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~5_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg\(5));

-- Location: MLABCELL_X87_Y37_N18
\vga_sync_unit|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add1~9_sumout\ = SUM(( \vga_sync_unit|v_count_reg\(6) ) + ( GND ) + ( \vga_sync_unit|Add1~6\ ))
-- \vga_sync_unit|Add1~10\ = CARRY(( \vga_sync_unit|v_count_reg\(6) ) + ( GND ) + ( \vga_sync_unit|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(6),
	cin => \vga_sync_unit|Add1~6\,
	sumout => \vga_sync_unit|Add1~9_sumout\,
	cout => \vga_sync_unit|Add1~10\);

-- Location: FF_X87_Y37_N20
\vga_sync_unit|v_count_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~9_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg\(6));

-- Location: MLABCELL_X87_Y37_N21
\vga_sync_unit|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add1~13_sumout\ = SUM(( \vga_sync_unit|v_count_reg\(7) ) + ( GND ) + ( \vga_sync_unit|Add1~10\ ))
-- \vga_sync_unit|Add1~14\ = CARRY(( \vga_sync_unit|v_count_reg\(7) ) + ( GND ) + ( \vga_sync_unit|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(7),
	cin => \vga_sync_unit|Add1~10\,
	sumout => \vga_sync_unit|Add1~13_sumout\,
	cout => \vga_sync_unit|Add1~14\);

-- Location: FF_X87_Y37_N23
\vga_sync_unit|v_count_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~13_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg\(7));

-- Location: MLABCELL_X87_Y37_N24
\vga_sync_unit|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add1~17_sumout\ = SUM(( \vga_sync_unit|v_count_reg\(8) ) + ( GND ) + ( \vga_sync_unit|Add1~14\ ))
-- \vga_sync_unit|Add1~18\ = CARRY(( \vga_sync_unit|v_count_reg\(8) ) + ( GND ) + ( \vga_sync_unit|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(8),
	cin => \vga_sync_unit|Add1~14\,
	sumout => \vga_sync_unit|Add1~17_sumout\,
	cout => \vga_sync_unit|Add1~18\);

-- Location: FF_X87_Y37_N26
\vga_sync_unit|v_count_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~17_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg\(8));

-- Location: MLABCELL_X87_Y37_N27
\vga_sync_unit|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add1~1_sumout\ = SUM(( \vga_sync_unit|v_count_reg\(9) ) + ( GND ) + ( \vga_sync_unit|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(9),
	cin => \vga_sync_unit|Add1~18\,
	sumout => \vga_sync_unit|Add1~1_sumout\);

-- Location: FF_X87_Y37_N29
\vga_sync_unit|v_count_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~1_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg\(9));

-- Location: MLABCELL_X87_Y37_N30
\vga_sync_unit|Equal1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Equal1~1_combout\ = ( !\vga_sync_unit|v_count_reg\(1) & ( !\vga_sync_unit|v_count_reg\(0) & ( (!\vga_sync_unit|v_count_reg\(5) & (!\vga_sync_unit|v_count_reg\(6) & \vga_sync_unit|v_count_reg\(2))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \vga_sync_unit|ALT_INV_v_count_reg\(5),
	datac => \vga_sync_unit|ALT_INV_v_count_reg\(6),
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(2),
	datae => \vga_sync_unit|ALT_INV_v_count_reg\(1),
	dataf => \vga_sync_unit|ALT_INV_v_count_reg\(0),
	combout => \vga_sync_unit|Equal1~1_combout\);

-- Location: MLABCELL_X87_Y37_N42
\vga_sync_unit|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Equal1~0_combout\ = ( \vga_sync_unit|v_count_reg\(9) & ( \vga_sync_unit|Equal1~1_combout\ & ( (!\vga_sync_unit|v_count_reg\(8) & (\vga_sync_unit|v_count_reg\(3) & (!\vga_sync_unit|v_count_reg\(7) & !\vga_sync_unit|v_count_reg\(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_v_count_reg\(8),
	datab => \vga_sync_unit|ALT_INV_v_count_reg\(3),
	datac => \vga_sync_unit|ALT_INV_v_count_reg\(7),
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(4),
	datae => \vga_sync_unit|ALT_INV_v_count_reg\(9),
	dataf => \vga_sync_unit|ALT_INV_Equal1~1_combout\,
	combout => \vga_sync_unit|Equal1~0_combout\);

-- Location: FF_X87_Y37_N8
\vga_sync_unit|v_count_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~25_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg\(2));

-- Location: FF_X87_Y37_N7
\vga_sync_unit|v_count_reg[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~25_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg[2]~DUPLICATE_q\);

-- Location: MLABCELL_X87_Y37_N39
\vga_sync_unit|LessThan5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|LessThan5~0_combout\ = ( \vga_sync_unit|v_count_reg\(7) & ( \vga_sync_unit|v_count_reg\(6) & ( (\vga_sync_unit|v_count_reg\(8) & \vga_sync_unit|v_count_reg\(5)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_v_count_reg\(8),
	datac => \vga_sync_unit|ALT_INV_v_count_reg\(5),
	datae => \vga_sync_unit|ALT_INV_v_count_reg\(7),
	dataf => \vga_sync_unit|ALT_INV_v_count_reg\(6),
	combout => \vga_sync_unit|LessThan5~0_combout\);

-- Location: MLABCELL_X87_Y37_N54
\vga_sync_unit|v_sync_next~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|v_sync_next~0_combout\ = ( !\vga_sync_unit|v_count_reg\(9) & ( \vga_sync_unit|LessThan5~0_combout\ & ( (!\vga_sync_unit|v_count_reg[2]~DUPLICATE_q\ & (!\vga_sync_unit|v_count_reg\(4) & (\vga_sync_unit|v_count_reg\(1) & 
-- \vga_sync_unit|v_count_reg\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000010000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_v_count_reg[2]~DUPLICATE_q\,
	datab => \vga_sync_unit|ALT_INV_v_count_reg\(4),
	datac => \vga_sync_unit|ALT_INV_v_count_reg\(1),
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(3),
	datae => \vga_sync_unit|ALT_INV_v_count_reg\(9),
	dataf => \vga_sync_unit|ALT_INV_LessThan5~0_combout\,
	combout => \vga_sync_unit|v_sync_next~0_combout\);

-- Location: FF_X87_Y37_N55
\vga_sync_unit|v_sync_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|v_sync_next~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_sync_reg~q\);

-- Location: FF_X87_Y37_N28
\vga_sync_unit|v_count_reg[9]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~1_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg[9]~DUPLICATE_q\);

-- Location: FF_X88_Y37_N53
\vga_sync_unit|h_count_reg[7]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~9_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg[7]~DUPLICATE_q\);

-- Location: IOIBUF_X89_Y38_N21
\sw[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(0),
	o => \sw[0]~input_o\);

-- Location: FF_X88_Y37_N2
\rgb_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \sw[0]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(0));

-- Location: LABCELL_X88_Y37_N0
\rgb~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \rgb~0_combout\ = ( rgb_reg(0) & ( !\vga_sync_unit|LessThan5~0_combout\ & ( (!\vga_sync_unit|v_count_reg[9]~DUPLICATE_q\ & ((!\vga_sync_unit|h_count_reg\(9)) # ((!\vga_sync_unit|h_count_reg[7]~DUPLICATE_q\ & !\vga_sync_unit|h_count_reg\(8))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010001000100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_v_count_reg[9]~DUPLICATE_q\,
	datab => \vga_sync_unit|ALT_INV_h_count_reg\(9),
	datac => \vga_sync_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\,
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(8),
	datae => ALT_INV_rgb_reg(0),
	dataf => \vga_sync_unit|ALT_INV_LessThan5~0_combout\,
	combout => \rgb~0_combout\);

-- Location: IOIBUF_X89_Y38_N55
\sw[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(1),
	o => \sw[1]~input_o\);

-- Location: FF_X88_Y37_N5
\rgb_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \sw[1]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(1));

-- Location: LABCELL_X88_Y37_N3
\rgb~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \rgb~1_combout\ = ( rgb_reg(1) & ( !\vga_sync_unit|LessThan5~0_combout\ & ( (!\vga_sync_unit|v_count_reg[9]~DUPLICATE_q\ & ((!\vga_sync_unit|h_count_reg\(9)) # ((!\vga_sync_unit|h_count_reg\(8) & !\vga_sync_unit|h_count_reg[7]~DUPLICATE_q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010001000100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_v_count_reg[9]~DUPLICATE_q\,
	datab => \vga_sync_unit|ALT_INV_h_count_reg\(9),
	datac => \vga_sync_unit|ALT_INV_h_count_reg\(8),
	datad => \vga_sync_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\,
	datae => ALT_INV_rgb_reg(1),
	dataf => \vga_sync_unit|ALT_INV_LessThan5~0_combout\,
	combout => \rgb~1_combout\);

-- Location: IOIBUF_X89_Y38_N4
\sw[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(2),
	o => \sw[2]~input_o\);

-- Location: FF_X88_Y37_N20
\rgb_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \sw[2]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(2));

-- Location: LABCELL_X88_Y37_N18
\rgb~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \rgb~2_combout\ = ( rgb_reg(2) & ( \vga_sync_unit|h_count_reg[7]~DUPLICATE_q\ & ( (!\vga_sync_unit|v_count_reg[9]~DUPLICATE_q\ & (!\vga_sync_unit|h_count_reg\(9) & !\vga_sync_unit|LessThan5~0_combout\)) ) ) ) # ( rgb_reg(2) & ( 
-- !\vga_sync_unit|h_count_reg[7]~DUPLICATE_q\ & ( (!\vga_sync_unit|v_count_reg[9]~DUPLICATE_q\ & (!\vga_sync_unit|LessThan5~0_combout\ & ((!\vga_sync_unit|h_count_reg\(9)) # (!\vga_sync_unit|h_count_reg\(8))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101000001000000000000000000000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_v_count_reg[9]~DUPLICATE_q\,
	datab => \vga_sync_unit|ALT_INV_h_count_reg\(9),
	datac => \vga_sync_unit|ALT_INV_LessThan5~0_combout\,
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(8),
	datae => ALT_INV_rgb_reg(2),
	dataf => \vga_sync_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\,
	combout => \rgb~2_combout\);

-- Location: LABCELL_X35_Y52_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


