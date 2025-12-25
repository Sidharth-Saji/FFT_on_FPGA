// 2 Point FFT Clockedge Triggered
module point_16(
  input [15:0]X0_Real,
  input	[15:0]X0_Im,
  input [15:0]X1_Real,
  input [15:0]X1_Im,
  input [15:0]X2_Real,
  input	[15:0]X2_Im,
  input [15:0]X3_Real,
  input [15:0]X3_Im,
  input [15:0]X4_Real,
  input	[15:0]X4_Im,
  input [15:0]X5_Real,
  input [15:0]X5_Im,
  input [15:0]X6_Real,
  input	[15:0]X6_Im,
  input [15:0]X7_Real,
  input [15:0]X7_Im,
  input [15:0]X8_Real,
  input	[15:0]X8_Im,
  input [15:0]X9_Real,
  input [15:0]X9_Im,
  input [15:0]X10_Real,
  input	[15:0]X10_Im,
  input [15:0]X11_Real,
  input [15:0]X11_Im,
  input [15:0]X12_Real,
  input	[15:0]X12_Im,
  input [15:0]X13_Real,
  input [15:0]X13_Im,
  input [15:0]X14_Real,
  input	[15:0]X14_Im,
  input [15:0]X15_Real,
  input [15:0]X15_Im,
  output reg [15:0]O_X0_Real,
  output reg [15:0]O_X0_Im,
  output reg [15:0]O_X1_Real,
  output reg [15:0]O_X1_Im,
  output reg [15:0]O_X2_Real,
  output reg [15:0]O_X2_Im,
  output reg [15:0]O_X3_Real,
  output reg [15:0]O_X3_Im,
  output reg [15:0]O_X4_Real,
  output reg [15:0]O_X4_Im,
  output reg [15:0]O_X5_Real,
  output reg [15:0]O_X5_Im,
  output reg [15:0]O_X6_Real,
  output reg [15:0]O_X6_Im,
  output reg [15:0]O_X7_Real,
  output reg [15:0]O_X7_Im,
  output reg [15:0]O_X8_Real,
  output reg [15:0]O_X8_Im,
  output reg [15:0]O_X9_Real,
  output reg [15:0]O_X9_Im,
  output reg [15:0]O_X10_Real,
  output reg [15:0]O_X10_Im,
  output reg [15:0]O_X11_Real,
  output reg [15:0]O_X11_Im,
  output reg [15:0]O_X12_Real,
  output reg [15:0]O_X12_Im,
  output reg [15:0]O_X13_Real,
  output reg [15:0]O_X13_Im,
  output reg [15:0]O_X14_Real,
  output reg [15:0]O_X14_Im,
  output reg [15:0]O_X15_Real,
  output reg [15:0]O_X15_Im
);
  

  reg [15:0]O_X0_Inter_Real;
  reg [15:0]O_X0_Inter_Im;
  reg [15:0]O_X1_Inter_Real;
  reg [15:0]O_X1_Inter_Im;
  reg [15:0]O_X2_Inter_Real;
  reg [15:0]O_X2_Inter_Im;
  reg [15:0]O_X3_Inter_Real;
  reg [15:0]O_X3_Inter_Im;
  reg [15:0]O_X4_Inter_Real;
  reg [15:0]O_X4_Inter_Im;
  reg [15:0]O_X5_Inter_Real;
  reg [15:0]O_X5_Inter_Im;
  reg [15:0]O_X6_Inter_Real;
  reg [15:0]O_X6_Inter_Im;
  reg [15:0]O_X7_Inter_Real;
  reg [15:0]O_X7_Inter_Im;
  reg [15:0]O_X8_Inter_Real;
  reg [15:0]O_X8_Inter_Im;
  reg [15:0]O_X9_Inter_Real;
  reg [15:0]O_X9_Inter_Im;
  reg [15:0]O_X10_Inter_Real;
  reg [15:0]O_X10_Inter_Im;
  reg [15:0]O_X11_Inter_Real;
  reg [15:0]O_X11_Inter_Im;
  reg [15:0]O_X12_Inter_Real;
  reg [15:0]O_X12_Inter_Im;
  reg [15:0]O_X13_Inter_Real;
  reg [15:0]O_X13_Inter_Im;
  reg [15:0]O_X14_Inter_Real;
  reg [15:0]O_X14_Inter_Im;
  reg [15:0]O_X15_Inter_Real;
  reg [15:0]O_X15_Inter_Im;
  
  
  
  butterfly bf_16_1(
    .k(3'd0),
    .Data_A_Real(X0_Real),
    .Data_A_Im(X0_Im),
    .Data_B_Real(X8_Real),
    .Data_B_Im(X8_Im),
    .O_A_Real(O_X0_Inter_Real),
    .O_A_Im(O_X0_Inter_Im),
    .O_B_Real(O_X8_Inter_Real),
    .O_B_Im(O_X8_Inter_Im)
  );
  
  butterfly bf_16_2(
    .k(3'd1),
    .Data_A_Real(X1_Real),
    .Data_A_Im(X1_Im),
    .Data_B_Real(X9_Real),
    .Data_B_Im(X9_Im),
    .O_A_Real(O_X1_Inter_Real),
    .O_A_Im(O_X1_Inter_Im),
    .O_B_Real(O_X9_Inter_Real),
    .O_B_Im(O_X9_Inter_Im)
  );
  
  butterfly bf_16_3(
    .k(3'd2),
    .Data_A_Real(X2_Real),
    .Data_A_Im(X2_Im),
    .Data_B_Real(X10_Real),
    .Data_B_Im(X10_Im),
    .O_A_Real(O_X2_Inter_Real),
    .O_A_Im(O_X2_Inter_Im),
    .O_B_Real(O_X10_Inter_Real),
    .O_B_Im(O_X10_Inter_Im)
  );
  
  butterfly bf_16_4(
    .k(3'd3),
    .Data_A_Real(X3_Real),
    .Data_A_Im(X3_Im),
    .Data_B_Real(X11_Real),
    .Data_B_Im(X11_Im),
    .O_A_Real(O_X3_Inter_Real),
    .O_A_Im(O_X3_Inter_Im),
    .O_B_Real(O_X11_Inter_Real),
    .O_B_Im(O_X11_Inter_Im)
  );
  
  butterfly bf_16_5(
    .k(3'd4),
    .Data_A_Real(X4_Real),
    .Data_A_Im(X4_Im),
    .Data_B_Real(X12_Real),
    .Data_B_Im(X12_Im),
    .O_A_Real(O_X4_Inter_Real),
    .O_A_Im(O_X4_Inter_Im),
    .O_B_Real(O_X12_Inter_Real),
    .O_B_Im(O_X12_Inter_Im)
  );
  
  butterfly bf_16_6(
    .k(3'd5),
    .Data_A_Real(X5_Real),
    .Data_A_Im(X5_Im),
    .Data_B_Real(X13_Real),
    .Data_B_Im(X13_Im),
    .O_A_Real(O_X5_Inter_Real),
    .O_A_Im(O_X5_Inter_Im),
    .O_B_Real(O_X13_Inter_Real),
    .O_B_Im(O_X13_Inter_Im)
  );
  
  butterfly bf_16_7(
    .k(3'd6),
    .Data_A_Real(X6_Real),
    .Data_A_Im(X6_Im),
    .Data_B_Real(X14_Real),
    .Data_B_Im(X14_Im),
    .O_A_Real(O_X6_Inter_Real),
    .O_A_Im(O_X6_Inter_Im),
    .O_B_Real(O_X14_Inter_Real),
    .O_B_Im(O_X14_Inter_Im)
  );
  
  butterfly bf_16_8(
    .k(3'd7),
    .Data_A_Real(X7_Real),
    .Data_A_Im(X7_Im),
    .Data_B_Real(X15_Real),
    .Data_B_Im(X15_Im),
    .O_A_Real(O_X7_Inter_Real),
    .O_A_Im(O_X7_Inter_Im),
    .O_B_Real(O_X15_Inter_Real),
    .O_B_Im(O_X15_Inter_Im)
  );
  
  always @(*)
    begin
      O_X0_Real <= O_X0_Inter_Real;
      O_X0_Im <= O_X0_Inter_Im;
      O_X1_Real <= O_X1_Inter_Real;
      O_X1_Im <= O_X1_Inter_Im;
      O_X2_Real <= O_X2_Inter_Real;
      O_X2_Im <= O_X2_Inter_Im;
      O_X3_Real <= O_X3_Inter_Real;
      O_X3_Im <= O_X3_Inter_Im;
      O_X4_Real <= O_X4_Inter_Real;
      O_X4_Im <= O_X4_Inter_Im;
      O_X5_Real <= O_X5_Inter_Real;
      O_X5_Im <= O_X5_Inter_Im;
      O_X6_Real <= O_X6_Inter_Real;
      O_X6_Im <= O_X6_Inter_Im;
      O_X7_Real <= O_X7_Inter_Real;
      O_X7_Im <= O_X7_Inter_Im;
	  O_X8_Real <= O_X8_Inter_Real;
      O_X8_Im <= O_X8_Inter_Im;
      O_X9_Real <= O_X9_Inter_Real;
      O_X9_Im <= O_X9_Inter_Im;
      O_X10_Real <= O_X10_Inter_Real;
      O_X10_Im <= O_X10_Inter_Im;
      O_X11_Real <= O_X11_Inter_Real;
      O_X11_Im <= O_X11_Inter_Im;
      O_X12_Real <= O_X12_Inter_Real;
      O_X12_Im <= O_X12_Inter_Im;
      O_X13_Real <= O_X13_Inter_Real;
      O_X13_Im <= O_X13_Inter_Im;
      O_X14_Real <= O_X14_Inter_Real;
      O_X14_Im <= O_X14_Inter_Im;
      O_X15_Real <= O_X15_Inter_Real;
      O_X15_Im <= O_X15_Inter_Im;
    end

endmodule 
