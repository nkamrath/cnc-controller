----------------------------------------------------------------------------------
-- Company:     DBRSS
-- Engineer:    Daniel Barcklow
-- Module:      Generate Bits for program
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vga is
    port(
        clk_125:    in std_logic;
        clk_25:     in std_logic;
        reset:      in std_logic;
        hsync:      out std_logic;
        vsync:      out std_logic;
        video_off:  out std_logic;
        red:        out std_logic_vector(7 downto 0);
        green:      out std_logic_vector(7 downto 0);
        blue:       out std_logic_vector(7 downto 0);
        pixel_x:  out std_logic_vector(9 downto 0);
        pixel_y:  out std_logic_vector(9 downto 0)
    );
end vga;

architecture x of vga is

    signal p_tick:   std_logic;
    signal v_on_sig: std_logic;
    signal rgb_z:    std_logic_vector(23 downto 0);
    --signal green_z:  std_logic_vector(7 downto 0);
    --signal blue_z:   std_logic_vector(7 downto 0);
    
    signal cgl_block_read_address : natural;
    signal cgl_get_block : std_logic;
    signal cgl_done : std_logic;
    signal cgl_valid : std_logic;
    signal cgl_data_out : std_logic_vector(31 downto 0);
    
begin

    --red <= (others => '1') when v_on_sig = '1' else (others => '0');
    --green <= (others => '0') when v_on_sig = '1' else (others => '0');
    --blue <= (others => '1') when v_on_sig = '1' else (others => '0');
    
    red <= rgb_z(23 downto 16);
    green <= rgb_z(15 downto 8);
    blue <= rgb_z(7 downto 0);
        
    VGA_pg: entity work.vga_sync(arch)
        port map(
            clk_25      => clk_25,
            reset       => reset,
            hsync       => hsync,
            vsync       => vsync,
            video_on    => v_on_sig,
            p_tick      => p_tick,
            pixel_x     => pixel_x,
            pixel_y     => pixel_y
        );
        
    video_off <= v_on_sig;-- NATE edited from : not v_on_sig;

end x;