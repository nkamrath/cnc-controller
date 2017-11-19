library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pl_interrupt_manager_v1_0 is
	generic (
		-- Users to add parameters here
        C_num_interrupts_in                 : integer := 32;
		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface pl_interrupt_manager
		C_pl_interrupt_manager_DATA_WIDTH	: integer	:= 32;
		C_pl_interrupt_manager_ADDR_WIDTH	: integer	:= 5
	);
	port (
		-- Users to add ports here
        INTERRUPTS_IN           : in std_logic_vector((C_num_interrupts_in-1) downto 0);
        INTERRUPT_OUT           : out std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface pl_interrupt_manager
		pl_interrupt_manager_aclk	: in std_logic;
		pl_interrupt_manager_aresetn	: in std_logic;
		pl_interrupt_manager_awaddr	: in std_logic_vector(C_pl_interrupt_manager_ADDR_WIDTH-1 downto 0);
		pl_interrupt_manager_awprot	: in std_logic_vector(2 downto 0);
		pl_interrupt_manager_awvalid	: in std_logic;
		pl_interrupt_manager_awready	: out std_logic;
		pl_interrupt_manager_wdata	: in std_logic_vector(C_pl_interrupt_manager_DATA_WIDTH-1 downto 0);
		pl_interrupt_manager_wstrb	: in std_logic_vector((C_pl_interrupt_manager_DATA_WIDTH/8)-1 downto 0);
		pl_interrupt_manager_wvalid	: in std_logic;
		pl_interrupt_manager_wready	: out std_logic;
		pl_interrupt_manager_bresp	: out std_logic_vector(1 downto 0);
		pl_interrupt_manager_bvalid	: out std_logic;
		pl_interrupt_manager_bready	: in std_logic;
		pl_interrupt_manager_araddr	: in std_logic_vector(C_pl_interrupt_manager_ADDR_WIDTH-1 downto 0);
		pl_interrupt_manager_arprot	: in std_logic_vector(2 downto 0);
		pl_interrupt_manager_arvalid	: in std_logic;
		pl_interrupt_manager_arready	: out std_logic;
		pl_interrupt_manager_rdata	: out std_logic_vector(C_pl_interrupt_manager_DATA_WIDTH-1 downto 0);
		pl_interrupt_manager_rresp	: out std_logic_vector(1 downto 0);
		pl_interrupt_manager_rvalid	: out std_logic;
		pl_interrupt_manager_rready	: in std_logic
	);
end pl_interrupt_manager_v1_0;

architecture arch_imp of pl_interrupt_manager_v1_0 is

	-- component declaration
	component pl_interrupt_manager_v1_0_pl_interrupt_manager is
		generic (
		C_num_interrupts_in : integer   := 32;
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 5
		);
		port (
		INTERRUPTS_IN           : in std_logic_vector((C_num_interrupts_in-1) downto 0);
        INTERRUPT_OUT           : out std_logic;
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
	end component pl_interrupt_manager_v1_0_pl_interrupt_manager;

begin

-- Instantiation of Axi Bus Interface pl_interrupt_manager
pl_interrupt_manager_v1_0_pl_interrupt_manager_inst : pl_interrupt_manager_v1_0_pl_interrupt_manager
	generic map (
	    C_num_interrupts_in => C_num_interrupts_in,
		C_S_AXI_DATA_WIDTH	=> C_pl_interrupt_manager_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_pl_interrupt_manager_ADDR_WIDTH
	)
	port map (
	    INTERRUPTS_IN => INTERRUPTS_IN,
	    INTERRUPT_OUT => INTERRUPT_OUT,
		S_AXI_ACLK	=> pl_interrupt_manager_aclk,
		S_AXI_ARESETN	=> pl_interrupt_manager_aresetn,
		S_AXI_AWADDR	=> pl_interrupt_manager_awaddr,
		S_AXI_AWPROT	=> pl_interrupt_manager_awprot,
		S_AXI_AWVALID	=> pl_interrupt_manager_awvalid,
		S_AXI_AWREADY	=> pl_interrupt_manager_awready,
		S_AXI_WDATA	=> pl_interrupt_manager_wdata,
		S_AXI_WSTRB	=> pl_interrupt_manager_wstrb,
		S_AXI_WVALID	=> pl_interrupt_manager_wvalid,
		S_AXI_WREADY	=> pl_interrupt_manager_wready,
		S_AXI_BRESP	=> pl_interrupt_manager_bresp,
		S_AXI_BVALID	=> pl_interrupt_manager_bvalid,
		S_AXI_BREADY	=> pl_interrupt_manager_bready,
		S_AXI_ARADDR	=> pl_interrupt_manager_araddr,
		S_AXI_ARPROT	=> pl_interrupt_manager_arprot,
		S_AXI_ARVALID	=> pl_interrupt_manager_arvalid,
		S_AXI_ARREADY	=> pl_interrupt_manager_arready,
		S_AXI_RDATA	=> pl_interrupt_manager_rdata,
		S_AXI_RRESP	=> pl_interrupt_manager_rresp,
		S_AXI_RVALID	=> pl_interrupt_manager_rvalid,
		S_AXI_RREADY	=> pl_interrupt_manager_rready
	);

	-- Add user logic here

	-- User logic ends

end arch_imp;
