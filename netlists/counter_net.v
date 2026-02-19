/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09
// Date      : Mon Dec  1 23:43:27 2025
/////////////////////////////////////////////////////////////


module counter_DW01_inc_0 ( A, SUM );
  input [10:0] A;
  output [10:0] SUM;

  wire   [10:2] carry;

  HADDX1 U1_1_9 ( .A0(A[9]), .B0(carry[9]), .C1(carry[10]), .SO(SUM[9]) );
  HADDX1 U1_1_8 ( .A0(A[8]), .B0(carry[8]), .C1(carry[9]), .SO(SUM[8]) );
  HADDX1 U1_1_7 ( .A0(A[7]), .B0(carry[7]), .C1(carry[8]), .SO(SUM[7]) );
  HADDX1 U1_1_6 ( .A0(A[6]), .B0(carry[6]), .C1(carry[7]), .SO(SUM[6]) );
  HADDX1 U1_1_5 ( .A0(A[5]), .B0(carry[5]), .C1(carry[6]), .SO(SUM[5]) );
  HADDX1 U1_1_4 ( .A0(A[4]), .B0(carry[4]), .C1(carry[5]), .SO(SUM[4]) );
  HADDX1 U1_1_3 ( .A0(A[3]), .B0(carry[3]), .C1(carry[4]), .SO(SUM[3]) );
  HADDX1 U1_1_2 ( .A0(A[2]), .B0(carry[2]), .C1(carry[3]), .SO(SUM[2]) );
  HADDX1 U1_1_1 ( .A0(A[1]), .B0(A[0]), .C1(carry[2]), .SO(SUM[1]) );
  INVX0 U1 ( .INP(A[0]), .ZN(SUM[0]) );
  XOR2X1 U2 ( .IN1(carry[10]), .IN2(A[10]), .Q(SUM[10]) );
endmodule


module counter_DW01_inc_1 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HADDX1 U1_1_8 ( .A0(A[8]), .B0(carry[8]), .C1(carry[9]), .SO(SUM[8]) );
  HADDX1 U1_1_7 ( .A0(A[7]), .B0(carry[7]), .C1(carry[8]), .SO(SUM[7]) );
  HADDX1 U1_1_6 ( .A0(A[6]), .B0(carry[6]), .C1(carry[7]), .SO(SUM[6]) );
  HADDX1 U1_1_5 ( .A0(A[5]), .B0(carry[5]), .C1(carry[6]), .SO(SUM[5]) );
  HADDX1 U1_1_4 ( .A0(A[4]), .B0(carry[4]), .C1(carry[5]), .SO(SUM[4]) );
  HADDX1 U1_1_3 ( .A0(A[3]), .B0(carry[3]), .C1(carry[4]), .SO(SUM[3]) );
  HADDX1 U1_1_2 ( .A0(A[2]), .B0(carry[2]), .C1(carry[3]), .SO(SUM[2]) );
  HADDX1 U1_1_1 ( .A0(A[1]), .B0(A[0]), .C1(carry[2]), .SO(SUM[1]) );
  INVX0 U1 ( .INP(A[0]), .ZN(SUM[0]) );
  XOR2X1 U2 ( .IN1(carry[9]), .IN2(A[9]), .Q(SUM[9]) );
endmodule


module counter_DW01_inc_2 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  HADDX1 U1_1_7 ( .A0(A[7]), .B0(carry[7]), .C1(carry[8]), .SO(SUM[7]) );
  HADDX1 U1_1_6 ( .A0(A[6]), .B0(carry[6]), .C1(carry[7]), .SO(SUM[6]) );
  HADDX1 U1_1_5 ( .A0(A[5]), .B0(carry[5]), .C1(carry[6]), .SO(SUM[5]) );
  HADDX1 U1_1_4 ( .A0(A[4]), .B0(carry[4]), .C1(carry[5]), .SO(SUM[4]) );
  HADDX1 U1_1_3 ( .A0(A[3]), .B0(carry[3]), .C1(carry[4]), .SO(SUM[3]) );
  HADDX1 U1_1_2 ( .A0(A[2]), .B0(carry[2]), .C1(carry[3]), .SO(SUM[2]) );
  HADDX1 U1_1_1 ( .A0(A[1]), .B0(A[0]), .C1(carry[2]), .SO(SUM[1]) );
  INVX0 U1 ( .INP(A[0]), .ZN(SUM[0]) );
  XOR2X1 U2 ( .IN1(carry[8]), .IN2(A[8]), .Q(SUM[8]) );
endmodule


