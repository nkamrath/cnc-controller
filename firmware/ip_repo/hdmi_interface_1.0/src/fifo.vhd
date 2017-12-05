----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:26:41 05/03/2015 
-- Design Name: 
-- Module Name:    fifo - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fifo is
generic
(
  gFIFO_WIDTH      : natural := 8;  -- data width of one more than actual data.  1 in lsb signfies continuation of packet, 0 means last byte of a packet
  gFIFO_LENGTH     : natural := 100
  
);
port
(
  CLK          : in  std_logic;
  RESET        : in  std_logic;
  DATA_IN      : in  std_logic_vector((gFIFO_WIDTH - 1) downto 0);
  ADD_DATA     : in  std_logic;
  REMOVE_DATA  : in  std_logic;
  DATA_OUT     : out std_logic_vector((gFIFO_WIDTH - 1) downto 0);
  HAS_DATA     : out std_logic;
  SIZE         : out natural range 0 to (gFIFO_LENGTH - 1)
);
end fifo;

architecture rtl of fifo is
  type fifo_t is ARRAY(natural range 0 to (gFIFO_LENGTH - 1)) of std_logic_vector((gFIFO_WIDTH - 1) downto 0);
  
  signal fifo       : fifo_t;
  signal size_t     : natural range 0 to (gFIFO_LENGTH);
  signal next_out   : natural range 0 to (gFIFO_LENGTH - 1);
  signal next_empty : natural range 0 to (gFIFO_LENGTH - 1);
  
  --below is to force use of ram style.  "block" or "distributed" as options ("auto" also)
  attribute ram_style: string;
  attribute ram_style of fifo : signal is "block";
  
begin

update_size_t: process(CLK)
begin
  if(rising_edge(CLK)) then
    if(RESET = '1') then
	   size_t <= 0;
	 else
	   if(ADD_DATA = '1' and REMOVE_DATA = '0' and size_t < (gFIFO_LENGTH - 1)) then
		  size_t <= size_t + 1;
		elsif(ADD_DATA = '0' and REMOVE_DATA = '1' and size_t > 0) then
		  size_t <= size_t - 1;
		end if;
	 end if;
  end if;
end process;

update_data: process(CLK)
begin
  if(rising_edge(CLK)) then
    if(RESET = '1') then
	 
	 else
	   if(ADD_DATA = '1') then
		  fifo(next_empty) <= DATA_IN;
		end if;
	   DATA_OUT <= fifo(next_out);
	 end if;
  end if;
end process;

update_next_empty: process(CLK)
begin
  if(rising_edge(CLK)) then
    if(RESET = '1') then
	   next_empty <= 0;
	 else
	   if(ADD_DATA = '1' and size_t < (gFIFO_LENGTH - 1)) then
		  if(next_empty = (gFIFO_LENGTH - 1)) then
		    next_empty <= 0;
		  else
		    next_empty <= next_empty + 1;
		  end if;
		end if;
	 end if;
  end if;
end process update_next_empty;

update_next_out: process(CLK)
begin
  if(rising_edge(CLK)) then
    if(RESET = '1') then
	   next_out <= 0;
	 else
	   if(REMOVE_DATA = '1' and size_t > 0) then
		  if(next_out = (gFIFO_LENGTH - 1)) then
		    next_out <= 0;
		  else
		    next_out <= next_out + 1;
		  end if;
		end if;
--		if(ADD_DATA = '1' and size_t = (gFIFO_LENGTH - 1)) then -- if we are at capacity, overwrite oldest by updating next out and next empty
--		  if(next_out = (gFIFO_LENGTH - 1)) then
--		    next_out <= 0;
--		  else
--		    next_out <= next_out + 1;
--		  end if;
--		end if;
	 end if;
  end if;
end process update_next_out;

update_has_data: process(CLK)
begin
  if(rising_edge(CLK)) then
    if(RESET = '1') then
	   HAS_DATA <= '0';
	 else
	   if(size_t > 0) then
		  HAS_DATA <= '1';
		else
		  HAS_DATA <= '0';
		end if;
	 end if;
  end if;
end process;

update_size: process(CLK)
begin
    if(rising_edge(CLK)) then
        if(RESET = '1') then
            SIZE <= 0; 
        else
            SIZE <= size_t;
        end if;
    end if;
end process;

end rtl;

