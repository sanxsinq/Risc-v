module ALUcontrol( 
    input ALUop, op5, fun5,
    input [2:0] fun3,
    output [2:0] ALUcontrol
);
wire [1:0] concatecation;
assign concatecation = {op5,fun3};

assign ALUcontrol = (ALUop == 2'b00) ? 3'b000 : (ALUop == 2'b01) ? 3'b001 :
                    ((ALUop == 2'b10) & (fun3 == 3'b010)) ? 3'b101:
                    ((ALUop == 2'b10) & (fun3 == 3'b110)) ? 3'b011:
                    ((ALUop == 2'b10) & (fun3 == 3'b111)) ? 3'b010:
                    (((ALUop == 2'b10) & (fun3 == 3'b111)) & (concatecation == 2'b11)) ? 3'b000:
                    (((ALUop == 2'b10) & (fun3 == 3'b111)) & (concatecation == 2'b11)) ? 3'b001: 3;

endmodule