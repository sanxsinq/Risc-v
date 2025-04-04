module INSTR_MEM(
    input [31:0] A,
    input rst,
    output wire [31:0] RD
);
reg [31:0] mem[1023:0];
assign RD = (rst== 1'b0) ? 32'b0 : mem[A];
endmodule