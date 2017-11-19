----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/29/2017 04:06:47 PM
-- Design Name: 
-- Module Name: pl_gpio_controller - Behavioral
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

entity pl_gpio_controller is
Generic
(
    gNUM_PINS           : natural := 32;
    gREGISTER_WIDTH     : natural := 32
);
Port 
(
    --inputs
    CLK                             : in std_logic;
    RESET                           : in std_logic;
    CONTROL                         : in std_logic_vector((gREGISTER_WIDTH-1) downto 0);
    DIRECTION                       : in std_logic_vector((gREGISTER_WIDTH-1) downto 0);
    OUTPUT_VALUES                   : in std_logic_vector((gREGISTER_WIDTH-1) downto 0);
    INTERRUPT_ENABLE                : in std_logic_vector((gREGISTER_WIDTH-1) downto 0);
    INTERRUPT_FALLING               : in std_logic_vector((gREGISTER_WIDTH-1) downto 0);
    INTERRUPT_RISING                : in std_logic_vector((gREGISTER_WIDTH-1) downto 0);
    
    --inouts
    GPIO_PINS                       : inout std_logic_vector((gNUM_PINS-1) downto 0);
    
    --outputs
    INPUT_VALUES                    : out std_logic_vector((gREGISTER_WIDTH-1) downto 0);
    INTERRUPT_STATUS                : out std_logic_vector((gREGISTER_WIDTH-1) downto 0);
    INTERRUPT_OUT                   : out std_logic
);
end pl_gpio_controller;

architecture Behavioral of pl_gpio_controller is

    signal local_reset      : std_logic;
    
    signal gpio_m           : std_logic_vector((gNUM_PINS-1) downto 0);
    signal gpio_z           : std_logic_vector((gNUM_PINS-1) downto 0);
    signal gpio_2z          : std_logic_vector((gNUM_PINS-1) downto 0);

begin

local_reset <= not RESET;

update_pins: process(CLK, CONTROL, DIRECTION, GPIO_PINS)
begin
    for I in 0 to (gNUM_PINS-1) loop
        if(CONTROL(I) = '1' and DIRECTION(I) = '1') then
            GPIO_PINS(I) <= OUTPUT_VALUES(I);
        else
            GPIO_PINS(I) <= 'Z';
        end if;
        --INPUT_VALUES(I) <= GPIO_PINS(I);
    end loop;
end process;

update_inputs: process(CLK)
begin
    if(rising_edge(CLK)) then
        if(local_reset = '1') then
            gpio_z <= (others=> '0');
            gpio_2z <= (others=> '0');
        else
            for I in 0 to (gNUM_PINS-1) loop
                gpio_m(I) <= GPIO_PINS(I);
                INPUT_VALUES(I) <= gpio_z(I);
            end loop;
            gpio_2z <= gpio_z;
            gpio_z <= gpio_m;
        end if;
    end if;
end process;

update_interrupt: process(CLK)
begin
    if(rising_edge(CLK)) then
        if(local_reset = '1') then
            INTERRUPT_OUT <= '0';
            INTERRUPT_STATUS <= (others => '0');
        else
            INTERRUPT_OUT <= '0';
            for I in 0 to (gNUM_PINS-1) loop
                if(INTERRUPT_ENABLE(I) = '1') then
                    if(INTERRUPT_FALLING(I) = '1' and gpio_2z(I) = '1' and gpio_z(I) = '0') then
                        INTERRUPT_OUT <= '1';
                        INTERRUPT_STATUS(I) <= '1';
                    elsif(INTERRUPT_RISING(I) = '1' and gpio_2z(I) = '0' and gpio_z(I) = '1') then
                        INTERRUPT_OUT <= '1';
                        INTERRUPT_STATUS(I) <= '1';
                    else
                        INTERRUPT_STATUS(I) <= '0';
                    end if;
                else
                    INTERRUPT_STATUS(I) <= '0';
                end if;
            end loop;
        end if;
    end if;
end process;

end Behavioral;
