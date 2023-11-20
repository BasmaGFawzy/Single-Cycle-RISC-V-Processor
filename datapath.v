module datapath (input  clk, rst, 
                 input  [1:0] PCSrc, ResSrc , ImmSrc,
                 input  MemWr, ALUSrc, RegWr,
                 input  [2:0] ALUCon,
                 output zf ,funct7b5, [6:0] op , [2:0] funct3 );

reg [31:0] Instr , Result , RD1, RD2 , ImmExt, ScrcB , ALURes , ReadData ;
reg [31:0] PC, PC4 , PCTarget , PCNext ;

Imem UDimem (PC[9:0] , Instr);
assign funct3  = Instr[14:12] ;
assign op      = Instr[6:0] ;
assign funct7b5 = Instr[30]; 



reg_file UDreg (clk , RegWr , Result , Instr[19:15] , Instr [24:20] , Instr[11:7] , RD1 , RD2);
extend UDext (ImmSrc , Instr[31:7] , ImmExt);
mux2x1 UDmux1 (RD2 , ImmExt , ALUSrc , ScrcB ); 
alu UDalu (ALUCon, RD1 , ScrcB , zf , ALURes) ; 
Dmem UDdmem (clk , MemWr , RD2 , ALURes[9:0] , ReadData) ;
mux4x1 UDmux2 (PC4 , ALURes , ReadData ,  , ResSrc, Result); 
mux4x1 UDmux3 (PC4 , PCTarget , ALURes, , PCSrc ,PCNext) ; 
pcadd4 UDpc4 (PC , PC4); 
pc_u UDpc (clk , rst , PCNext , PC); 
pcadd UDpcadd (PC , ImmExt , PCTarget) ; 
endmodule