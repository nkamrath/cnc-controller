----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/21/2017 09:24:36 AM
-- Design Name: 
-- Module Name: hdmi_interface - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity hdmi_interface is
Port ( 
    CLK : in STD_LOGIC;
    CLK_100            : in std_logic;
    RESET : in STD_LOGIC;
    DMA_TDATA : in STD_LOGIC_VECTOR(31 downto 0);
    DMA_TKEEP : in STD_LOGIC_VECTOR(3 downto 0);
    DMA_TLAST : in STD_LOGIC;
    DMA_TVALID : in STD_LOGIC;
    DMA_TREADY : out STD_LOGIC;
    LAST_DATA : out STD_LOGIC_VECTOR(31 downto 0);
    
    --hdmi specific signals
    hdmi_out_en  :       out std_logic;
    hdmi_tx_rscl  : out   std_logic;
    hdmi_tx_rsda  : inout std_logic;
    hdmi_tx_hpd   : in    std_logic;
    hdmi_tx_cec   : inout std_logic;
    
    hdmi_tx_clk_p : out std_logic;
    hdmi_tx_clk_n : out std_logic;
    hdmi_tx_p     : out std_logic_vector(2 downto 0);
    hdmi_tx_n     : out std_logic_vector(2 downto 0)
);
end hdmi_interface;

architecture Behavioral of hdmi_interface is

    signal local_reset : std_logic;
    signal temp_pixel : std_logic_vector(31 downto 0);
    signal pixel_data : std_logic_vector(31 downto 0);
    
    signal clk_dvi  : std_logic := '0';
    signal clk_dvin : std_logic := '0';
    
    signal clk_25 : std_logic;
    signal clk_25_z : std_logic;
    signal clk_vga  : std_logic := '0';
    signal clk_25_count : natural range 0 to 4;
    
    signal fifo_counter : natural range 0 to 64000;
    
    signal red     : std_logic_vector(7 downto 0) := (others => '0');
    signal green   : std_logic_vector(7 downto 0) := (others => '1');
    signal blue    : std_logic_vector(7 downto 0) := (others => '0');
    signal hsync   : std_logic := '0';
    signal vsync   : std_logic := '0';
    signal video_on   : std_logic := '0';
    signal red_s   : std_logic;
    signal green_s : std_logic;
    signal blue_s  : std_logic;
    signal clock_s : std_logic;
    signal pixel_taken : std_logic;
    signal fifo_valid : std_logic;
    signal fifo_add : std_logic;
    signal dma_tvalid_z : std_logic;
    signal dma_tvalid_rising : std_logic;
    signal dma_tdata_z : std_logic_vector(23 downto 0);
    signal dma_tkeep_z : std_logic_vector(3 downto 0);
    signal pixel_x:  std_logic_vector(9 downto 0);
    signal pixel_y:  std_logic_vector(9 downto 0);

begin

local_reset <= not RESET;

hdmi_out_en <= '1';

-- Generate clk for VGA
--   GEN25MHZ : entity work.modN(x)
--        generic map(N=>5)
--        port map(d=>CLK_100,reset=>'0',q=>clk_25);

update_clk_25: process(CLK_100)
begin
    if(rising_edge(CLK_100)) then
        if(local_reset = '1') then
            clk_25_count <= 0;
        else
            if(clk_25_count = 4) then
                clk_25_count <= 0;
                clk_25 <= '1';
            else
                clk_25_count <= clk_25_count + 1;
                clk_25 <= '0';
            end if;
        end if;
    end if;
end process;

--  hdmi_output_inst : entity work.hdmi_output
--        port map
--        (
--            CLK => clk_vga,
--            clk_p => clk_dvi,
--            clk_n => clk_dvin,
--            RESET => local_reset,
--            PIXEL => X"ABABABAB",
--            hdmi_tx_rscl => hdmi_tx_rscl,
--            hdmi_tx_rsda  => hdmi_tx_rsda,
--            hdmi_tx_hpd   => hdmi_tx_hpd,
--            hdmi_tx_cec   => hdmi_tx_cec,
--            hdmi_tx_clk_p => hdmi_tx_clk_p,
--            hdmi_tx_clk_n => hdmi_tx_clk_n,
--            hdmi_tx_p     => hdmi_tx_p,
--            hdmi_tx_n     => hdmi_tx_n
--        );
        
-- DVI-D module                         
            DVID : entity work.dvid(x)
                port map(
                  clk       => clk_dvi,
                  clk_n     => clk_dvin, 
                  clk_pixel => clk_vga,
                  red_p     => pixel_data(23 downto 16),
                  green_p   => pixel_data(15 downto 8),
                  blue_p    => pixel_data(7 downto 0),
                  video_on  => video_on,
                  hsync     => hsync,
                  vsync     => vsync,
                  
                  -- outputs to TMDS drivers
                  red_serial     => red_s,
                  green_serial   => green_s,
                  blue_serial    => blue_s,
                  clock_serial   => clock_s
                );
                
                
    frame_fifo : entity work.fifo Generic map(gFIFO_WIDTH=>24, gFIFO_LENGTH=>(640*40))
    port map(CLK => CLK_100, 
             RESET => local_reset, 
             DATA_IN => dma_tdata_z, 
             ADD_DATA => fifo_add,
             REMOVE_DATA => pixel_taken, 
             DATA_OUT => temp_pixel(23 downto 0),
             HAS_DATA => fifo_valid,
             SIZE => fifo_counter
             );
                
    OBUFDS_blue  : OBUFDS PORT MAP ( O  => hdmi_tx_p(0), OB => hdmi_tx_n(0), I  => blue_s  );
    OBUFDS_green   : OBUFDS PORT MAP ( O  => hdmi_tx_p(1), OB => hdmi_tx_n(1), I  => green_s );
    OBUFDS_red : OBUFDS PORT MAP ( O  => hdmi_tx_p(2), OB => hdmi_tx_n(2), I  => red_s);
    OBUFDS_clock : OBUFDS PORT MAP ( O  => hdmi_tx_clk_p, OB => hdmi_tx_clk_n, I  => clock_s );

