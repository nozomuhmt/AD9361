-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
-- Date        : Wed May 28 13:58:22 2025
-- Host        : lc35648-VirtualBox running 64-bit Ubuntu 24.04.2 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/lc35648/hdl/projects/fmcomms2/zed/fmcomms2_zed.gen/sources_1/bd/system/ip/system_axi_spdif_tx_core_0/system_axi_spdif_tx_core_0_stub.vhdl
-- Design      : system_axi_spdif_tx_core_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_axi_spdif_tx_core_0 is
  Port ( 
    spdif_data_clk : in STD_LOGIC;
    spdif_tx_o : out STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    dma_req_aclk : in STD_LOGIC;
    dma_req_rstn : in STD_LOGIC;
    dma_req_davalid : in STD_LOGIC;
    dma_req_datype : in STD_LOGIC_VECTOR ( 1 downto 0 );
    dma_req_daready : out STD_LOGIC;
    dma_req_drvalid : out STD_LOGIC;
    dma_req_drtype : out STD_LOGIC_VECTOR ( 1 downto 0 );
    dma_req_drlast : out STD_LOGIC;
    dma_req_drready : in STD_LOGIC
  );

end system_axi_spdif_tx_core_0;

architecture stub of system_axi_spdif_tx_core_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "spdif_data_clk,spdif_tx_o,s_axi_aclk,s_axi_aresetn,s_axi_awaddr[15:0],s_axi_awprot[2:0],s_axi_awvalid,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wvalid,s_axi_bready,s_axi_araddr[15:0],s_axi_arprot[2:0],s_axi_arvalid,s_axi_rready,s_axi_arready,s_axi_rdata[31:0],s_axi_rresp[1:0],s_axi_rvalid,s_axi_wready,s_axi_bresp[1:0],s_axi_bvalid,s_axi_awready,dma_req_aclk,dma_req_rstn,dma_req_davalid,dma_req_datype[1:0],dma_req_daready,dma_req_drvalid,dma_req_drtype[1:0],dma_req_drlast,dma_req_drready";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "axi_spdif_tx,Vivado 2022.2";
begin
end;
