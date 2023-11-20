module pc_u  (input clk , rst , input [31:0] pcnext , output reg [31:0] pc);
always @(posedge clk ) 
    if (rst) pc = 0;
    else     pc = pcnext ; 
endmodule