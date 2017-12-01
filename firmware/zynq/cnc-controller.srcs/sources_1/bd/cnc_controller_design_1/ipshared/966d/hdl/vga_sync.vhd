library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity vga_sync is
   port(
      clk_25:   in std_logic;
      reset:    in std_logic;
      hsync:    out std_logic :='0';
      vsync:    out std_logic :='0';
      video_on: out std_logic :='0';
      p_tick:   out std_logic :='0';
      pixel_x:  out std_logic_vector(9 downto 0);
      pixel_y:  out std_logic_vector(9 downto 0));
end vga_sync;

architecture arch of vga_sync is
   -- VGA 640-by-480 sync parameters
   constant HD: integer:=640; --horizontal display area
   constant HF: integer:=16 ; --h. front porch
   constant HB: integer:=48 ; --h. back porch
   constant HR: integer:=96 ; --h. retrace
   constant VD: integer:=480; --vertical display area
   constant VF: integer:=10;  --v. front porch
   constant VB: integer:=33;  --v. back porch
   constant VR: integer:=2;   --v. retrace
      
   -- sync counters
   signal v_count_reg, v_count_next: std_logic_vector(9 downto 0);
   signal h_count_reg, h_count_next: std_logic_vector(9 downto 0);
   
   -- output buffer
   signal v_sync_reg, h_sync_reg: std_logic;
   signal v_sync_next, h_sync_next: std_logic;
   
   -- status signal
   signal h_end, v_end, pixel_tick: std_logic;
     
begin
   pixel_tick <= clk_25;

   -- registers
   process (clk_25,reset)
   begin
      if reset='1' then
         v_count_reg <= (others=>'0');
         h_count_reg <= (others=>'0');
         v_sync_reg <= '1';
         h_sync_reg <= '1';
      elsif (rising_edge(clk_25)) then
         v_count_reg <= v_count_next;
         h_count_reg <= h_count_next;
         v_sync_reg <= v_sync_next;
         h_sync_reg <= h_sync_next;
         
         --if((h_count_reg<HD+HF) and (h_count_reg>=(HF)) and (v_count_reg<VD+VF) and (v_count_reg>=(VF))) then
         if((h_count_reg<HD) and (v_count_reg<VD)) then
            video_on <= '1';
         else
            video_on <= '0';
         end if;
         -- video on/off
         --video_on <=
           -- '1' when (h_count_reg<HD+HF) and (h_count_reg>=(HF)) and (v_count_reg<VD+VF) and (v_count_reg>=(VF)) else
            --'0';
      end if;
   end process;
      
   -- status
   h_end <=  -- end of horizontal counter
      '1' when h_count_reg=(HD+HF+HB+HR-1) else --799
      '0';
      
   v_end <=  -- end of vertical counter
      '1' when v_count_reg=(VD+VF+VB+VR-1) else --524
      '0';
      
   -- mod-800 horizontal sync counter
   process (h_count_reg,h_end)
   begin
         h_count_next <= h_count_reg;
         if h_end='1' then
            h_count_next <= (others=>'0');
         else
            h_count_next <= h_count_reg + 1;
         end if;
   end process;
   
   -- mod-525 vertical sync counter
   process (v_count_reg,h_end,v_end)
   begin
      if h_end='1' then
         if (v_end='1') then
            v_count_next <= (others=>'0');
         else
            v_count_next <= v_count_reg + 1;
         end if;
      else
         v_count_next <= v_count_reg;
      end if;
   end process;
   
   -- horizontal and vertical sync, buffered to avoid glitch
   h_sync_next <=
      '1' when (h_count_reg>=(HD+HF))           --656
           and (h_count_reg<=(HD+HF+HR-1)) else --751
      '0';
   v_sync_next <=
      '1' when (v_count_reg>=(VD+VF))           --490
           and (v_count_reg<=(VD+VF+VR-1)) else --491
      '0';
   
   -- output signal
   hsync <= h_sync_reg;
   vsync <= v_sync_reg;
   pixel_x <= std_logic_vector(h_count_reg);
   pixel_y <= std_logic_vector(v_count_reg);
   p_tick <= pixel_tick;
end arch;