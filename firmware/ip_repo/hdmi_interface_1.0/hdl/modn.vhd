----------------------------------------------------------------------------------
-- Company:     DBRSS
-- Engineer:    Daniel Barcklow
-- Module:      MOD-N module
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity modN is
    generic(N : integer := 5);
    port(   d           : in std_logic;               
            reset       : in std_logic;
            q           : out std_logic);
end modN;

architecture x of modN is
    signal reg_out : unsigned(9 downto 0);
    signal q_sig   : std_logic; 
begin

    modN : process(d,reset)
    begin
        if(reset = '1' or q_sig = '1') then
            reg_out <= (others => '0');
        elsif(rising_edge(d)) then
            reg_out <= reg_out + 1;
        end if;
    end process modN;

    q_sig   <= '1' when reg_out = to_unsigned(N,10) else '0';
    q       <= q_sig;
    
end x;