// 00 I-Type , 01 S-Type , 10 B-Type , 11 J-Type

module extend (input [1:0] ImmSrc , [31:7] instr, output [31:0] ImmExt  );
 assign  ImmExt = (ImmSrc==2'b00) ? {{20{instr[31]}}, instr[31:20]}: 
                  (ImmSrc==2'b01) ? {{20{instr[31]}}, instr[31:25], instr[11:7]} :
                  (ImmSrc==2'b10) ? {{19{instr[31]}}, instr[31], instr[7], instr[30:25],instr[11:8], 1'b0}:
                  {{12{instr[31]}}, instr[19:12], instr[20],instr[30:21], 1'b0} ;  
    
endmodule