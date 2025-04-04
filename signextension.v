module signextension(
    input [31:0] Imm,
    output [31:0] IMMext
);
assign IMMext = (Imm [31]) ? {{20'b1}, Imm[31:20]}:
                             {{20'b1}, Imm[31:20]};

endmodule