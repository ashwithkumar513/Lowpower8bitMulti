`timescale 1ns / 1ps


module main(B,A,PO);

  input [7:0] B;
  input [7:0] A;
output [19:0] PO;

wire [8:0] so2,so3,so11;
wire [19:0] so6,so7,so8;
wire [7:0] so4,so5;
decoderbasedLPM d1(B,A[1],A[0],so11);
decoderbasedLPM d2(B,A[3],A[2],so2);
decoderbasedLPM d3(B,A[5],A[4],so3);
reg [19:0] so22= 20'b0;reg [19:0] so23= 20'b0;reg [19:0] so24= 20'b0;reg [19:0] so25= 20'b0;reg [19:0] so211= 20'b0;
  integer k;
  genvar i;

  generate
    for (i=0;i<8;i=i+1)
      begin
      and  (so4[i],B[i],A[6]);
      end
  endgenerate

  generate
    for (i=0;i<8;i=i+1)
      begin
      and  (so5[i],B[i],A[7]);
      end
  endgenerate
 
always @*
  begin
  so211={so11};
  end
always @*
begin
so22={ so2,2'b00};
end

always @*
begin
so23={so3, 4'b0000};
end
always @*
begin
so24={so4, 6'b000000};
end
always @*
begin
so25={so5, 7'b0000000};
end

N_bit_adder nba1(so211,so22,so6);

N_bit_adder nba2(so6,so23,so7);
N_bit_adder nba3(so7,so24,so8);
N_bit_adder nba4(so8,so25,PO);
endmodule
