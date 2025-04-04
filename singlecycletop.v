`include "registerfile.v"
`include "signextension.v"
`include "ALU.v"
`include "maindecoder.v"
`include "ALUdecoder.v" 
`include "datamem.v"
`include "PC+.v"
`include "programcounter.v"
`include "INSTR_MEM.v"
module singlecycletop(
    input clk, rst
);
wire[31:0] PC_top, RD_INSTR, RD1_top, IMMext_top, ALUresult, readdata,PCPlus4;
wire[2:0] ALUcontrol_top;
 programcounter programcounter(
    .Pcnext(PCPlus4),
    .rst(rst),
    .clk(clk),
    .PC(PC_top)
 );
 PCplus PCplus(
    .a(PC_top),
    .b(32'd4),
    .c(PCPlus4)
 );
INSTR_MEM INSTR_MEM(
     .A(PC),
     .RD(RD_INSTR),
     .rst(rst)
);
registerfile registerfile(
     .clk(clk),
     .rst(rst),
     .A1(RD_INSTR[19:15]),
     .A2(),
     .A3(RD_INSTR[11:7]),
     .WD3(readdata),
     .RD1(RD1_top),
     .RD2()
);
signextension signextension(
    .Imm(RD_INSTR),
    .IMMext(IMMext_top)
);
ALU ALU(
    .A(RD1_top),
    .B(IMMext_top),
    .ALUcontrol(ALUcontrol_top),
    .Y(ALUresult),
    .zero(zero),
    .neg(neg),
    .carry(carry),
    .over(over)
);
maindecoder maindecoder(
    .zero(),
    .op(RD_INSTR[6:0]),
    .Regwrite(Regwrite), 
    .Memwrite(), 
    .Resultsrc(), 
    .Branch(),
    .ALUsrc(), 
    .PCsrc(),
    .Immsrc(), 
    .ALUop(ALUcontrol_top)
);
ALUcontrol ALUcontrol(
    .ALUop(), 
    .op5(), 
    .fun5(),
    .fun3(RD_INSTR[14:12]),
    .ALUcontrol()
);
datamem datamem(
    .clk(clk), 
    .WE(),
    .A(),
    .RD()
);
endmodule