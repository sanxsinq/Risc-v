module ALU(
    input [31:0] A, B,
    input [2:0] ALUcontrol,
    output [31:0] Y,
    output zero,neg,carry,over
);
 wire [31:0] a_and_b;
 wire [31:0] a_or_b;
 wire [31:0] not_b;
 wire [31:0] mux_1;
 wire [31:0] sum;
 wire [31:0] mux_2;
 wire [31:0] cout;
 wire [31:0] SLT;
assign a_and_b = A & B;
assign a_or_b = A | B;
assign not_b = ~B;
assign mux_1 = (ALUcontrol[0] == 1'b0) ? B : not_b;
assign sum = A + mux_1;
assign SLT = {31'h0 , sum[31]};
assign mux_2 = (ALUcontrol [2:0] == 3'b010) ? sum:
               (ALUcontrol [2:0] == 3'b011) ? sum:
               (ALUcontrol [2:0] == 3'b100) ? a_and_b | a_or_b:
               (ALUcontrol [2:0] == 3'b111) ? SLT : 31'h00000000; 
assign Y = mux_2;
assign zero = &(~Y);
assign neg = Y[31];
assign carry = (cout & (~ALUcontrol[1]));
assign over = ((~(ALUcontrol[0] & A[31] & B[31])) & (sum[31] ^ A[31]) & (~ ALUcontrol[1]));
endmodule
