----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2017 07:42:25 AM
-- Design Name: 
-- Module Name: interrupt_manager - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity interrupt_manager is
Generic
(
    gNUM_INTERRUPTS_IN      : natural := 32
);
Port
(
    --inputs
    CLK                             : in std_logic;
    RESET                           : in std_logic;
    INTERRUPTS_IN                   : in std_logic_vector((gNUM_INTERRUPTS_IN-1) downto 0);
    
    --outputs
    INTERRUPT_OUT                   : out std_logic
);
end interrupt_manager;

architecture Behavioral of interrupt_manager is
    signal local_reset              : std_logic;
begin

local_reset <= not RESET;

update_output: process(CLK)
begin
    if(rising_edge(CLK)) then
        if(local_reset = '0') then
            INTERRUPT_OUT <= '0';
        else
            for I in 0 to (gNUM_INTERRUPTS_IN-1) loop
                if(INTERRUPTS_IN(I) = '1') then
                    
                end if;
            end loop;
        end if;
    end if;
end process;

end Behavioral;
