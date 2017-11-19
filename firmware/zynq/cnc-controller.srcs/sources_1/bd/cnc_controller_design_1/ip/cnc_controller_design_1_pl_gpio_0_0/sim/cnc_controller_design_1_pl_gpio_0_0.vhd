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

-- IP VLNV: xilinx.com:user:pl_gpio:1.0
-- IP Revision: 7

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY cnc_controller_design_1_pl_gpio_0_0 IS
  PORT (
    gpio_pins : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    interrupt_out : OUT STD_LOGIC;
    pl_gpio_awaddr : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    pl_gpio_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    pl_gpio_awvalid : IN STD_LOGIC;
    pl_gpio_awready : OUT STD_LOGIC;
    pl_gpio_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    pl_gpio_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    pl_gpio_wvalid : IN STD_LOGIC;
    pl_gpio_wready : OUT STD_LOGIC;
    pl_gpio_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    pl_gpio_bvalid : OUT STD_LOGIC;
    pl_gpio_bready : IN STD_LOGIC;
    pl_gpio_araddr : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    pl_gpio_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    pl_gpio_arvalid : IN STD_LOGIC;
    pl_gpio_arready : OUT STD_LOGIC;
    pl_gpio_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    pl_gpio_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    pl_gpio_rvalid : OUT STD_LOGIC;
    pl_gpio_rready : IN STD_LOGIC;
    pl_gpio_aclk : IN STD_LOGIC;
    pl_gpio_aresetn : IN STD_LOGIC
  );
END cnc_controller_design_1_pl_gpio_0_0;

ARCHITECTURE cnc_controller_design_1_pl_gpio_0_0_arch OF cnc_controller_design_1_pl_gpio_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF cnc_controller_design_1_pl_gpio_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT pl_gpio_v1_0 IS
    GENERIC (
      C_pl_gpio_DATA_WIDTH : INTEGER; -- Width of S_AXI data bus
      C_pl_gpio_ADDR_WIDTH : INTEGER; -- Width of S_AXI address bus
      C_number_pins : INTEGER
    );
    PORT (
      gpio_pins : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      interrupt_out : OUT STD_LOGIC;
      pl_gpio_awaddr : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      pl_gpio_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      pl_gpio_awvalid : IN STD_LOGIC;
      pl_gpio_awready : OUT STD_LOGIC;
      pl_gpio_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      pl_gpio_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      pl_gpio_wvalid : IN STD_LOGIC;
      pl_gpio_wready : OUT STD_LOGIC;
      pl_gpio_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      pl_gpio_bvalid : OUT STD_LOGIC;
      pl_gpio_bready : IN STD_LOGIC;
      pl_gpio_araddr : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      pl_gpio_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      pl_gpio_arvalid : IN STD_LOGIC;
      pl_gpio_arready : OUT STD_LOGIC;
      pl_gpio_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      pl_gpio_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      pl_gpio_rvalid : OUT STD_LOGIC;
      pl_gpio_rready : IN STD_LOGIC;
      pl_gpio_aclk : IN STD_LOGIC;
      pl_gpio_aresetn : IN STD_LOGIC
    );
  END COMPONENT pl_gpio_v1_0;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF pl_gpio_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_gpio AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF pl_gpio_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_gpio AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF pl_gpio_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_gpio AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF pl_gpio_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_gpio AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF pl_gpio_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_gpio WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF pl_gpio_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_gpio WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF pl_gpio_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_gpio WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF pl_gpio_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_gpio WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF pl_gpio_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_gpio BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF pl_gpio_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_gpio BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF pl_gpio_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_gpio BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF pl_gpio_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_gpio ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF pl_gpio_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_gpio ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF pl_gpio_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_gpio ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF pl_gpio_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_gpio ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF pl_gpio_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_gpio RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF pl_gpio_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_gpio RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF pl_gpio_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_gpio RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF pl_gpio_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_gpio RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF pl_gpio_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 pl_gpio_CLK CLK, xilinx.com:signal:clock:1.0 pl_gpio_aclk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF pl_gpio_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 pl_gpio_RST RST, xilinx.com:signal:reset:1.0 pl_gpio_aresetn RST";
BEGIN
  U0 : pl_gpio_v1_0
    GENERIC MAP (
      C_pl_gpio_DATA_WIDTH => 32,
      C_pl_gpio_ADDR_WIDTH => 6,
      C_number_pins => 8
    )
    PORT MAP (
      gpio_pins => gpio_pins,
      interrupt_out => interrupt_out,
      pl_gpio_awaddr => pl_gpio_awaddr,
      pl_gpio_awprot => pl_gpio_awprot,
      pl_gpio_awvalid => pl_gpio_awvalid,
      pl_gpio_awready => pl_gpio_awready,
      pl_gpio_wdata => pl_gpio_wdata,
      pl_gpio_wstrb => pl_gpio_wstrb,
      pl_gpio_wvalid => pl_gpio_wvalid,
      pl_gpio_wready => pl_gpio_wready,
      pl_gpio_bresp => pl_gpio_bresp,
      pl_gpio_bvalid => pl_gpio_bvalid,
      pl_gpio_bready => pl_gpio_bready,
      pl_gpio_araddr => pl_gpio_araddr,
      pl_gpio_arprot => pl_gpio_arprot,
      pl_gpio_arvalid => pl_gpio_arvalid,
      pl_gpio_arready => pl_gpio_arready,
      pl_gpio_rdata => pl_gpio_rdata,
      pl_gpio_rresp => pl_gpio_rresp,
      pl_gpio_rvalid => pl_gpio_rvalid,
      pl_gpio_rready => pl_gpio_rready,
      pl_gpio_aclk => pl_gpio_aclk,
      pl_gpio_aresetn => pl_gpio_aresetn
    );
END cnc_controller_design_1_pl_gpio_0_0_arch;
