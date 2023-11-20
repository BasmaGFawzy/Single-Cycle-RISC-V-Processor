module main_dec (input [6:0] op ,
                 output     branch , jump , jumpr ,
                 output reg MemWr, ALUSrc , Regwr , 
                 output reg [1:0] ResSrc , [1:0] ImmSrc , [1:0] ALUOp); 

assign branch = (op==7'd99) ? 1'b1 : 1'b0 ;
assign jump   = (op==7'd111)? 1'b1 : 1'b0 ;
assign jumpr  = (op==7'd103)? 1'b1 : 1'b0 ;

always@(*)
case (op)

7'd3 : begin 
Regwr  = 1'b1; 
ImmSrc = 2'b00; 
ALUSrc = 1'b1; 
MemWr  = 1'b0; 
ResSrc = 2'b10;
ALUOp  = 2'b00 ; 
end 

7'd19 : begin 
Regwr  = 1'b1; 
ImmSrc = 2'b00; 
ALUSrc = 1'b1; 
MemWr  = 1'bx; 
ResSrc = 2'b01;
ALUOp  = 2'b10 ; 
end 

7'd35 : begin 
Regwr  = 1'b0; 
ImmSrc = 2'b01; 
ALUSrc = 1'b1; 
MemWr  = 1'b1; 
ResSrc = 2'bxx;
ALUOp  = 2'b00 ; 
end 

7'd51 : begin 
Regwr  = 1'b1; 
ImmSrc = 2'bxx; 
ALUSrc = 1'b0; 
MemWr  = 1'bx; 
ResSrc = 2'b01;
ALUOp  = 2'b10;
end

7'd99 : begin 
Regwr  = 1'b0; 
ImmSrc = 2'b10; 
ALUSrc = 1'b0; 
MemWr  = 1'bx; 
ResSrc = 2'bxx;
ALUOp  = 2'b01;
end

7'd103 : begin 
Regwr  = 1'b1; 
ImmSrc = 2'b00; 
ALUSrc = 1'b1; 
MemWr  = 1'bx; 
ResSrc = 2'b00;
ALUOp  = 2'b00;
end

7'd111 : begin 
Regwr  = 1'b1; 
ImmSrc = 2'b11; 
ALUSrc = 1'bx; 
MemWr  = 1'bx; 
ResSrc = 2'b00;
ALUOp  = 2'bxx;
end 

default: begin
Regwr  = 1'bx; 
ImmSrc = 2'bxx; 
ALUSrc = 1'bx; 
MemWr  = 1'bx; 
ResSrc = 2'bxx;
ALUOp  = 2'bxx;
end 

endcase
endmodule