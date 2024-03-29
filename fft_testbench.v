`timescale 1ns/1ns 
module testbench; 
reg clk;
reg [2:0] sel;
wire [8:0] yr,yi;
dit_fft_8 dit_fft_8_test(.clk(clk),.sel(sel),.yr(yr),.yi(yi)); 
initial
begin clk = 0;
end 
always 
begin
//TOGGLE CLOCK EVERY 5ns
#5
clk = ~clk;
end
initial 
begin
sel = 3'b000;#10 
sel = 3'b001;#10 
sel = 3'b010;#10 
sel = 3'b011;#10 
sel = 3'b100;#10 
sel = 3'b101;#10 
sel = 3'b110;#10 
sel = 3'b111;
end 
initial begin
$dumpfile("dump1.vcd");
$dumpvars;
#10000 $finish;
end
  
endmodule