update_fifo_add : process(CLK_100)
begin
    if(rising_edge(CLK_100)) then
        if(local_reset = '1') then
            fifo_add <= '0';
            dma_tdata_z <= (others => '0');
            dma_tkeep_z <= (others => '0');
        else
            --if(dma_tvalid_rising = '1' and DMA_TKEEP /= "0000" and fifo_counter < 6400) then
            if(dma_tvalid_rising = '1' and fifo_counter < 640*40) then
                fifo_add <= '1';
                dma_tdata_z <= DMA_TDATA(23 downto 0);
                dma_tkeep_z <= DMA_TKEEP;
            else
                dma_tdata_z <= "111111111111111111111111";
                fifo_add <= '0';
            end if;
        end if;
    end if;
end process;

update_dma_tvalid : process(CLK_100)
begin
    if(rising_edge(CLK_100)) then
        if(local_reset = '1') then
            dma_tvalid_z <= '0';
            dma_tvalid_rising <= '0';
        else
            dma_tvalid_z <= DMA_TVALID;
            if(dma_tvalid_z = '0' and DMA_TVALID = '1') then
                dma_tvalid_rising <= '1';
            else
                dma_tvalid_rising <= '0';
            end if;
        end if;
    end if;
end process;

update_last_data: process(CLK_100)
begin
    if(rising_edge(CLK_100)) then
        if(local_reset = '1') then
            LAST_DATA <= (others => '0');
        else
            --if(pixel_taken = '1') then
                LAST_DATA <= temp_pixel;
            --end if;
        end if;
    end if;
end process;

    -- VGA module     
    VGA : entity work.vga(x)
        port map(
            clk_125         => CLK_100,
            clk_25          => clk_vga,
            reset           => local_reset,
            hsync           => hsync,
            vsync           => vsync,
            video_off        => video_on, --NATE --edited here possibly need to change video off to invert or something (off => on probably doesn't work)
            red             => red,
            green           => green,
            blue            => blue,
            pixel_x         => pixel_x,
            pixel_y         => pixel_y
        );
      
    clk_dvi  <= CLK_100;        -- DVI clk (pos)
    clk_dvin <= not CLK_100;    -- DVI clk (neg)
    clk_vga  <= clk_25;         -- VGA clk

update_pixel_taken: process(CLK_100, clk_25)
begin
    if(rising_edge(clk_25)) then
        if(local_reset = '1') then
            pixel_taken <= '0';
            clk_25_z <= '0';
        else
            clk_25_z <= clk_25;
            --if(clk_25 = '1' and clk_25_z = '0') then
                if(unsigned(pixel_x) >= 16 and unsigned(pixel_x) < 656 and unsigned(pixel_y) >= 10 and unsigned(pixel_y) < 490) then
                    pixel_taken <= '1';-- and video_on;
                    pixel_data <= temp_pixel;
--                    if(unsigned(pixel_x) < 320) then
--                        if((unsigned(pixel_y)) < 240) then
--                            pixel_data <= "00000000111111110000000000000000";
--                        elsif((unsigned(pixel_y)) < 480) then
--                            pixel_data <= "00000000000000000000000011111111";
--                        else
--                            pixel_data <= "11111111111111111111111111111111";
--                        end if;
--                    else
--                        pixel_data <= "00000000000000001111111100000000";
--                    end if;
                else
                    pixel_taken <= '0';
                    pixel_data <= (others => '0');
                end if;
            --else
            --    pixel_taken <= '0';
            --end if;
        end if;
    end if;
end process;

--update_fifo_counter: process(CLK_100)
--begin
--    if(rising_edge(CLK_100)) then
--        if(local_reset = '1') then
--            fifo_counter <= 0;
--        else
--            if(pixel_taken = '1' and fifo_add = '0' and fifo_counter > 0) then
--                fifo_counter <= fifo_counter - 1;
--            elsif(pixel_taken = '0' and fifo_add = '1' and fifo_counter < 640) then
--                fifo_counter <= fifo_counter + 1;
--            end if;
--        end if;
--    end if;
--end process;

update_tready: process(CLK_100)
begin
    if(rising_edge(CLK_100)) then
        if(local_reset = '1') then
            DMA_TREADY <= '0';
        else
            if(fifo_counter < 640*20) then
                DMA_TREADY <= '1';
            else
                DMA_TREADY <= '0';
            end if;
        end if;
    end if;
end process;

--DMA_TREADY <= '1';

end Behavioral;
