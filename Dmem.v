// 1KB 32-bit aligned RAM with Asynchronous Read 
module Dmem #(parameter n=10 , d=32)
            (input clk , we , [d-1:0] wd , [n-1:0] a,
             output  [d-1:0] rd); 
reg [d-1:0] mem [(2**n)-1:0];

always @(posedge(clk)) 
// Synchronous write
if (we)  mem[a[9:2]] = wd ;


// asynchronous Read
assign rd = mem[a[9:2]] ;
endmodule