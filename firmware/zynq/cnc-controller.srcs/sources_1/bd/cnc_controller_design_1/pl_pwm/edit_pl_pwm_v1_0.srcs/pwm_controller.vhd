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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm_controller is
Generic
(
    gNUM_CHANNELS                   : natural := 8;
    gREGISTER_BIT_WIDTH             : natural := 32;
    gCONTROL_REGISTER_BIT_WIDTH     : natural := 4
);
Port 
(
    --inputs
    CLK                   : in std_logic;
    RESET                 : in std_logic;
    CONTROL               : in std_logic_vector((gREGISTER_BIT_WIDTH-1) downto 0);
    CLOCK_CONFIGURATION   : in std_logic_vector((gREGISTER_BIT_WIDTH-1) downto 0);
    PERIODS               : in std_logic_vector(((gREGISTER_BIT_WIDTH*gNUM_CHANNELS)-1) downto 0);
    DUTY_CYCLES           : in std_logic_vector(((gREGISTER_BIT_WIDTH*gNUM_CHANNELS)-1) downto 0);
    CYCLE_COUNTERS        : in std_logic_vector(((gREGISTER_BIT_WIDTH*gNUM_CHANNELS)-1) downto 0);
    
    --outputs
    STATUS_REGISTERS      : out std_logic_vector(((gREGISTER_BIT_WIDTH*gNUM_CHANNELS)-1) downto 0);
    PWM_OUT               : out std_logic_vector((gNUM_CHANNELS-1) downto 0)
);
end pwm_controller;

architecture Behavioral of pwm_controller is
    component pwm_channel
    port
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
    end component;
    
    signal local_reset : std_logic; 
    
begin

local_reset <= not RESET;

gen_1: for i in 1 to 8 generate
    pwm_channel_i: pwm_channel port map
    (
        CLK => CLK,
        RESET => local_reset,
        CONTROL => CONTROL(((gCONTROL_REGISTER_BIT_WIDTH*i)-1) downto (gCONTROL_REGISTER_BIT_WIDTH*(i-1))),
        CLOCK_CONFIGURATION => CLOCK_CONFIGURATION,
        PERIOD => PERIODS(((gREGISTER_BIT_WIDTH*i)-1) downto (gREGISTER_BIT_WIDTH*(i-1))),
        DUTY_CYCLE => DUTY_CYCLES(((gREGISTER_BIT_WIDTH*i)-1) downto (gREGISTER_BIT_WIDTH*(i-1))),
        CYCLE_COUNTER => CYCLE_COUNTERS(((gREGISTER_BIT_WIDTH*i)-1) downto (gREGISTER_BIT_WIDTH*(i-1))),
        STATUS_REGISTERS => STATUS_REGISTERS(((gREGISTER_BIT_WIDTH*i)-1) downto (gREGISTER_BIT_WIDTH*(i-1))),
        PWM_OUT => PWM_OUT(i-1)
    );
end generate;

--pwm_channel_1: pwm_channel port map
--(
--    CLK => CLK,
--    RESET => local_reset,
--    CONTROL => CONTROL((gCONTROL_REGISTER_BIT_WIDTH-1) downto 0),
--    CLOCK_CONFIGURATION => CLOCK_CONFIGURATION,
--    PERIOD => PERIODS(31 downto 0),
--    DUTY_CYCLE => DUTY_CYCLES(31 downto 0),
--    CYCLE_COUNTER => CYCLE_COUNTERS(31 downto 0),
--    STATUS_REGISTERS => STATUS_REGISTERS(31 downto 0),
--    PWM_OUT => PWM_OUT(0)
--);

--pwm_channel_2: pwm_channel port map
--(
--    CLK => CLK,
--    RESET => local_reset,
--    CONTROL => CONTROL(((gCONTROL_REGISTER_BIT_WIDTH*2)-1) downto 4),
--    CLOCK_CONFIGURATION => CLOCK_CONFIGURATION,
--    PERIOD => PERIODS(63 downto 32),
--    DUTY_CYCLE => DUTY_CYCLES(63 downto 32),
--    CYCLE_COUNTER => CYCLE_COUNTERS(63 downto 32),
--    STATUS_REGISTERS => STATUS_REGISTERS(63 downto 32),
--    PWM_OUT => PWM_OUT(1)
--);

--pwm_channel_3: pwm_channel port map
--(
--    CLK => CLK,
--    RESET => local_reset,
--    CONTROL => CONTROL(((gCONTROL_REGISTER_BIT_WIDTH*3)-1) downto 8),
--    CLOCK_CONFIGURATION => CLOCK_CONFIGURATION,
--    PERIOD => PERIODS(95 downto 64),
--    DUTY_CYCLE => DUTY_CYCLES(95 downto 64),
--    CYCLE_COUNTER => CYCLE_COUNTERS(95 downto 64),
--    STATUS_REGISTERS => STATUS_REGISTERS(95 downto 64),
--    PWM_OUT => PWM_OUT(2)
--);


end Behavioral;
