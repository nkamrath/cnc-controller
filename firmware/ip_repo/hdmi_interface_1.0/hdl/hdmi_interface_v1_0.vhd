library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hdmi_interface_v1_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface hdmi_interface
		C_hdmi_interface_DATA_WIDTH	: integer	:= 32;
		C_hdmi_interface_ADDR_WIDTH	: integer	:= 7
	);
	port (
		-- Users to add ports here
		CLK_100            : in std_logic;
        DMA_TDATA          : in std_logic_vector(31 downto 0);
        DMA_TKEEP          : in std_logic_vector(3 downto 0);
        DMA_TLAST          : in std_logic;
        DMA_TVALID         : in std_logic;
        DMA_TREADY         : out std_logic;
        hdmi_out_en  :       out std_logic;
        hdmi_tx_rscl  : out   std_logic;
        hdmi_tx_rsda  : inout std_logic;
        hdmi_tx_hpd   : in    std_logic;
        hdmi_tx_cec   : inout std_logic;
        hdmi_tx_clk_p : out   std_logic;
        hdmi_tx_clk_n : out   std_logic;
        hdmi_tx_p     : out   std_logic_vector(2 downto 0);
        hdmi_tx_n     : out   std_logic_vector(2 downto 0);
        frame_sync     : out  std_logic;
        
		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface hdmi_interface
		hdmi_interface_aclk	: in std_logic;
		hdmi_interface_aresetn	: in std_logic;
		hdmi_interface_awaddr	: in std_logic_vector(C_hdmi_interface_ADDR_WIDTH-1 downto 0);
		hdmi_interface_awprot	: in std_logic_vector(2 downto 0);
		hdmi_interface_awvalid	: in std_logic;
		hdmi_interface_awready	: out std_logic;
		hdmi_interface_wdata	: in std_logic_vector(C_hdmi_interface_DATA_WIDTH-1 downto 0);
		hdmi_interface_wstrb	: in std_logic_vector((C_hdmi_interface_DATA_WIDTH/8)-1 downto 0);
		hdmi_interface_wvalid	: in std_logic;
		hdmi_interface_wready	: out std_logic;
		hdmi_interface_bresp	: out std_logic_vector(1 downto 0);
		hdmi_interface_bvalid	: out std_logic;
		hdmi_interface_bready	: in std_logic;
		hdmi_interface_araddr	: in std_logic_vector(C_hdmi_interface_ADDR_WIDTH-1 downto 0);
		hdmi_interface_arprot	: in std_logic_vector(2 downto 0);
		hdmi_interface_arvalid	: in std_logic;
		hdmi_interface_arready	: out std_logic;
		hdmi_interface_rdata	: out std_logic_vector(C_hdmi_interface_DATA_WIDTH-1 downto 0);
		hdmi_interface_rresp	: out std_logic_vector(1 downto 0);
		hdmi_interface_rvalid	: out std_logic;
		hdmi_interface_rready	: in std_logic
	);
end hdmi_interface_v1_0;

architecture arch_imp of hdmi_interface_v1_0 is

	-- component declaration
	component hdmi_interface_v1_0_hdmi_interface is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 7
		);
		port (
		CLK_100            : in std_logic;
		DMA_TDATA          : in std_logic_vector(31 downto 0);
        DMA_TKEEP          : in std_logic_vector(3 downto 0);
        DMA_TLAST          : in std_logic;
        DMA_TVALID         : in std_logic;
        DMA_TREADY         : out std_logic;
        hdmi_out_en  :       out std_logic;
        hdmi_tx_rscl  : out   std_logic;
        hdmi_tx_rsda  : inout std_logic;
        hdmi_tx_hpd   : in    std_logic;
        hdmi_tx_cec   : inout std_logic;
        hdmi_tx_clk_p : out   std_logic;
        hdmi_tx_clk_n : out   std_logic;
        hdmi_tx_p     : out   std_logic_vector(2 downto 0);
        hdmi_tx_n     : out   std_logic_vector(2 downto 0);
        frame_sync     : out  std_logic;
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
	end component hdmi_interface_v1_0_hdmi_interface;

begin

-- Instantiation of Axi Bus Interface hdmi_interface
hdmi_interface_v1_0_hdmi_interface_inst : hdmi_interface_v1_0_hdmi_interface
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_hdmi_interface_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_hdmi_interface_ADDR_WIDTH
	)
	port map (
        CLK_100        => CLK_100,	    
	    DMA_TDATA      => DMA_TDATA,
        DMA_TKEEP      => DMA_TKEEP,
        DMA_TLAST      => DMA_TLAST,
        DMA_TVALID     => DMA_TVALID,    
        DMA_TREADY     => DMA_TREADY,
        hdmi_out_en => hdmi_out_en,    
        hdmi_tx_rscl => hdmi_tx_rscl,
        hdmi_tx_rsda  => hdmi_tx_rsda,
        hdmi_tx_hpd   => hdmi_tx_hpd,
        hdmi_tx_cec   => hdmi_tx_cec,
        hdmi_tx_clk_p => hdmi_tx_clk_p,
        hdmi_tx_clk_n => hdmi_tx_clk_n,
        hdmi_tx_p     => hdmi_tx_p,
        hdmi_tx_n     => hdmi_tx_n,
        frame_sync     => frame_sync,
		S_AXI_ACLK	=> hdmi_interface_aclk,
		S_AXI_ARESETN	=> hdmi_interface_aresetn,
		S_AXI_AWADDR	=> hdmi_interface_awaddr,
		S_AXI_AWPROT	=> hdmi_interface_awprot,
		S_AXI_AWVALID	=> hdmi_interface_awvalid,
		S_AXI_AWREADY	=> hdmi_interface_awready,
		S_AXI_WDATA	=> hdmi_interface_wdata,
		S_AXI_WSTRB	=> hdmi_interface_wstrb,
		S_AXI_WVALID	=> hdmi_interface_wvalid,
		S_AXI_WREADY	=> hdmi_interface_wready,
		S_AXI_BRESP	=> hdmi_interface_bresp,
		S_AXI_BVALID	=> hdmi_interface_bvalid,
		S_AXI_BREADY	=> hdmi_interface_bready,
		S_AXI_ARADDR	=> hdmi_interface_araddr,
		S_AXI_ARPROT	=> hdmi_interface_arprot,
		S_AXI_ARVALID	=> hdmi_interface_arvalid,
		S_AXI_ARREADY	=> hdmi_interface_arready,
		S_AXI_RDATA	=> hdmi_interface_rdata,
		S_AXI_RRESP	=> hdmi_interface_rresp,
		S_AXI_RVALID	=> hdmi_interface_rvalid,
		S_AXI_RREADY	=> hdmi_interface_rready
	);

	-- Add user logic here

	-- User logic ends

end arch_imp;
