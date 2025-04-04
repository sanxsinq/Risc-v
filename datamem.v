module datamem(
    input clk, WE,
    input[31:0] A, WD,
    output [31:0] RD
);
reg [31:0] datamem[1023:0];
assign RD = (WE == 1'b0) ? datamem[A] : 32'b0;
always @(posedge clk) begin
    if (WE) begin
      datamem[31] <= WD;
    end
end
endmodule