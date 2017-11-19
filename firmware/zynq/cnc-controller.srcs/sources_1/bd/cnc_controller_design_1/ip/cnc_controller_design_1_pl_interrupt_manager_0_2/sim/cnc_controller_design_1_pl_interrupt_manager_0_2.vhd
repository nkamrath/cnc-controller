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

-- IP VLNV: xilinx.com:user:pl_interrupt_manager:1.0
-- IP Revision: 3

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY cnc_controller_design_1_pl_interrupt_manager_0_2 IS
  PORT (
    INTERRUPTS_IN : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    INTERRUPT_OUT : OUT STD_LOGIC;
    pl_interrupt_manager_awaddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    pl_interrupt_manager_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    pl_interrupt_manager_awvalid : IN STD_LOGIC;
    pl_interrupt_manager_awready : OUT STD_LOGIC;
    pl_interrupt_manager_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    pl_interrupt_manager_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    pl_interrupt_manager_wvalid : IN STD_LOGIC;
    pl_interrupt_manager_wready : OUT STD_LOGIC;
    pl_interrupt_manager_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    pl_interrupt_manager_bvalid : OUT STD_LOGIC;
    pl_interrupt_manager_bready : IN STD_LOGIC;
    pl_interrupt_manager_araddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    pl_interrupt_manager_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    pl_interrupt_manager_arvalid : IN STD_LOGIC;
    pl_interrupt_manager_arready : OUT STD_LOGIC;
    pl_interrupt_manager_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    pl_interrupt_manager_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    pl_interrupt_manager_rvalid : OUT STD_LOGIC;
    pl_interrupt_manager_rready : IN STD_LOGIC;
    pl_interrupt_manager_aclk : IN STD_LOGIC;
    pl_interrupt_manager_aresetn : IN STD_LOGIC
  );
END cnc_controller_design_1_pl_interrupt_manager_0_2;

ARCHITECTURE cnc_controller_design_1_pl_interrupt_manager_0_2_arch OF cnc_controller_design_1_pl_interrupt_manager_0_2 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF cnc_controller_design_1_pl_interrupt_manager_0_2_arch: ARCHITECTURE IS "yes";
  COMPONENT pl_interrupt_manager_v1_0 IS
    GENERIC (
      C_pl_interrupt_manager_DATA_WIDTH : INTEGER; -- Width of S_AXI data bus
      C_pl_interrupt_manager_ADDR_WIDTH : INTEGER; -- Width of S_AXI address bus
      C_num_interrupts_in : INTEGER
    );
    PORT (
      INTERRUPTS_IN : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      INTERRUPT_OUT : OUT STD_LOGIC;
      pl_interrupt_manager_awaddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      pl_interrupt_manager_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      pl_interrupt_manager_awvalid : IN STD_LOGIC;
      pl_interrupt_manager_awready : OUT STD_LOGIC;
      pl_interrupt_manager_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      pl_interrupt_manager_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      pl_interrupt_manager_wvalid : IN STD_LOGIC;
      pl_interrupt_manager_wready : OUT STD_LOGIC;
      pl_interrupt_manager_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      pl_interrupt_manager_bvalid : OUT STD_LOGIC;
      pl_interrupt_manager_bready : IN STD_LOGIC;
      pl_interrupt_manager_araddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      pl_interrupt_manager_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      pl_interrupt_manager_arvalid : IN STD_LOGIC;
      pl_interrupt_manager_arready : OUT STD_LOGIC;
      pl_interrupt_manager_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      pl_interrupt_manager_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      pl_interrupt_manager_rvalid : OUT STD_LOGIC;
      pl_interrupt_manager_rready : IN STD_LOGIC;
      pl_interrupt_manager_aclk : IN STD_LOGIC;
      pl_interrupt_manager_aresetn : IN STD_LOGIC
    );
  END COMPONENT pl_interrupt_manager_v1_0;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF pl_interrupt_manager_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_interrupt_manager AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF pl_interrupt_manager_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_interrupt_manager AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF pl_interrupt_manager_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_interrupt_manager AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF pl_interrupt_manager_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_interrupt_manager AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF pl_interrupt_manager_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_interrupt_manager WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF pl_interrupt_manager_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_interrupt_manager WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF pl_interrupt_manager_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_interrupt_manager WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF pl_interrupt_manager_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_interrupt_manager WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF pl_interrupt_manager_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_interrupt_manager BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF pl_interrupt_manager_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_interrupt_manager BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF pl_interrupt_manager_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_interrupt_manager BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF pl_interrupt_manager_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_interrupt_manager ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF pl_interrupt_manager_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_interrupt_manager ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF pl_interrupt_manager_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_interrupt_manager ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF pl_interrupt_manager_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_interrupt_manager ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF pl_interrupt_manager_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_interrupt_manager RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF pl_interrupt_manager_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_interrupt_manager RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF pl_interrupt_manager_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_interrupt_manager RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF pl_interrupt_manager_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 pl_interrupt_manager RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF pl_interrupt_manager_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 pl_interrupt_manager_CLK CLK, xilinx.com:signal:clock:1.0 pl_interrupt_manager_aclk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF pl_interrupt_manager_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 pl_interrupt_manager_RST RST, xilinx.com:signal:reset:1.0 pl_interrupt_manager_aresetn RST";
BEGIN
  U0 : pl_interrupt_manager_v1_0
    GENERIC MAP (
      C_pl_interrupt_manager_DATA_WIDTH => 32,
      C_pl_interrupt_manager_ADDR_WIDTH => 5,
      C_num_interrupts_in => 32
    )
    PORT MAP (
      INTERRUPTS_IN => INTERRUPTS_IN,
      INTERRUPT_OUT => INTERRUPT_OUT,
      pl_interrupt_manager_awaddr => pl_interrupt_manager_awaddr,
      pl_interrupt_manager_awprot => pl_interrupt_manager_awprot,
      pl_interrupt_manager_awvalid => pl_interrupt_manager_awvalid,
      pl_interrupt_manager_awready => pl_interrupt_manager_awready,
      pl_interrupt_manager_wdata => pl_interrupt_manager_wdata,
      pl_interrupt_manager_wstrb => pl_interrupt_manager_wstrb,
      pl_interrupt_manager_wvalid => pl_interrupt_manager_wvalid,
      pl_interrupt_manager_wready => pl_interrupt_manager_wready,
      pl_interrupt_manager_bresp => pl_interrupt_manager_bresp,
      pl_interrupt_manager_bvalid => pl_interrupt_manager_bvalid,
      pl_interrupt_manager_bready => pl_interrupt_manager_bready,
      pl_interrupt_manager_araddr => pl_interrupt_manager_araddr,
      pl_interrupt_manager_arprot => pl_interrupt_manager_arprot,
      pl_interrupt_manager_arvalid => pl_interrupt_manager_arvalid,
      pl_interrupt_manager_arready => pl_interrupt_manager_arready,
      pl_interrupt_manager_rdata => pl_interrupt_manager_rdata,
      pl_interrupt_manager_rresp => pl_interrupt_manager_rresp,
      pl_interrupt_manager_rvalid => pl_interrupt_manager_rvalid,
      pl_interrupt_manager_rready => pl_interrupt_manager_rready,
      pl_interrupt_manager_aclk => pl_interrupt_manager_aclk,
      pl_interrupt_manager_aresetn => pl_interrupt_manager_aresetn
    );
END cnc_controller_design_1_pl_interrupt_manager_0_2_arch;
