/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09
// Date      : Mon Dec  1 23:15:24 2025
/////////////////////////////////////////////////////////////


module lfsr ( clk, rst_n, start, stop, mode, lfsr_out );
  input [1:0] mode;
  output [10:0] lfsr_out;
  input clk, rst_n, start, stop;
  wire   run, n1, n2, n4, n6, n7, n8, n10, n11, n21, n23, n24, n25, n26, n27,
         n28, n29, n30, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56;

  DFFARX1 run_reg ( .D(n41), .CLK(clk), .RSTB(rst_n), .Q(run) );
  DFFARX1 state_reg_1_ ( .D(n51), .CLK(clk), .RSTB(rst_n), .Q(lfsr_out[1]) );
  DFFARX1 state_reg_2_ ( .D(n50), .CLK(clk), .RSTB(rst_n), .Q(lfsr_out[2]) );
  DFFARX1 state_reg_3_ ( .D(n49), .CLK(clk), .RSTB(rst_n), .Q(lfsr_out[3]), 
        .QN(n33) );
  DFFARX1 state_reg_4_ ( .D(n48), .CLK(clk), .RSTB(rst_n), .Q(lfsr_out[4]), 
        .QN(n34) );
  DFFARX1 state_reg_5_ ( .D(n47), .CLK(clk), .RSTB(rst_n), .Q(lfsr_out[5]), 
        .QN(n35) );
  DFFARX1 state_reg_6_ ( .D(n46), .CLK(clk), .RSTB(rst_n), .Q(lfsr_out[6]), 
        .QN(n36) );
  AO21X1 U3 ( .IN1(start), .IN2(n1), .IN3(run), .Q(n41) );
  AO21X1 U4 ( .IN1(n2), .IN2(lfsr_out[10]), .IN3(n4), .Q(n42) );
  AO22X1 U7 ( .IN1(n2), .IN2(lfsr_out[9]), .IN3(n7), .IN4(mode[1]), .Q(n43) );
  NOR2X0 U8 ( .IN1(n38), .IN2(n8), .QN(n7) );
  AO22X1 U10 ( .IN1(n2), .IN2(lfsr_out[8]), .IN3(n10), .IN4(n6), .Q(n44) );
  AO22X1 U12 ( .IN1(n6), .IN2(lfsr_out[6]), .IN3(n2), .IN4(lfsr_out[7]), .Q(
        n45) );
  AO22X1 U14 ( .IN1(n6), .IN2(lfsr_out[5]), .IN3(n2), .IN4(lfsr_out[6]), .Q(
        n46) );
  AO22X1 U16 ( .IN1(n6), .IN2(lfsr_out[4]), .IN3(n2), .IN4(lfsr_out[5]), .Q(
        n47) );
  AO22X1 U18 ( .IN1(n6), .IN2(lfsr_out[3]), .IN3(n2), .IN4(lfsr_out[4]), .Q(
        n48) );
  AO22X1 U20 ( .IN1(n6), .IN2(lfsr_out[2]), .IN3(n2), .IN4(lfsr_out[3]), .Q(
        n49) );
  AO22X1 U22 ( .IN1(n6), .IN2(lfsr_out[1]), .IN3(n2), .IN4(lfsr_out[2]), .Q(
        n50) );
  AO22X1 U24 ( .IN1(n6), .IN2(lfsr_out[0]), .IN3(n2), .IN4(lfsr_out[1]), .Q(
        n51) );
  XOR3X1 U28 ( .IN1(n35), .IN2(n37), .IN3(n24), .Q(n23) );
  XOR2X1 U29 ( .IN1(n33), .IN2(n34), .Q(n24) );
  XOR2X1 U32 ( .IN1(lfsr_out[8]), .IN2(n34), .Q(n25) );
  AO22X1 U34 ( .IN1(n26), .IN2(n27), .IN3(mode[0]), .IN4(n28), .Q(n21) );
  XOR2X1 U35 ( .IN1(n38), .IN2(n40), .Q(n28) );
  INVX0 U36 ( .INP(mode[0]), .ZN(n27) );
  XOR2X1 U37 ( .IN1(n36), .IN2(n39), .Q(n26) );
  INVX0 U38 ( .INP(n8), .ZN(n6) );
  OA21X1 U40 ( .IN1(n29), .IN2(stop), .IN3(n8), .Q(n2) );
  NAND3X0 U41 ( .IN1(n29), .IN2(n1), .IN3(run), .QN(n8) );
  INVX0 U42 ( .INP(stop), .ZN(n1) );
  INVX0 U43 ( .INP(start), .ZN(n29) );
  DFFARX1 state_reg_7_ ( .D(n45), .CLK(clk), .RSTB(rst_n), .Q(lfsr_out[7]), 
        .QN(n37) );
  DFFARX1 state_reg_9_ ( .D(n43), .CLK(clk), .RSTB(rst_n), .Q(lfsr_out[9]), 
        .QN(n39) );
  DFFARX1 state_reg_8_ ( .D(n44), .CLK(clk), .RSTB(rst_n), .Q(lfsr_out[8]), 
        .QN(n38) );
  DFFARX1 state_reg_10_ ( .D(n42), .CLK(clk), .RSTB(rst_n), .Q(lfsr_out[10]), 
        .QN(n40) );
  DFFARX1 state_reg_0_ ( .D(n52), .CLK(clk), .RSTB(rst_n), .Q(lfsr_out[0]), 
        .QN(n30) );
  OR2X4 U44 ( .IN1(mode[1]), .IN2(mode[0]), .Q(n11) );
  AND2X1 U45 ( .IN1(lfsr_out[7]), .IN2(n11), .Q(n10) );
  AND4X1 U46 ( .IN1(lfsr_out[9]), .IN2(n6), .IN3(mode[0]), .IN4(mode[1]), .Q(
        n4) );
  NOR2X0 U47 ( .IN1(mode[1]), .IN2(n25), .QN(n53) );
  INVX0 U48 ( .INP(n11), .ZN(n54) );
  INVX0 U49 ( .INP(n2), .ZN(n55) );
  AOI222X1 U50 ( .IN1(n21), .IN2(mode[1]), .IN3(n53), .IN4(mode[0]), .IN5(n54), 
        .IN6(n23), .QN(n56) );
  OAI222X1 U51 ( .IN1(n55), .IN2(n30), .IN3(n8), .IN4(n56), .IN5(stop), .IN6(
        n29), .QN(n52) );
endmodule

