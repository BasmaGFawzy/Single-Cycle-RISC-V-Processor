module reg_file #(parameter  d = 32) 
            (input clk , wr , [d-1:0] wd , [4:0] a1, a2, a3 ,
             output [d-1:0] rd1 , rd2); 
             
reg [d-1:0] regs [0: 31];
integer i ;

initial
regs[0]=0; 

// asynchronous read + R0 is hardwared to 0
assign rd1 = regs [a1]; 
assign rd2 = regs [a2];

always @(posedge(clk)) begin

if (wr && a3) 
  regs[a3] = wd;
end
endmodule