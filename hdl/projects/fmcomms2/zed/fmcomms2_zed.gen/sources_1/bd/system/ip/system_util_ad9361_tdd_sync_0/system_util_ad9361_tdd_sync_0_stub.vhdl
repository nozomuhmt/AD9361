-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
-- Date        : Wed May 28 13:59:55 2025
-- Host        : lc35648-VirtualBox running 64-bit Ubuntu 24.04.2 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/lc35648/hdl/projects/fmcomms2/zed/fmcomms2_zed.gen/sources_1/bd/system/ip/system_util_ad9361_tdd_sync_0/system_util_ad9361_tdd_sync_0_stub.vhdl
-- Design      : system_util_ad9361_tdd_sync_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_util_ad9361_tdd_sync_0 is
  Port ( 
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    sync_mode : in STD_LOGIC;
    sync_in : in STD_LOGIC;
    sync_out : out STD_LOGIC
  );

end system_util_ad9361_tdd_sync_0;

architecture stub of system_util_ad9361_tdd_sync_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rstn,sync_mode,sync_in,sync_out";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "util_tdd_sync,Vivado 2022.2";
begin
end;
