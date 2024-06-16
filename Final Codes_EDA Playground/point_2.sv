// 2 Point FFT Clockedge Triggered

module point_2(
  input [15:0]X0_Real,
  input	[15:0]X0_Im,
  input [15:0]X1_Real,
  input [15:0]X1_Im,
  output reg [15:0]O_X0_Real,
  output reg [15:0]O_X0_Im,
  output reg [15:0]O_X1_Real,
  output reg [15:0]O_X1_Im
);
  

  reg [15:0]O_X0_Inter_Real;
  reg [15:0]O_X0_Inter_Im;
  reg [15:0]O_X1_Inter_Real;
  reg [15:0]O_X1_Inter_Im;
  
  
  
  butterfly point_2(
    .k(3'd0),
    .Data_A_Real(X0_Real),
    .Data_A_Im(X0_Im),
    .Data_B_Real(X1_Real),
    .Data_B_Im(X1_Im),
    .O_A_Real(O_X0_Inter_Real),
    .O_A_Im(O_X0_Inter_Im),
    .O_B_Real(O_X1_Inter_Real),
    .O_B_Im(O_X1_Inter_Im)
  );
  
  always @(*)
    begin
      O_X0_Real <= O_X0_Inter_Real;
      O_X0_Im <= O_X0_Inter_Im;
      O_X1_Real <= O_X1_Inter_Real;
      O_X1_Im <= O_X1_Inter_Im;
    end

endmodule 
