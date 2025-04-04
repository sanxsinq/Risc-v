module programcounter(
    input [31:0] Pcnext,
    input rst, clk,
    output reg [31:0] PC
);
always @(posedge clk) begin
  if (rst == 1'b0) begin
       PC = 32'b0;
    end
  else begin
       PC <= Pcnext;
    end      
end
endmodule