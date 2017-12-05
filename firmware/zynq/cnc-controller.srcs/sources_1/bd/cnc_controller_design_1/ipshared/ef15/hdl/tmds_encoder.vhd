library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity TMDS_encoder is
    Port ( clk      : in  std_logic;
           d_in     : in  std_logic_vector(7 downto 0);     -- 8 bit d_in to be encoded
           C        : in  std_logic_vector(1 downto 0);     -- control bits (2)
           video_on : in  std_logic;                        -- BLANKING, is video on?
           encoded  : out  std_logic_vector(9 downto 0));   -- output encoded
end TMDS_encoder;

architecture x of TMDS_encoder is
   signal xored  : std_logic_vector(8 downto 0);
   signal xnored : std_logic_vector(8 downto 0);
   
   signal ones                : std_logic_vector(3 downto 0);
   signal q_m           : std_logic_vector(8 downto 0);
   signal q_m_inv       : std_logic_vector(8 downto 0);
   signal data_word_disparity : std_logic_vector(3 downto 0);
   signal dc_bias             : std_logic_vector(3 downto 0) := (others => '0');
begin
   -- Perform FALSE<1> computations
   xored(0) <= d_in(0);
   xored(1) <= d_in(1) xor xored(0);
   xored(2) <= d_in(2) xor xored(1);
   xored(3) <= d_in(3) xor xored(2);
   xored(4) <= d_in(4) xor xored(3);
   xored(5) <= d_in(5) xor xored(4);
   xored(6) <= d_in(6) xor xored(5);
   xored(7) <= d_in(7) xor xored(6);
   xored(8) <= '1';

   -- Perform TRUE<1> computations
   xnored(0) <= d_in(0);
   xnored(1) <= d_in(1) xnor xnored(0);
   xnored(2) <= d_in(2) xnor xnored(1);
   xnored(3) <= d_in(3) xnor xnored(2);
   xnored(4) <= d_in(4) xnor xnored(3);
   xnored(5) <= d_in(5) xnor xnored(4);
   xnored(6) <= d_in(6) xnor xnored(5);
   xnored(7) <= d_in(7) xnor xnored(6);
   xnored(8) <= '0';
   
   -- count all 1's by adding them (0 won't contribute)
   ones <= "0000" + d_in(0) + d_in(1) + d_in(2) + d_in(3)
                  + d_in(4) + d_in(5) + d_in(6) + d_in(7);
 
   -- decide on encoding
   decision0: process(ones, d_in(0), xnored, xored)
   begin
      -- FIRST CHOICE DIAMOND (https://www.eewiki.net/pages/viewpage.action?pageId=36569119) <1>
      if ones > 4 or (ones = 4 and d_in(0) = '0') then
         q_m     <= xnored;
         q_m_inv <= NOT(xnored);
      else
         q_m     <= xored;
         q_m_inv <= NOT(xored);
      end if;
   end process decision0;                                          

   -- Work out the DC bias of the dataword;
   data_word_disparity  <= "1100" + q_m(0) + q_m(1) + q_m(2) + q_m(3) 
                                    + q_m(4) + q_m(5) + q_m(6) + q_m(7);
   
   -- Now work out what the output should be
   process(clk)
   begin
      -- "DISPLAY ENABLE = 1"
      if rising_edge(clk) then
         if video_on = '0' then 
            -- In the control periods, all values have and have balanced bit count
            case C is            
               when "00"   => encoded <= "1101010100";
               when "01"   => encoded <= "0010101011";
               when "10"   => encoded <= "0101010100";
               when others => encoded <= "1010101011";
            end case;
            dc_bias <= (others => '0');
         else
            -- Ones#(d) = 4 OR disparity = 0
            if dc_bias = "00000" or data_word_disparity = 0 then
               -- dataword has no disparity
               if q_m(8) = '0' then
                  encoded <= "10" & q_m_inv(7 downto 0);
                  dc_bias <= dc_bias - data_word_disparity;
               else
                  encoded <= "01" & q_m(7 downto 0);
                  dc_bias <= dc_bias + data_word_disparity;
               end if;
            elsif (dc_bias(3) = '0' and data_word_disparity(3) = '0') or 
                  (dc_bias(3) = '1' and data_word_disparity(3) = '1') then
               encoded <= '1' & q_m(8) & q_m_inv(7 downto 0);
               dc_bias <= dc_bias + q_m(8) - data_word_disparity;
            else
               encoded <= '0' & q_m;
               dc_bias <= dc_bias - q_m_inv(8) + data_word_disparity;
            end if;
         end if;
      end if;
   end process;      
end x;