// 1KB 32-bit ROM Combinational Read 
module Imem #(parameter n=10 , d=32)
            (input [n-1:0] a, output  [d-1:0] rd); 

reg [d-1:0] mem [(2**n)-1:0];

initial 
$readmemh("hexcode.txt",mem);

assign rd = mem[a[n-1:2]];
endmodule