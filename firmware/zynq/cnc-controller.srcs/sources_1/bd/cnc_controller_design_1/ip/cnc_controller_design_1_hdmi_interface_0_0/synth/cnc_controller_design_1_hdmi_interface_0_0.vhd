-- (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:user:hdmi_interface:1.0
-- IP Revision: 32

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY cnc_controller_design_1_hdmi_interface_0_0 IS
  PORT (
    CLK_100 : IN STD_LOGIC;
    DMA_TDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    DMA_TKEEP : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    DMA_TLAST : IN STD_LOGIC;
    DMA_TVALID : IN STD_LOGIC;
    DMA_TREADY : OUT STD_LOGIC;
    hdmi_out_en : OUT STD_LOGIC;
    hdmi_tx_rscl : OUT STD_LOGIC;
    hdmi_tx_rsda : INOUT STD_LOGIC;
    hdmi_tx_hpd : IN STD_LOGIC;
    hdmi_tx_cec : INOUT STD_LOGIC;
    hdmi_tx_clk_p : OUT STD_LOGIC;
    hdmi_tx_clk_n : OUT STD_LOGIC;
    hdmi_tx_p : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    hdmi_tx_n : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    hdmi_interface_awaddr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    hdmi_interface_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    hdmi_interface_awvalid : IN STD_LOGIC;
    hdmi_interface_awready : OUT STD_LOGIC;
    hdmi_interface_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    hdmi_interface_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    hdmi_interface_wvalid : IN STD_LOGIC;
    hdmi_interface_wready : OUT STD_LOGIC;
    hdmi_interface_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    hdmi_interface_bvalid : OUT STD_LOGIC;
    hdmi_interface_bready : IN STD_LOGIC;
    hdmi_interface_araddr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    hdmi_interface_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    hdmi_interface_arvalid : IN STD_LOGIC;
    hdmi_interface_arready : OUT STD_LOGIC;
    hdmi_interface_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    hdmi_interface_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    hdmi_interface_rvalid : OUT STD_LOGIC;
    hdmi_interface_rready : IN STD_LOGIC;
    hdmi_interface_aclk : IN STD_LOGIC;
    hdmi_interface_aresetn : IN STD_LOGIC
  );
END cnc_controller_design_1_hdmi_interface_0_0;

ARCHITECTURE cnc_controller_design_1_hdmi_interface_0_0_arch OF cnc_controller_design_1_hdmi_interface_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF cnc_controller_design_1_hdmi_interface_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT hdmi_interface_v1_0 IS
    GENERIC (
      C_hdmi_interface_DATA_WIDTH : INTEGER; -- Width of S_AXI data bus
      C_hdmi_interface_ADDR_WIDTH : INTEGER -- Width of S_AXI address bus
    );
    PORT (
      CLK_100 : IN STD_LOGIC;
      DMA_TDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      DMA_TKEEP : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      DMA_TLAST : IN STD_LOGIC;
      DMA_TVALID : IN STD_LOGIC;
      DMA_TREADY : OUT STD_LOGIC;
      hdmi_out_en : OUT STD_LOGIC;
      hdmi_tx_rscl : OUT STD_LOGIC;
      hdmi_tx_rsda : INOUT STD_LOGIC;
      hdmi_tx_hpd : IN STD_LOGIC;
      hdmi_tx_cec : INOUT STD_LOGIC;
      hdmi_tx_clk_p : OUT STD_LOGIC;
      hdmi_tx_clk_n : OUT STD_LOGIC;
      hdmi_tx_p : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      hdmi_tx_n : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      hdmi_interface_awaddr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      hdmi_interface_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      hdmi_interface_awvalid : IN STD_LOGIC;
      hdmi_interface_awready : OUT STD_LOGIC;
      hdmi_interface_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      hdmi_interface_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      hdmi_interface_wvalid : IN STD_LOGIC;
      hdmi_interface_wready : OUT STD_LOGIC;
      hdmi_interface_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      hdmi_interface_bvalid : OUT STD_LOGIC;
      hdmi_interface_bready : IN STD_LOGIC;
      hdmi_interface_araddr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      hdmi_interface_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      hdmi_interface_arvalid : IN STD_LOGIC;
      hdmi_interface_arready : OUT STD_LOGIC;
      hdmi_interface_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      hdmi_interface_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      hdmi_interface_rvalid : OUT STD_LOGIC;
      hdmi_interface_rready : IN STD_LOGIC;
      hdmi_interface_aclk : IN STD_LOGIC;
      hdmi_interface_aresetn : IN STD_LOGIC
    );
  END COMPONENT hdmi_interface_v1_0;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF cnc_controller_design_1_hdmi_interface_0_0_arch: ARCHITECTURE IS "hdmi_interface_v1_0,Vivado 2017.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF cnc_controller_design_1_hdmi_interface_0_0_arch : ARCHITECTURE IS "cnc_controller_design_1_hdmi_interface_0_0,hdmi_interface_v1_0,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF cnc_controller_design_1_hdmi_interface_0_0_arch: ARCHITECTURE IS "cnc_controller_design_1_hdmi_interface_0_0,hdmi_interface_v1_0,{x_ipProduct=Vivado 2017.2,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=hdmi_interface,x_ipVersion=1.0,x_ipCoreRevision=32,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED,C_hdmi_interface_DATA_WIDTH=32,C_hdmi_interface_ADDR_WIDTH=7}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_tx_clk_p: SIGNAL IS "xilinx.com:signal:clock:1.0 hdmi_tx_clk_p CLK";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_tx_clk_n: SIGNAL IS "xilinx.com:signal:clock:1.0 hdmi_tx_clk_n CLK";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_interface_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 hdmi_interface AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_interface_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 hdmi_interface AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_interface_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 hdmi_interface AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_interface_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 hdmi_interface AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_interface_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 hdmi_interface WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_interface_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 hdmi_interface WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_interface_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 hdmi_interface WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_interface_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 hdmi_interface WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_interface_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 hdmi_interface BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_interface_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 hdmi_interface BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_interface_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 hdmi_interface BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_interface_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 hdmi_interface ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_interface_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 hdmi_interface ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_interface_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 hdmi_interface ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_interface_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 hdmi_interface ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_interface_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 hdmi_interface RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_interface_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 hdmi_interface RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_interface_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 hdmi_interface RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_interface_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 hdmi_interface RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_interface_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 hdmi_interface_CLK CLK, xilinx.com:signal:clock:1.0 hdmi_interface_aclk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF hdmi_interface_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 hdmi_interface_RST RST, xilinx.com:signal:reset:1.0 hdmi_interface_aresetn RST";
BEGIN
  U0 : hdmi_interface_v1_0
    GENERIC MAP (
      C_hdmi_interface_DATA_WIDTH => 32,
      C_hdmi_interface_ADDR_WIDTH => 7
    )
    PORT MAP (
      CLK_100 => CLK_100,
      DMA_TDATA => DMA_TDATA,
      DMA_TKEEP => DMA_TKEEP,
      DMA_TLAST => DMA_TLAST,
      DMA_TVALID => DMA_TVALID,
      DMA_TREADY => DMA_TREADY,
      hdmi_out_en => hdmi_out_en,
      hdmi_tx_rscl => hdmi_tx_rscl,
      hdmi_tx_rsda => hdmi_tx_rsda,
      hdmi_tx_hpd => hdmi_tx_hpd,
      hdmi_tx_cec => hdmi_tx_cec,
      hdmi_tx_clk_p => hdmi_tx_clk_p,
      hdmi_tx_clk_n => hdmi_tx_clk_n,
      hdmi_tx_p => hdmi_tx_p,
      hdmi_tx_n => hdmi_tx_n,
      hdmi_interface_awaddr => hdmi_interface_awaddr,
      hdmi_interface_awprot => hdmi_interface_awprot,
      hdmi_interface_awvalid => hdmi_interface_awvalid,
      hdmi_interface_awready => hdmi_interface_awready,
      hdmi_interface_wdata => hdmi_interface_wdata,
      hdmi_interface_wstrb => hdmi_interface_wstrb,
      hdmi_interface_wvalid => hdmi_interface_wvalid,
      hdmi_interface_wready => hdmi_interface_wready,
      hdmi_interface_bresp => hdmi_interface_bresp,
      hdmi_interface_bvalid => hdmi_interface_bvalid,
      hdmi_interface_bready => hdmi_interface_bready,
      hdmi_interface_araddr => hdmi_interface_araddr,
      hdmi_interface_arprot => hdmi_interface_arprot,
      hdmi_interface_arvalid => hdmi_interface_arvalid,
      hdmi_interface_arready => hdmi_interface_arready,
      hdmi_interface_rdata => hdmi_interface_rdata,
      hdmi_interface_rresp => hdmi_interface_rresp,
      hdmi_interface_rvalid => hdmi_interface_rvalid,
      hdmi_interface_rready => hdmi_interface_rready,
      hdmi_interface_aclk => hdmi_interface_aclk,
      hdmi_interface_aresetn => hdmi_interface_aresetn
    );
END cnc_controller_design_1_hdmi_interface_0_0_arch;
