module alu_dec (input  funct7b5 , op_5, [2:0] funct3 , [1:0] ALUOp,   
                output reg [2:0] ALUCon );

always@(*)
case (ALUOp) 
2'b00:  ALUCon = 3'b010 ; 
2'b01:  ALUCon = 3'b110 ; 
2'b10:  if    (funct3==3'b111) ALUCon = 3'b000 ; 
     else if  (funct3==3'b110) ALUCon = 3'b001 ; 
     else if  (funct3==3'b000 &&  op_5 && !funct7b5) ALUCon = 3'b010 ; 
     else if  (funct3==3'b000 &&  op_5 &&  funct7b5) ALUCon = 3'b110 ; 
     else if  (funct3==3'b000 && !op_5 )            ALUCon = 3'b010 ; 
default: ALUCon = 3'bxxx ; 
endcase

endmodule