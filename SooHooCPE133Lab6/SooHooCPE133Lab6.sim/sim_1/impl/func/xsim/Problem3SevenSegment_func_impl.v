// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Tue Mar  2 02:03:45 2021
// Host        : DESKTOP-UKFSNKU running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/jtsoo/SooHooCPE133Lab6/SooHooCPE133Lab6.sim/sim_1/impl/func/xsim/Problem3SevenSegment_func_impl.v
// Design      : Problem3SevenSegment
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module FourTo7SegementDecoder
   (D,
    Din_IBUF);
  output [6:0]D;
  input [3:0]Din_IBUF;

  wire [6:0]D;
  wire [3:0]Din_IBUF;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0929)) 
    \ledOut[0]_i_1 
       (.I0(Din_IBUF[2]),
        .I1(Din_IBUF[3]),
        .I2(Din_IBUF[1]),
        .I3(Din_IBUF[0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h2832)) 
    \ledOut[1]_i_1 
       (.I0(Din_IBUF[0]),
        .I1(Din_IBUF[3]),
        .I2(Din_IBUF[1]),
        .I3(Din_IBUF[2]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h10F4)) 
    \ledOut[2]_i_1 
       (.I0(Din_IBUF[1]),
        .I1(Din_IBUF[2]),
        .I2(Din_IBUF[0]),
        .I3(Din_IBUF[3]),
        .O(D[2]));
  LUT4 #(
    .INIT(16'h9294)) 
    \ledOut[3]_i_1 
       (.I0(Din_IBUF[1]),
        .I1(Din_IBUF[2]),
        .I2(Din_IBUF[0]),
        .I3(Din_IBUF[3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hC140)) 
    \ledOut[4]_i_1 
       (.I0(Din_IBUF[0]),
        .I1(Din_IBUF[2]),
        .I2(Din_IBUF[3]),
        .I3(Din_IBUF[1]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h8C48)) 
    \ledOut[5]_i_1 
       (.I0(Din_IBUF[1]),
        .I1(Din_IBUF[2]),
        .I2(Din_IBUF[0]),
        .I3(Din_IBUF[3]),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0006)) 
    \ledOut[6]_i_1 
       (.I0(Din_IBUF[0]),
        .I1(Din_IBUF[2]),
        .I2(Din_IBUF[3]),
        .I3(Din_IBUF[1]),
        .O(D[6]));
endmodule

(* ECO_CHECKSUM = "f136f328" *) 
(* NotValidForBitStream *)
module Problem3SevenSegment
   (clk,
    Din,
    sANO,
    sLED);
  input clk;
  input [15:0]Din;
  output [3:0]sANO;
  output [6:0]sLED;

  wire [15:0]Din;
  wire [15:12]Din_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [6:0]dOut0;
  wire [3:0]sANO;
  wire [6:0]sLED;
  wire [6:0]sLED_OBUF;

  IBUF \Din_IBUF[12]_inst 
       (.I(Din[12]),
        .O(Din_IBUF[12]));
  IBUF \Din_IBUF[13]_inst 
       (.I(Din[13]),
        .O(Din_IBUF[13]));
  IBUF \Din_IBUF[14]_inst 
       (.I(Din[14]),
        .O(Din_IBUF[14]));
  IBUF \Din_IBUF[15]_inst 
       (.I(Din[15]),
        .O(Din_IBUF[15]));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  FourTo7SegementDecoder display1
       (.D(dOut0),
        .Din_IBUF(Din_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \ledOut_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(dOut0[0]),
        .Q(sLED_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ledOut_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(dOut0[1]),
        .Q(sLED_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ledOut_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(dOut0[2]),
        .Q(sLED_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ledOut_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(dOut0[3]),
        .Q(sLED_OBUF[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ledOut_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(dOut0[4]),
        .Q(sLED_OBUF[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ledOut_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(dOut0[5]),
        .Q(sLED_OBUF[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ledOut_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(dOut0[6]),
        .Q(sLED_OBUF[6]),
        .R(1'b0));
  OBUF \sANO_OBUF[0]_inst 
       (.I(1'b1),
        .O(sANO[0]));
  OBUF \sANO_OBUF[1]_inst 
       (.I(1'b1),
        .O(sANO[1]));
  OBUF \sANO_OBUF[2]_inst 
       (.I(1'b1),
        .O(sANO[2]));
  OBUF \sANO_OBUF[3]_inst 
       (.I(1'b0),
        .O(sANO[3]));
  OBUF \sLED_OBUF[0]_inst 
       (.I(sLED_OBUF[0]),
        .O(sLED[0]));
  OBUF \sLED_OBUF[1]_inst 
       (.I(sLED_OBUF[1]),
        .O(sLED[1]));
  OBUF \sLED_OBUF[2]_inst 
       (.I(sLED_OBUF[2]),
        .O(sLED[2]));
  OBUF \sLED_OBUF[3]_inst 
       (.I(sLED_OBUF[3]),
        .O(sLED[3]));
  OBUF \sLED_OBUF[4]_inst 
       (.I(sLED_OBUF[4]),
        .O(sLED[4]));
  OBUF \sLED_OBUF[5]_inst 
       (.I(sLED_OBUF[5]),
        .O(sLED[5]));
  OBUF \sLED_OBUF[6]_inst 
       (.I(sLED_OBUF[6]),
        .O(sLED[6]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
