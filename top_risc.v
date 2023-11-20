module top_risc (input clk , rst);

wire zf ,  funct7b5 , MemWr , ALUSrc , RegWr ;
wire [6:0] op ; 
wire [2:0] funct3 , ALUCon ;
wire [1:0] PCSrc , ResSrc , ImmSrc ; 

con UC ( zf, funct7b5 , op , funct3, MemWr, ALUSrc , RegWr , PCSrc , ResSrc , ImmSrc , ALUCon );
datapath UD ( clk, rst, PCSrc, ResSrc , ImmSrc, MemWr, ALUSrc, RegWr, ALUCon, zf , funct7b5,  op , funct3 );

endmodule