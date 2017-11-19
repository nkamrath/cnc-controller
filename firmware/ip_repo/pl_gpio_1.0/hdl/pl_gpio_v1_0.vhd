library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pl_gpio_v1_0 is
	generic (
		-- Users to add parameters here
        C_number_pins           : integer   := 8;
		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface pl_gpio
		C_pl_gpio_DATA_WIDTH	: integer	:= 32;
		C_pl_gpio_ADDR_WIDTH	: integer	:= 6
	);
	port (
		-- Users to add ports here
        gpio_pins       : inout std_logic_vector((C_number_pins-1) downto 0);
        interrupt_out   : out   std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface pl_gpio
		pl_gpio_aclk	: in std_logic;
		pl_gpio_aresetn	: in std_logic;
		pl_gpio_awaddr	: in std_logic_vector(C_pl_gpio_ADDR_WIDTH-1 downto 0);
		pl_gpio_awprot	: in std_logic_vector(2 downto 0);
		pl_gpio_awvalid	: in std_logic;
		pl_gpio_awready	: out std_logic;
		pl_gpio_wdata	: in std_logic_vector(C_pl_gpio_DATA_WIDTH-1 downto 0);
		pl_gpio_wstrb	: in std_logic_vector((C_pl_gpio_DATA_WIDTH/8)-1 downto 0);
		pl_gpio_wvalid	: in std_logic;
		pl_gpio_wready	: out std_logic;
		pl_gpio_bresp	: out std_logic_vector(1 downto 0);
		pl_gpio_bvalid	: out std_logic;
		pl_gpio_bready	: in std_logic;
		pl_gpio_araddr	: in std_logic_vector(C_pl_gpio_ADDR_WIDTH-1 downto 0);
		pl_gpio_arprot	: in std_logic_vector(2 downto 0);
		pl_gpio_arvalid	: in std_logic;
		pl_gpio_arready	: out std_logic;
		pl_gpio_rdata	: out std_logic_vector(C_pl_gpio_DATA_WIDTH-1 downto 0);
		pl_gpio_rresp	: out std_logic_vector(1 downto 0);
		pl_gpio_rvalid	: out std_logic;
		pl_gpio_rready	: in std_logic
	);
end pl_gpio_v1_0;

architecture arch_imp of pl_gpio_v1_0 is

	-- component declaration
	component pl_gpio_v1_0_pl_gpio is
		generic (
		C_number_pins       : integer   := 8;
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 6
		);
		port (
		gpio_pins       : inout std_logic_vector((C_number_pins-1) downto 0);
        interrupt_out   : out   std_logic;
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component pl_gpio_v1_0_pl_gpio;

begin

-- Instantiation of Axi Bus Interface pl_gpio
pl_gpio_v1_0_pl_gpio_inst : pl_gpio_v1_0_pl_gpio
	generic map (
	    C_number_pins => C_number_pins,
		C_S_AXI_DATA_WIDTH	=> C_pl_gpio_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_pl_gpio_ADDR_WIDTH
	)
	port map (
	    gpio_pins => gpio_pins,
	    interrupt_out => interrupt_out,
		S_AXI_ACLK	=> pl_gpio_aclk,
		S_AXI_ARESETN	=> pl_gpio_aresetn,
		S_AXI_AWADDR	=> pl_gpio_awaddr,
		S_AXI_AWPROT	=> pl_gpio_awprot,
		S_AXI_AWVALID	=> pl_gpio_awvalid,
		S_AXI_AWREADY	=> pl_gpio_awready,
		S_AXI_WDATA	=> pl_gpio_wdata,
		S_AXI_WSTRB	=> pl_gpio_wstrb,
		S_AXI_WVALID	=> pl_gpio_wvalid,
		S_AXI_WREADY	=> pl_gpio_wready,
		S_AXI_BRESP	=> pl_gpio_bresp,
		S_AXI_BVALID	=> pl_gpio_bvalid,
		S_AXI_BREADY	=> pl_gpio_bready,
		S_AXI_ARADDR	=> pl_gpio_araddr,
		S_AXI_ARPROT	=> pl_gpio_arprot,
		S_AXI_ARVALID	=> pl_gpio_arvalid,
		S_AXI_ARREADY	=> pl_gpio_arready,
		S_AXI_RDATA	=> pl_gpio_rdata,
		S_AXI_RRESP	=> pl_gpio_rresp,
		S_AXI_RVALID	=> pl_gpio_rvalid,
		S_AXI_RREADY	=> pl_gpio_rready
	);

	-- Add user logic here

	-- User logic ends

end arch_imp;
