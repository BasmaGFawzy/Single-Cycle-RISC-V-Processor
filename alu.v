module alu #(parameter d = 32) (input [2:0] ALUcon , [d-1:0] srcA, srcB, output zf , reg [d-1:0] ALUres);

assign zf = (!ALUres) ? 1 : 0 ;

always @(*)
case (ALUcon) 
3'b000  : ALUres = srcA & srcB ;
3'b001  : ALUres = srcA | srcB ;
3'b010  : ALUres = srcA + srcB ;
3'b110  : ALUres = srcA - srcB ;
default : ALUres = {d{1'bx}} ;
endcase
endmodule