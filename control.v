module con (input  zf, funct7b5 , [6:0] op , [2:0] funct3,
            output MemWr, ALUSrc , Regwr , 
            output [1:0] PCSrc , [1:0]ResSrc ,  [1:0] ImmSrc , [2:0] ALUCon );


wire branch , jump , jumpr  ;
wire [1:0] ALUOp ;

assign PCSrc[1] = jumpr ;
assign PCSrc [0] = ( (zf ^ funct3[0]) & branch ) | jump ;

main_dec UC0 (op , branch , jump , jumpr , MemWr, ALUSrc , Regwr , ResSrc , ImmSrc , ALUOp );
alu_dec  UC1 (funct7b5 , op[5] , funct3 , ALUOp , ALUCon); 

endmodule 