module counter_DW01_inc_3 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  HADDX1 U1_1_6 ( .A0(A[6]), .B0(carry[6]), .C1(carry[7]), .SO(SUM[6]) );
  HADDX1 U1_1_5 ( .A0(A[5]), .B0(carry[5]), .C1(carry[6]), .SO(SUM[5]) );
  HADDX1 U1_1_4 ( .A0(A[4]), .B0(carry[4]), .C1(carry[5]), .SO(SUM[4]) );
  HADDX1 U1_1_3 ( .A0(A[3]), .B0(carry[3]), .C1(carry[4]), .SO(SUM[3]) );
  HADDX1 U1_1_2 ( .A0(A[2]), .B0(carry[2]), .C1(carry[3]), .SO(SUM[2]) );
  HADDX1 U1_1_1 ( .A0(A[1]), .B0(A[0]), .C1(carry[2]), .SO(SUM[1]) );
  INVX0 U1 ( .INP(A[0]), .ZN(SUM[0]) );
  XOR2X1 U2 ( .IN1(carry[7]), .IN2(A[7]), .Q(SUM[7]) );
endmodule


module counter ( clk, rst_n, start, stop, mode, counter_out );
  input [1:0] mode;
  output [10:0] counter_out;
  input clk, rst_n, start, stop;
  wire   N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40,
         N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54,
         N55, N56, N57, N58, N59, N60, N61, N62, N63, N64, run, n2, n3, n4, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n30, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48;

  DFFARX1 run_reg ( .D(n32), .CLK(clk), .RSTB(rst_n), .Q(run) );
  DFFARX1 state_reg_10_ ( .D(n33), .CLK(clk), .RSTB(rst_n), .Q(counter_out[10]) );
  AO21X1 U3 ( .IN1(start), .IN2(n46), .IN3(run), .Q(n32) );
  AO22X1 U4 ( .IN1(n2), .IN2(counter_out[10]), .IN3(n3), .IN4(N64), .Q(n33) );
  AND2X1 U5 ( .IN1(n4), .IN2(n44), .Q(n3) );
  OAI21X1 U6 ( .IN1(run), .IN2(start), .IN3(n46), .QN(n2) );
  AO22X1 U7 ( .IN1(n6), .IN2(counter_out[9]), .IN3(n7), .IN4(n44), .Q(n34) );
  AO22X1 U8 ( .IN1(N53), .IN2(n8), .IN3(N63), .IN4(n4), .Q(n7) );
  AO22X1 U11 ( .IN1(n6), .IN2(counter_out[7]), .IN3(n11), .IN4(n44), .Q(n36)
         );
  AO221X1 U12 ( .IN1(N61), .IN2(n4), .IN3(N51), .IN4(n8), .IN5(n12), .Q(n11)
         );
  AO22X1 U13 ( .IN1(N42), .IN2(n10), .IN3(N34), .IN4(n13), .Q(n12) );
  AO22X1 U14 ( .IN1(n6), .IN2(counter_out[6]), .IN3(n14), .IN4(n44), .Q(n37)
         );
  AO221X1 U15 ( .IN1(N60), .IN2(n4), .IN3(N50), .IN4(n8), .IN5(n15), .Q(n14)
         );
  AO22X1 U16 ( .IN1(N41), .IN2(n10), .IN3(N33), .IN4(n13), .Q(n15) );
  AO22X1 U17 ( .IN1(n6), .IN2(counter_out[5]), .IN3(n16), .IN4(n44), .Q(n38)
         );
  AO221X1 U18 ( .IN1(N59), .IN2(n4), .IN3(N49), .IN4(n8), .IN5(n17), .Q(n16)
         );
  AO22X1 U19 ( .IN1(N40), .IN2(n10), .IN3(N32), .IN4(n13), .Q(n17) );
  AO22X1 U20 ( .IN1(n6), .IN2(counter_out[4]), .IN3(n18), .IN4(n44), .Q(n39)
         );
  AO221X1 U21 ( .IN1(N58), .IN2(n4), .IN3(N48), .IN4(n8), .IN5(n19), .Q(n18)
         );
  AO22X1 U22 ( .IN1(N39), .IN2(n10), .IN3(N31), .IN4(n13), .Q(n19) );
  AO22X1 U23 ( .IN1(n6), .IN2(counter_out[3]), .IN3(n20), .IN4(n44), .Q(n40)
         );
  AO221X1 U24 ( .IN1(N57), .IN2(n4), .IN3(N47), .IN4(n8), .IN5(n21), .Q(n20)
         );
  AO22X1 U25 ( .IN1(N38), .IN2(n10), .IN3(N30), .IN4(n13), .Q(n21) );
  AO22X1 U26 ( .IN1(n6), .IN2(counter_out[2]), .IN3(n22), .IN4(n44), .Q(n41)
         );
  AO221X1 U27 ( .IN1(N56), .IN2(n4), .IN3(N46), .IN4(n8), .IN5(n23), .Q(n22)
         );
  AO22X1 U28 ( .IN1(N37), .IN2(n10), .IN3(N29), .IN4(n13), .Q(n23) );
  AO22X1 U29 ( .IN1(n6), .IN2(counter_out[1]), .IN3(n24), .IN4(n44), .Q(n42)
         );
  AO221X1 U30 ( .IN1(N55), .IN2(n4), .IN3(N45), .IN4(n8), .IN5(n25), .Q(n24)
         );
  AO22X1 U31 ( .IN1(N36), .IN2(n10), .IN3(N28), .IN4(n13), .Q(n25) );
  AO22X1 U32 ( .IN1(n6), .IN2(counter_out[0]), .IN3(n26), .IN4(n44), .Q(n43)
         );
  AO221X1 U33 ( .IN1(N54), .IN2(n4), .IN3(N44), .IN4(n8), .IN5(n27), .Q(n26)
         );
  AO22X1 U34 ( .IN1(N35), .IN2(n10), .IN3(N27), .IN4(n13), .Q(n27) );
  NAND3X0 U43 ( .IN1(n45), .IN2(n46), .IN3(run), .QN(n30) );
  counter_DW01_inc_0 add_37 ( .A(counter_out), .SUM({N64, N63, N62, N61, N60, 
        N59, N58, N57, N56, N55, N54}) );
  counter_DW01_inc_1 add_36 ( .A(counter_out[9:0]), .SUM({N53, N52, N51, N50, 
        N49, N48, N47, N46, N45, N44}) );
  counter_DW01_inc_2 add_35 ( .A(counter_out[8:0]), .SUM({N43, N42, N41, N40, 
        N39, N38, N37, N36, N35}) );
  counter_DW01_inc_3 add_34 ( .A(counter_out[7:0]), .SUM({N34, N33, N32, N31, 
        N30, N29, N28, N27}) );
  DFFARX1 state_reg_9_ ( .D(n34), .CLK(clk), .RSTB(rst_n), .Q(counter_out[9])
         );
  DFFARX1 state_reg_7_ ( .D(n36), .CLK(clk), .RSTB(rst_n), .Q(counter_out[7])
         );
  DFFARX1 state_reg_6_ ( .D(n37), .CLK(clk), .RSTB(rst_n), .Q(counter_out[6])
         );
  DFFARX1 state_reg_5_ ( .D(n38), .CLK(clk), .RSTB(rst_n), .Q(counter_out[5])
         );
  DFFARX1 state_reg_4_ ( .D(n39), .CLK(clk), .RSTB(rst_n), .Q(counter_out[4])
         );
  DFFARX1 state_reg_3_ ( .D(n40), .CLK(clk), .RSTB(rst_n), .Q(counter_out[3])
         );
  DFFARX1 state_reg_2_ ( .D(n41), .CLK(clk), .RSTB(rst_n), .Q(counter_out[2])
         );
  DFFARX1 state_reg_1_ ( .D(n42), .CLK(clk), .RSTB(rst_n), .Q(counter_out[1])
         );
  DFFARX1 state_reg_0_ ( .D(n43), .CLK(clk), .RSTB(rst_n), .Q(counter_out[0])
         );
  DFFARX1 state_reg_8_ ( .D(n35), .CLK(clk), .RSTB(rst_n), .Q(counter_out[8])
         );
  AO222X2 U46 ( .IN1(N62), .IN2(n4), .IN3(N43), .IN4(n10), .IN5(N52), .IN6(n8), 
        .Q(n9) );
  AO22X1 U47 ( .IN1(n6), .IN2(counter_out[8]), .IN3(n9), .IN4(n44), .Q(n35) );
  INVX0 U48 ( .INP(n30), .ZN(n44) );
  INVX0 U49 ( .INP(start), .ZN(n45) );
  OA21X1 U50 ( .IN1(n45), .IN2(stop), .IN3(n30), .Q(n6) );
  INVX0 U51 ( .INP(stop), .ZN(n46) );
  NOR2X0 U52 ( .IN1(n47), .IN2(n48), .QN(n4) );
  INVX0 U53 ( .INP(mode[1]), .ZN(n47) );
  NOR2X0 U54 ( .IN1(n48), .IN2(mode[1]), .QN(n10) );
  INVX0 U55 ( .INP(mode[0]), .ZN(n48) );
  NOR2X0 U56 ( .IN1(n47), .IN2(mode[0]), .QN(n8) );
  NOR2X0 U57 ( .IN1(mode[0]), .IN2(mode[1]), .QN(n13) );
endmodule

