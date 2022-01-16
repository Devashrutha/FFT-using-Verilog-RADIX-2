`timescale 1 ns/1 ns
module dit_fft_8(clk,sel,yr,yi);
input clk;
input [2:0] sel;
output reg [8:0] yr,yi;
wire [8:0] y0r,y1r,y2r,y3r,y4r,y5r,y6r,y7r,y0i,y1i,y2i,y3i,y4i,y5i,y6i,y7i;
wire [8:0] in20r,in20i,in21r,in21i,in22r,in22i,in23r,in23i,in24r,in24i,in25r,in25i,in26r,in26i,in27r,in27i;
wire [8:0] in10r,in10i,in11r,in11i,in12r,in12i,in13r,in13i,in14r,in14i,in15r,in15i,in16r,in16i,in17r,in17i;
wire [8:0] in0,in1,in2,in3,in4,in5,in6,in7;
parameter w0r=9'b1;
parameter w0i=9'b0;
parameter w1r=9'b010110101;                                        //0.707=0.10110101      
parameter w1i=9'b101001011;                                        //-0.707=1.01001011     
parameter w2r=9'b0;
parameter w2i=9'b111111111;                                        //-1(2's compliment)
parameter w3r=9'b101001011;                                        //-0.707=1.01001011
parameter w3i=9'b101001011;                                        //-0.707=1.01001011
//INPUT
assign in0=9'b1;                                                   //1
assign in1=9'b1;                                                   //1
assign in2=9'b1;                                                   //1
assign in3=9'b1;                                                   //1
assign in4=9'b1;                                                   //1
assign in5=9'b1;                                                   //1
assign in6=9'b1;                                                   //1
assign in7=9'b1;                                                   //1
//STAGE 1
bfly2_4 s11(in0,in4,w0r,w0i,in10r,in10i,in11r,in11i);              //1st 2 point DFT
bfly2_4 s12(in2,in6,w0r,w0i,in12r,in12i,in13r,in13i);              //2st 2 point DFT
bfly2_4 s13(in1,in5,w0r,w0i,in14r,in14i,in15r,in15i);              //3st 2 point DFT
bfly2_4 s14(in3,in7,w0r,w0i,in16r,in16i,in17r,in17i);              //4st 2 point DFT
//STAGE 2
bfly2_4 s21(in10r,in12r,w0r,w0i,in20r,in20i,in22r,in22i);
bfly2_4 s22(in11r,in13r,w2r,w2i,in21r,in21i,in23r,in23i);
bfly2_4 s23(in14r,in16r,w0r,w0i,in24r,in24i,in26r,in26i);
bfly2_4 s24(in15r,in17r,w2r,w2i,in25r,in25i,in27r,in27i);

//STAGE 3
bfly2_4 s31(in20r,in24r,w0r,w0i,y0r,y0i,y4r,y4i);
bfly4_4 s32(in21r,in21i,in25r,in25i,w1r,w1i,y1r,y1i,y5r,y5i);
bfly2_4 s33(in22r,in26r,w2r,w2i,y2r,y2i,y6r,y6i);
bfly4_4 s34(in23r,in23i,in27r,in27i,w3r,w3i,y3r,y3i,y7r,y7i);
  
always@(posedge clk)
case(sel)
0:begin yr=y0r; yi=y0i; end
1:begin yr=y1r; yi=y1i; end
2:begin yr=y2r; yi=y2i; end
3:begin yr=y3r; yi=y3i; end
4:begin yr=y4r; yi=y4i; end
5:begin yr=y5r; yi=y5i; end
6:begin yr=y6r; yi=y6i; end
7:begin yr=y7r; yi=y7i; end
endcase
endmodule

module bfly2_4(in,y,wr,wi,in0r,in0i,in1r,in1i);
input signed [8:0]in,y;
input signed [8:0]wr,wi;
output[8:0]in0r,in0i,in1r,in1i;
wire [17:0]p1,p2;
assign p1=wr*y;
assign p2=wi*y;
assign in0r=in+p1[8:0];
assign in0i=p2[8:0];
assign in1r=in-p1[8:0];
assign in1i=-p2[8:0];
endmodule

module bfly4_4(inr,ini,yr,yi,wr,wi,in0r,in0i,in1r,in1i);
input signed [8:0]inr,ini,yr,yi;
input signed [8:0]wr,wi;
output [8:0]in0r,in0i,in1r,in1i;
wire [17:0]p1,p2,p3,p4;
assign p1=wr*yr;
assign p2=wi*yi;
assign p3=wr*yi;
assign p4=wi*yr;
assign in0r=inr+p1[17:8]-p2[17:8];
assign in0i=ini+p3[17:8]+p4[17:8];
assign in1r=inr-p1[17:8]+p2[17:8];
assign in1i=ini-p3[17:8]-p4[17:8];
endmodule
