module mux4x1 #(parameter n =32 ) 
               (input [n-1:0] x0 , x1 , x2 , x3 , input [1:0] s , output [n-1:0] f);

assign f = (s==2'b00) ? x0 :
           (s==2'b01) ? x1 :
           (s==2'b10) ? x2 : x3 ;
endmodule