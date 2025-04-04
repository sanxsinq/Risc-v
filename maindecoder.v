module maindecoder (
    input zero,
    input [6:0] op,
    output Regwrite, Memwrite, Resultsrc, Branch, ALUsrc, PCsrc,
    output [1:0] Immsrc, ALUop
);
wire branch;
assign Regwrite = ((op == 7'b0000011) |(op == 7'b0110011)) ? 1'b1 : 1'b0;
assign Memwrite = (op == 7'b0100011) ? 1'b1 : 1'b0;
assign Resultsrc = (op == 7'b0000011) ? 1'b1 : 1'b0;
assign Branch = (op == 7'b1100011) ? 1'b1 : 1'b0;
assign Immsrc = (op == 7'b0100011) ? 2'b01 :(op == 7'b1100011) ? 2'b10 : 2'b00;
assign ALUsrc = ((op == 7'b0100011) | (op == 7'b0000011)) ? 1'b1 :1'b0;
assign ALUop = (op == 7'b0110011) ? 2'b10 : (op == 7'b1100011) ? 2'b01 : 2'b00;
assign PCsrc = zero & branch;
endmodule