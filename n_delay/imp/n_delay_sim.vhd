--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: O.40d
--  \   \         Application: netgen
--  /   /         Filename: n_delay_sim.vhd
-- /___/   /\     Timestamp: Thu Feb  1 17:24:48 2018
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -mhf -ofmt vhdl -sim -tm n_delay -w n_delay n_delay.vhd 
-- Device	: 3s700anfgg484-4 (PRODUCTION 1.41 2011-02-03)
-- Input file	: n_delay.ncd
-- Output file	: n_delay.vhd
-- # of Entities	: 2
-- Design Name	: delay_test
-- Module Name	: n_delay
-- Xilinx	: /data/cae/ise13_1/ISE/
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity n_delay is
  port (
    n_del_in : in STD_LOGIC := 'X'; 
    n_del_out : out STD_LOGIC 
  );
end n_delay;

architecture STRUCTURE of n_delay is
  signal intsig_delay_6_0 : STD_LOGIC; 
  signal intsig_delay_4_0 : STD_LOGIC; 
  signal intsig_delay_5_0 : STD_LOGIC; 
  signal intsig_delay_3_0 : STD_LOGIC; 
  signal intsig_delay_2_0 : STD_LOGIC; 
  signal intsig_delay_1_0 : STD_LOGIC; 
  signal delay_test_out_c_F : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal intsig_delay : STD_LOGIC_VECTOR ( 6 downto 1 ); 
begin
  delay_test_out_c_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X62Y94",
      PATHPULSE => 741 ps
    )
    port map (
      I => delay_test_out_c_F,
      O => n_del_out
    );
  delay_test_out_c_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X62Y94",
      PATHPULSE => 741 ps
    )
    port map (
      I => intsig_delay(5),
      O => intsig_delay_5_0
    );
  n_delay_5_lut_instance : X_LUT4
    generic map(
      INIT => X"F0F0",
      LOC => "SLICE_X62Y94"
    )
    port map (
      ADR0 => VCC,
      ADR1 => VCC,
      ADR2 => intsig_delay_4_0,
      ADR3 => VCC,
      O => intsig_delay(5)
    );
  n_delay_inst_intsig_delay_6_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X62Y95",
      PATHPULSE => 741 ps
    )
    port map (
      I => intsig_delay(6),
      O => intsig_delay_6_0
    );
  n_delay_inst_intsig_delay_6_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X62Y95",
      PATHPULSE => 741 ps
    )
    port map (
      I => intsig_delay(4),
      O => intsig_delay_4_0
    );
  n_delay_4_lut_instance : X_LUT4
    generic map(
      INIT => X"F0F0",
      LOC => "SLICE_X62Y95"
    )
    port map (
      ADR0 => VCC,
      ADR1 => VCC,
      ADR2 => intsig_delay_3_0,
      ADR3 => VCC,
      O => intsig_delay(4)
    );
  n_delay_inst_intsig_delay_3_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X63Y94",
      PATHPULSE => 741 ps
    )
    port map (
      I => intsig_delay(3),
      O => intsig_delay_3_0
    );
  n_delay_inst_intsig_delay_3_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X63Y94",
      PATHPULSE => 741 ps
    )
    port map (
      I => intsig_delay(1),
      O => intsig_delay_1_0
    );
  n_delay_1_lut_instance : X_LUT4
    generic map(
      INIT => X"F0F0",
      LOC => "SLICE_X63Y94"
    )
    port map (
      ADR0 => VCC,
      ADR1 => VCC,
      ADR2 => n_del_in,
      ADR3 => VCC,
      O => intsig_delay(1)
    );
  n_delay_inst_intsig_delay_2_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X63Y95",
      PATHPULSE => 741 ps
    )
    port map (
      I => intsig_delay(2),
      O => intsig_delay_2_0
    );
  n_delay_2_lut_instance : X_LUT4
    generic map(
      INIT => X"F0F0",
      LOC => "SLICE_X63Y95"
    )
    port map (
      ADR0 => VCC,
      ADR1 => VCC,
      ADR2 => intsig_delay_1_0,
      ADR3 => VCC,
      O => intsig_delay(2)
    );
  n_delay_7_lut_instance : X_LUT4
    generic map(
      INIT => X"CCCC",
      LOC => "SLICE_X62Y94"
    )
    port map (
      ADR0 => VCC,
      ADR1 => intsig_delay_6_0,
      ADR2 => VCC,
      ADR3 => VCC,
      O => delay_test_out_c_F
    );
  n_delay_6_lut_instance : X_LUT4
    generic map(
      INIT => X"FF00",
      LOC => "SLICE_X62Y95"
    )
    port map (
      ADR0 => VCC,
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => intsig_delay_5_0,
      O => intsig_delay(6)
    );
  n_delay_3_lut_instance : X_LUT4
    generic map(
      INIT => X"AAAA",
      LOC => "SLICE_X63Y94"
    )
    port map (
      ADR0 => intsig_delay_2_0,
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => VCC,
      O => intsig_delay(3)
    );
  NlwBlock_n_delay_inst_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlockROC : X_ROC
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end STRUCTURE;

