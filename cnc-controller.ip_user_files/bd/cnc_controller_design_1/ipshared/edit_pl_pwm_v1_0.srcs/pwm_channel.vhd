----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/14/2017 07:37:35 AM
-- Design Name: 
-- Module Name: pwm_channel - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm_channel is
Generic
(
    gREGISTER_BIT_WIDTH             : natural := 32;
    gMAX_CYCLE_COUNTER              : natural := 100000000;
    gMAX_CLOCK_DIVIDER              : natural := 100000000;
    
    --control register definitions
    gCONTROL_REGISTER_BIT_WIDTH     : natural := 4;
    gENABLE_BIT_INDEX               : natural := 0;
    gINTERRUPT_ENABLE_BIT_INDEX     : natural := 1;
    gIDLE_LEVEL_BIT_INDEX           : natural := 2;
    gRELOAD_BIT_INDEX               : natural := 3
);
Port 
(
    --inputs
    CLK                   : in std_logic;
    RESET                 : in std_logic;
    CONTROL               : in std_logic_vector((gCONTROL_REGISTER_BIT_WIDTH-1) downto 0);
    CLOCK_CONFIGURATION   : in std_logic_vector((gREGISTER_BIT_WIDTH-1) downto 0);
    PERIOD                : in std_logic_vector((gREGISTER_BIT_WIDTH-1) downto 0);
    DUTY_CYCLE            : in std_logic_vector((gREGISTER_BIT_WIDTH-1) downto 0);
    CYCLE_COUNTER         : in std_logic_vector((gREGISTER_BIT_WIDTH-1) downto 0);
    
    --outputs
    STATUS_REGISTERS      : out std_logic_vector((gREGISTER_BIT_WIDTH-1) downto 0);
    PWM_OUT               : out std_logic
);
end pwm_channel;
architecture Behavioral of pwm_channel is

    signal enabled              : std_logic;
    signal cycles_remaining     : natural range 0 to ((gMAX_CYCLE_COUNTER-1));
    signal clk_counter          : natural range 0 to ((gMAX_CLOCK_DIVIDER-1));
    signal done                 : std_logic;

begin

update_enabled: process(CLK, CONTROL)
begin
    if(rising_edge(CLK)) then
        if(RESET = '1') then
            enabled <= '0';
        else
            enabled <= CONTROL(gENABLE_BIT_INDEX);
        end if;
    end if;
end process;

update_clk_counter: process(CLK)
begin
    if(rising_edge(CLK)) then
        if(RESET = '1') then
            clk_counter <= 0;
        elsif(enabled = '1' and cycles_remaining > 0) then
            if(clk_counter = (to_integer(unsigned(PERIOD)) - 1)) then
                clk_counter <= 0;
            else
                clk_counter <= clk_counter + 1;
            end if;
        end if;
    end if;
end process;

update_cycles_remaining: process(CLK)
begin
    if(rising_edge(CLK)) then
        if(RESET = '1') then
            cycles_remaining <= 0;
        elsif(enabled = '1' and cycles_remaining = 0 and CONTROL(gRELOAD_BIT_INDEX) = '1') then
            cycles_remaining <= (to_integer(unsigned(CYCLE_COUNTER)));
        elsif(enabled = '1' and cycles_remaining /= 0 and clk_counter = (to_integer(unsigned(PERIOD)) - 1)) then
            cycles_remaining <= cycles_remaining - 1;
        elsif(enabled = '0') then
            cycles_remaining <= (to_integer(unsigned(CYCLE_COUNTER)));
        end if;
            
    end if;
end process;

update_done: process(CLK)
begin
    if(rising_edge(CLK)) then
        if(RESET = '1') then
            done <= '0';
        else
            if(cycles_remaining = 1 and clk_counter = (to_integer(unsigned(PERIOD)) - 1)) then
                done <= '1';
            else
                done <= '0';
            end if;
        end if;
    end if;
end process;

update_pwm_out: process(CLK)
begin
    if(rising_edge(CLK)) then
        if(RESET = '1') then
            PWM_OUT <= '0';
        else 
            if(enabled = '1' and clk_counter = 0 and cycles_remaining /= 0) then
                PWM_OUT <= not CONTROL(gIDLE_LEVEL_BIT_INDEX);
            elsif(enabled = '1' and clk_counter = (to_integer(unsigned(DUTY_CYCLE)) - 1)) then
                PWM_OUT <= CONTROL(gIDLE_LEVEL_BIT_INDEX);
            end if;
        end if;
    end if;
end process;

end Behavioral;
