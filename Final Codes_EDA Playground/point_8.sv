// 2 Point FFT Clockedge Triggered
module point_8(
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
  output reg [15:0]O_X7_Im
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
  
  
  
  butterfly bf_8_1(
    .k(3'd0),
    .Data_A_Real(X0_Real),
    .Data_A_Im(X0_Im),
    .Data_B_Real(X4_Real),
    .Data_B_Im(X4_Im),
    .O_A_Real(O_X0_Inter_Real),
    .O_A_Im(O_X0_Inter_Im),
    .O_B_Real(O_X4_Inter_Real),
    .O_B_Im(O_X4_Inter_Im)
  );
  
  butterfly bf_8_2(
    .k(3'd2),
    .Data_A_Real(X1_Real),
    .Data_A_Im(X1_Im),
    .Data_B_Real(X5_Real),
    .Data_B_Im(X5_Im),
    .O_A_Real(O_X1_Inter_Real),
    .O_A_Im(O_X1_Inter_Im),
    .O_B_Real(O_X5_Inter_Real),
    .O_B_Im(O_X5_Inter_Im)
  );
  
  butterfly bf_8_3(
    .k(3'd4),
    .Data_A_Real(X2_Real),
    .Data_A_Im(X2_Im),
    .Data_B_Real(X6_Real),
    .Data_B_Im(X6_Im),
    .O_A_Real(O_X2_Inter_Real),
    .O_A_Im(O_X2_Inter_Im),
    .O_B_Real(O_X6_Inter_Real),
    .O_B_Im(O_X6_Inter_Im)
  );
  
  butterfly bf_8_4(
    .k(3'd6),
    .Data_A_Real(X3_Real),
    .Data_A_Im(X3_Im),
    .Data_B_Real(X7_Real),
    .Data_B_Im(X7_Im),
    .O_A_Real(O_X3_Inter_Real),
    .O_A_Im(O_X3_Inter_Im),
    .O_B_Real(O_X7_Inter_Real),
    .O_B_Im(O_X7_Inter_Im)
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
    end

endmodule 
