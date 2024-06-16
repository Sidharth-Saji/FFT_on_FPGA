// 4 Point FFT Clockedge Triggered

module point_4(
  input [15:0]X0_Real,
  input	[15:0]X0_Im,
  input [15:0]X1_Real,
  input [15:0]X1_Im,
  input [15:0]X2_Real,
  input	[15:0]X2_Im,
  input [15:0]X3_Real,
  input [15:0]X3_Im,
  output reg [15:0]O_X0_Real,
  output reg [15:0]O_X0_Im,
  output reg [15:0]O_X1_Real,
  output reg [15:0]O_X1_Im,
  output reg [15:0]O_X2_Real,
  output reg [15:0]O_X2_Im,
  output reg [15:0]O_X3_Real,
  output reg [15:0]O_X3_Im
);
  

  reg [15:0]O_X0_Inter_Real;
  reg [15:0]O_X0_Inter_Im;
  reg [15:0]O_X1_Inter_Real;
  reg [15:0]O_X1_Inter_Im;
  reg [15:0]O_X2_Inter_Real;
  reg [15:0]O_X2_Inter_Im;
  reg [15:0]O_X3_Inter_Real;
  reg [15:0]O_X3_Inter_Im;
  
  
  
  butterfly bf_4_1(
    .k(3'd0),
    .Data_A_Real(X0_Real),
    .Data_A_Im(X0_Im),
    .Data_B_Real(X2_Real),
    .Data_B_Im(X2_Im),
    .O_A_Real(O_X0_Inter_Real),
    .O_A_Im(O_X0_Inter_Im),
    .O_B_Real(O_X2_Inter_Real),
    .O_B_Im(O_X2_Inter_Im)
  );
  
  butterfly bf_4_2(
    .k(3'd4),
    .Data_A_Real(X1_Real),
    .Data_A_Im(X1_Im),
    .Data_B_Real(X3_Real),
    .Data_B_Im(X3_Im),
    .O_A_Real(O_X1_Inter_Real),
    .O_A_Im(O_X1_Inter_Im),
    .O_B_Real(O_X3_Inter_Real),
    .O_B_Im(O_X3_Inter_Im)
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
    end

endmodule 
