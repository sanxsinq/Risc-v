module registerfile(
    input clk, rst,
    input [4:0] A1, A2, A3,
    input [31:0] WD3,
    output [31:0] RD1, RD2
);
reg [31:0] register[31:0];
assign RD1 = (!rst) ? 32'b00000000 : register[A1];
assign RD2 = (!rst) ? 32'b00000000 : register[A2];
always @(posedge clk ) begin
if (rst) begin 
   register[31] <= WD3;
   end 
end  


endmodule