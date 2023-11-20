`timescale 1ps/1ps
`include "top_risc.v"
`include "control.v"
`include "con_alu_dec.v"
`include "con_main_dec.v"
`include "datapath.v"
`include "alu.v"
`include "pc.v"
`include "reg_file.v"
`include "Dmem.v"
`include "Imem.v"
`include "extend.v"
`include "mux2x1.v"
`include "mux4x1.v"
`include "pcadd.v"
`include "pcadd4.v"


module test ();

parameter Tclk =1000; // 1ns 
reg clk = 1'b0 , rst;

top_risc DUT (clk , rst );

initial 
forever #(Tclk/2) clk = ~ clk ;


initial begin
$display ("Test Loading ... ");
rst = 1'b1 ;
//1
#Tclk
if (DUT.UD.UDpc.pc ==0) $display ("rest is Done OK! PC=0 ");
else $display ("rest Failed!");
rst = 1'b0 ;
//2
#Tclk 
$display ("Time= %0d x0=%0d +  5 => x2=%0d",$time, DUT.UD.UDreg.regs[0], DUT.UD.UDreg.regs[2]); 
//3
#Tclk 
$display ("Time= %0d x0= %0d + 12 => x3=%0d",$time, DUT.UD.UDreg.regs[0], DUT.UD.UDreg.regs[3]); 
//4
#Tclk 
$display ("Time= %0d x3=%0d -  9 => x7=%0d",$time, DUT.UD.UDreg.regs[3], DUT.UD.UDreg.regs[7]); 
//5
#Tclk 
$display ("Time= %0d x7=%b OR  x2=%b = x4=%b",$time, DUT.UD.UDreg.regs[7], DUT.UD.UDreg.regs[2], DUT.UD.UDreg.regs[4]); 
// 6 to 14 
#(8*Tclk) 
$display ("Time= %0d Dmem[24]=%0d",$time, DUT.UD.UDdmem.mem[24]); 
// 15 to 19
#(5*Tclk) 
$display ("Time= %0d Dmem[24]=%0d",$time, DUT.UD.UDdmem.mem[23]); 
$stop ; 
end

endmodule