library ieee;
library unisim;
use ieee.std_logic_1164.all;
use unisim.vcomponents.all;

entity dvid is
    Port ( clk          : in  std_logic;
           clk_n        : in  std_logic;
           clk_pixel    : in  std_logic;
           red_p        : in  std_logic_vector(7 downto 0);
           green_p      : in  std_logic_vector(7 downto 0);
           blue_p       : in  std_logic_vector(7 downto 0);
           video_on     : in  std_logic;
           hsync        : in  std_logic;
           vsync        : in  std_logic;
           red_serial   : out std_logic;
           green_serial : out std_logic;
           blue_serial  : out std_logic;
           clock_serial : out std_logic);
end dvid;

architecture x of dvid is

   signal encoded_red, encoded_green, encoded_blue : std_logic_vector(9 downto 0);
   signal shift_red,   shift_green,   shift_blue   : std_logic_vector(9 downto 0) := (others => '0');
   signal shift_clock   : std_logic_vector(9 downto 0) := "0000011111";
      
   constant c_red       : std_logic_vector(1 downto 0) := (others => '0');  -- "00"
   constant c_green     : std_logic_vector(1 downto 0) := (others => '0');  -- "00"
   signal   c_blue      : std_logic_vector(1 downto 0);                     -- variable based on vsync and hsync

begin   
   c_blue <= vsync & hsync;
   
   -- implement TDMS Algorithms for all d_in channels (red, green, blue)
   TMDS_encoder_RED     :  entity work.TMDS_encoder(x) PORT MAP(clk => clk_pixel, d_in => red_p,   c => c_red,   video_on => video_on, encoded => encoded_red);
   TMDS_encoder_BLUE    :  entity work.TMDS_encoder(x) PORT MAP(clk => clk_pixel, d_in => blue_p,  c => c_blue,  video_on => video_on, encoded => encoded_blue);
   TMDS_encoder_GREEN   :  entity work.TMDS_encoder(x) PORT MAP(clk => clk_pixel, d_in => green_p, c => c_green, video_on => video_on, encoded => encoded_green);

   -- Output at DOUBLE RATE (updated by clock at 125MHz, typically)
   ODDR2_RED    : ODDR2 generic map( DDR_ALIGNMENT => "C0", INIT => '0', SRTYPE => "ASYNC") 
      port map 
      (
        D0 => shift_red(0), 
        D1 => shift_red(1), 
        C0 => clk, 
        C1 => clk_n, 
        CE => '1', 
        R => '0', 
        S => '0', 
        Q => red_serial
      );
   ODDR2_GREEN  : ODDR2 generic map( DDR_ALIGNMENT => "C0", INIT => '0', SRTYPE => "ASYNC") 
      port map 
      (
        D0 => shift_green(0), 
        D1 => shift_green(1), 
        C0 => clk, 
        C1 => clk_n, 
        CE => '1', 
        R => '0', 
        S => '0', 
        Q => green_serial
      );
   ODDR2_BLUE   : ODDR2 generic map( DDR_ALIGNMENT => "C0", INIT => '0', SRTYPE => "ASYNC") 
      port map 
      (
        D0 => shift_blue(0), 
        D1 => shift_blue(1),  
        C0 => clk, 
        C1 => clk_n, 
        CE => '1', 
        R => '0', 
        S => '0', 
        Q => blue_serial
      );
   ODDR2_CLK    : ODDR2 generic map( DDR_ALIGNMENT => "C0", INIT => '0', SRTYPE => "ASYNC") 
      port map 
      (
        D0 => shift_clock(0), 
        D1 => shift_clock(1), 
        C0 => clk, C1 => clk_n, 
        CE => '1',
        R => '0', 
        S => '0', 
        Q => clock_serial
      );

   feed_data: process(clk)
   begin
      if rising_edge(clk) then 
         if shift_clock = "0000011111" then     -- occurs at rate of 25MHz
            shift_red   <= encoded_red;
            shift_green <= encoded_green;
            shift_blue  <= encoded_blue;
         else
            -- shift last two bits outs
            shift_red   <= "00" & shift_red  (9 downto 2);
            shift_green <= "00" & shift_green(9 downto 2);
            shift_blue  <= "00" & shift_blue (9 downto 2); 
         end if;
         shift_clock <= shift_clock(1 downto 0) & shift_clock(9 downto 2);  -- clk (div by 5) ROTATE RIGHT
      end if;
   end process feed_data;
   
end x;