module singlecycletb();
reg clk = 1'b1 , rst;
singlecycletop singlecycletop(
    .rst(rst),
    .clk(clk)
);
always 
begin  
      clk=~clk;
      #10;
end
initial begin
    rst = 1'b0;
    #20;
    rst = 1'b1;
    #25;
    $finish;
end
initial begin 
   $dumpfile("single.vcd");
   $dumpvars(0, singlecycletb);
end

endmodule