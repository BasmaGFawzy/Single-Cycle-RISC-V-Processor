module mux2x1 #(parameter n = 32) 
               (input [n-1:0] x0 , x1 , input s , output [n-1:0] f);
    assign f = (s)? x1 : x0 ;
endmodule 