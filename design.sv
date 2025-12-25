module FFT(
  input clk,
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
  

  wire [15:0] O_X0_S1_Real;
  wire [15:0] O_X0_S1_Im;
  wire [15:0] O_X1_S1_Real;
  wire [15:0] O_X1_S1_Im;
  wire [15:0] O_X2_S1_Real;
  wire [15:0] O_X2_S1_Im;
  wire [15:0] O_X3_S1_Real;
  wire [15:0] O_X3_S1_Im;
  wire [15:0] O_X4_S1_Real;
  wire [15:0] O_X4_S1_Im;
  wire [15:0] O_X5_S1_Real;
  wire [15:0] O_X5_S1_Im;
  wire [15:0] O_X6_S1_Real;
  wire [15:0] O_X6_S1_Im;
  wire [15:0] O_X7_S1_Real;
  wire [15:0] O_X7_S1_Im;
  wire [15:0] O_X8_S1_Real;
  wire [15:0] O_X8_S1_Im;
  wire [15:0] O_X9_S1_Real;
  wire [15:0] O_X9_S1_Im;
  wire [15:0] O_X10_S1_Real;
  wire [15:0] O_X10_S1_Im;
  wire [15:0] O_X11_S1_Real;
  wire [15:0] O_X11_S1_Im;
  wire [15:0] O_X12_S1_Real;
  wire [15:0] O_X12_S1_Im;
  wire [15:0] O_X13_S1_Real;
  wire [15:0] O_X13_S1_Im;
  wire [15:0] O_X14_S1_Real;
  wire [15:0] O_X14_S1_Im;
  wire [15:0] O_X15_S1_Real;
  wire [15:0] O_X15_S1_Im;

  wire [15:0] O_X0_S2_Real;
  wire [15:0] O_X0_S2_Im;
  wire [15:0] O_X1_S2_Real;
  wire [15:0] O_X1_S2_Im;
  wire [15:0] O_X2_S2_Real;
  wire [15:0] O_X2_S2_Im;
  wire [15:0] O_X3_S2_Real;
  wire [15:0] O_X3_S2_Im;
  wire [15:0] O_X4_S2_Real;
  wire [15:0] O_X4_S2_Im;
  wire [15:0] O_X5_S2_Real;
  wire [15:0] O_X5_S2_Im;
  wire [15:0] O_X6_S2_Real;
  wire [15:0] O_X6_S2_Im;
  wire [15:0] O_X7_S2_Real;
  wire [15:0] O_X7_S2_Im;
  wire [15:0] O_X8_S2_Real;
  wire [15:0] O_X8_S2_Im;
  wire [15:0] O_X9_S2_Real;
  wire [15:0] O_X9_S2_Im;
  wire [15:0] O_X10_S2_Real;
  wire [15:0] O_X10_S2_Im;
  wire [15:0] O_X11_S2_Real;
  wire [15:0] O_X11_S2_Im;
  wire [15:0] O_X12_S2_Real;
  wire [15:0] O_X12_S2_Im;
  wire [15:0] O_X13_S2_Real;
  wire [15:0] O_X13_S2_Im;
  wire [15:0] O_X14_S2_Real;
  wire [15:0] O_X14_S2_Im;
  wire [15:0] O_X15_S2_Real;
  wire [15:0] O_X15_S2_Im;

  wire [15:0] O_X0_S3_Real;
  wire [15:0] O_X0_S3_Im;
  wire [15:0] O_X1_S3_Real;
  wire [15:0] O_X1_S3_Im;
  wire [15:0] O_X2_S3_Real;
  wire [15:0] O_X2_S3_Im;
  wire [15:0] O_X3_S3_Real;
  wire [15:0] O_X3_S3_Im;
  wire [15:0] O_X4_S3_Real;
  wire [15:0] O_X4_S3_Im;
  wire [15:0] O_X5_S3_Real;
  wire [15:0] O_X5_S3_Im;
  wire [15:0] O_X6_S3_Real;
  wire [15:0] O_X6_S3_Im;
  wire [15:0] O_X7_S3_Real;
  wire [15:0] O_X7_S3_Im;
  wire [15:0] O_X8_S3_Real;
  wire [15:0] O_X8_S3_Im;
  wire [15:0] O_X9_S3_Real;
  wire [15:0] O_X9_S3_Im;
  wire [15:0] O_X10_S3_Real;
  wire [15:0] O_X10_S3_Im;
  wire [15:0] O_X11_S3_Real;
  wire [15:0] O_X11_S3_Im;
  wire [15:0] O_X12_S3_Real;
  wire [15:0] O_X12_S3_Im;
  wire [15:0] O_X13_S3_Real;
  wire [15:0] O_X13_S3_Im;
  wire [15:0] O_X14_S3_Real;
  wire [15:0] O_X14_S3_Im;
  wire [15:0] O_X15_S3_Real;
  wire [15:0] O_X15_S3_Im;


  
  
  
  
  Stage_1 stage_1 (
    .clk(clk),
    .X0_Real(X0_Real),
    .X0_Im(X0_Im),
    .X1_Real(X8_Real),
    .X1_Im(X8_Im),
    .X2_Real(X4_Real),
    .X2_Im(X4_Im),
    .X3_Real(X12_Real),
    .X3_Im(X12_Im),
    .X4_Real(X2_Real),
    .X4_Im(X2_Im),
    .X5_Real(X10_Real),
    .X5_Im(X10_Im),
    .X6_Real(X6_Real),
    .X6_Im(X6_Im),
    .X7_Real(X14_Real),
    .X7_Im(X14_Im),
    .X8_Real(X1_Real),
    .X8_Im(X1_Im),
    .X9_Real(X9_Real),
    .X9_Im(X9_Im),
    .X10_Real(X5_Real),
    .X10_Im(X5_Im),
    .X11_Real(X13_Real),
    .X11_Im(X13_Im),
    .X12_Real(X3_Real),
    .X12_Im(X3_Im),
    .X13_Real(X11_Real),
    .X13_Im(X11_Im),
    .X14_Real(X7_Real),
    .X14_Im(X7_Im),
    .X15_Real(X15_Real),
    .X15_Im(X15_Im),
    
    
    .O_X0_Real(O_X0_S1_Real),
    .O_X0_Im(O_X0_S1_Im),
    .O_X1_Real(O_X1_S1_Real),
    .O_X1_Im(O_X1_S1_Im),
    .O_X2_Real(O_X2_S1_Real),
    .O_X2_Im(O_X2_S1_Im),
    .O_X3_Real(O_X3_S1_Real),
    .O_X3_Im(O_X3_S1_Im),
    .O_X4_Real(O_X4_S1_Real),
    .O_X4_Im(O_X4_S1_Im),
    .O_X5_Real(O_X5_S1_Real),
    .O_X5_Im(O_X5_S1_Im),
    .O_X6_Real(O_X6_S1_Real),
    .O_X6_Im(O_X6_S1_Im),
    .O_X7_Real(O_X7_S1_Real),
    .O_X7_Im(O_X7_S1_Im),
    .O_X8_Real(O_X8_S1_Real),
    .O_X8_Im(O_X8_S1_Im),
    .O_X9_Real(O_X9_S1_Real),
    .O_X9_Im(O_X9_S1_Im),
    .O_X10_Real(O_X10_S1_Real),
    .O_X10_Im(O_X10_S1_Im),
    .O_X11_Real(O_X11_S1_Real),
    .O_X11_Im(O_X11_S1_Im),
    .O_X12_Real(O_X12_S1_Real),
    .O_X12_Im(O_X12_S1_Im),
    .O_X13_Real(O_X13_S1_Real),
    .O_X13_Im(O_X13_S1_Im),
    .O_X14_Real(O_X14_S1_Real),
    .O_X14_Im(O_X14_S1_Im),
    .O_X15_Real(O_X15_S1_Real),
    .O_X15_Im(O_X15_S1_Im)
  );
  
  
  
  Stage_2 stage_2 (
    .clk(clk),
    .X0_Real(O_X0_S1_Real),
    .X0_Im(O_X0_S1_Im),
    .X1_Real(O_X1_S1_Real),
    .X1_Im(O_X1_S1_Im),
    .X2_Real(O_X2_S1_Real),
    .X2_Im(O_X2_S1_Im),
    .X3_Real(O_X3_S1_Real),
    .X3_Im(O_X3_S1_Im),
    .X4_Real(O_X4_S1_Real),
    .X4_Im(O_X4_S1_Im),
    .X5_Real(O_X5_S1_Real),
    .X5_Im(O_X5_S1_Im),
    .X6_Real(O_X6_S1_Real),
    .X6_Im(O_X6_S1_Im),
    .X7_Real(O_X7_S1_Real),
    .X7_Im(O_X7_S1_Im),
    .X8_Real(O_X8_S1_Real),
    .X8_Im(O_X8_S1_Im),
    .X9_Real(O_X9_S1_Real),
    .X9_Im(O_X9_S1_Im),
    .X10_Real(O_X10_S1_Real),
    .X10_Im(O_X10_S1_Im),
    .X11_Real(O_X11_S1_Real),
    .X11_Im(O_X11_S1_Im),
    .X12_Real(O_X12_S1_Real),
    .X12_Im(O_X12_S1_Im),
    .X13_Real(O_X13_S1_Real),
    .X13_Im(O_X13_S1_Im),
    .X14_Real(O_X14_S1_Real),
    .X14_Im(O_X14_S1_Im),
    .X15_Real(O_X15_S1_Real),
    .X15_Im(O_X15_S1_Im),

    .O_X0_Real(O_X0_S2_Real),
    .O_X0_Im(O_X0_S2_Im),
    .O_X1_Real(O_X1_S2_Real),
    .O_X1_Im(O_X1_S2_Im),
    .O_X2_Real(O_X2_S2_Real),
    .O_X2_Im(O_X2_S2_Im),
    .O_X3_Real(O_X3_S2_Real),
    .O_X3_Im(O_X3_S2_Im),
    .O_X4_Real(O_X4_S2_Real),
    .O_X4_Im(O_X4_S2_Im),
    .O_X5_Real(O_X5_S2_Real),
    .O_X5_Im(O_X5_S2_Im),
    .O_X6_Real(O_X6_S2_Real),
    .O_X6_Im(O_X6_S2_Im),
    .O_X7_Real(O_X7_S2_Real),
    .O_X7_Im(O_X7_S2_Im),
    .O_X8_Real(O_X8_S2_Real),
    .O_X8_Im(O_X8_S2_Im),
    .O_X9_Real(O_X9_S2_Real),
    .O_X9_Im(O_X9_S2_Im),
    .O_X10_Real(O_X10_S2_Real),
    .O_X10_Im(O_X10_S2_Im),
    .O_X11_Real(O_X11_S2_Real),
    .O_X11_Im(O_X11_S2_Im),
    .O_X12_Real(O_X12_S2_Real),
    .O_X12_Im(O_X12_S2_Im),
    .O_X13_Real(O_X13_S2_Real),
    .O_X13_Im(O_X13_S2_Im),
    .O_X14_Real(O_X14_S2_Real),
    .O_X14_Im(O_X14_S2_Im),
    .O_X15_Real(O_X15_S2_Real),
    .O_X15_Im(O_X15_S2_Im)
  );
  
  

  Stage_3 stage_3 (
    .clk(clk),
    .X0_Real(O_X0_S2_Real),
    .X0_Im(O_X0_S2_Im),
    .X1_Real(O_X1_S2_Real),
    .X1_Im(O_X1_S2_Im),
    .X2_Real(O_X2_S2_Real),
    .X2_Im(O_X2_S2_Im),
    .X3_Real(O_X3_S2_Real),
    .X3_Im(O_X3_S2_Im),
    .X4_Real(O_X4_S2_Real),
    .X4_Im(O_X4_S2_Im),
    .X5_Real(O_X5_S2_Real),
    .X5_Im(O_X5_S2_Im),
    .X6_Real(O_X6_S2_Real),
    .X6_Im(O_X6_S2_Im),
    .X7_Real(O_X7_S2_Real),
    .X7_Im(O_X7_S2_Im),
    .X8_Real(O_X8_S2_Real),
    .X8_Im(O_X8_S2_Im),
    .X9_Real(O_X9_S2_Real),
    .X9_Im(O_X9_S2_Im),
    .X10_Real(O_X10_S2_Real),
    .X10_Im(O_X10_S2_Im),
    .X11_Real(O_X11_S2_Real),
    .X11_Im(O_X11_S2_Im),
    .X12_Real(O_X12_S2_Real),
    .X12_Im(O_X12_S2_Im),
    .X13_Real(O_X13_S2_Real),
    .X13_Im(O_X13_S2_Im),
    .X14_Real(O_X14_S2_Real),
    .X14_Im(O_X14_S2_Im),
    .X15_Real(O_X15_S2_Real),
    .X15_Im(O_X15_S2_Im),
    
    .O_X0_Real(O_X0_S3_Real),
    .O_X0_Im(O_X0_S3_Im),
    .O_X1_Real(O_X1_S3_Real),
    .O_X1_Im(O_X1_S3_Im),
    .O_X2_Real(O_X2_S3_Real),
    .O_X2_Im(O_X2_S3_Im),
    .O_X3_Real(O_X3_S3_Real),
    .O_X3_Im(O_X3_S3_Im),
    .O_X4_Real(O_X4_S3_Real),
    .O_X4_Im(O_X4_S3_Im),
    .O_X5_Real(O_X5_S3_Real),
    .O_X5_Im(O_X5_S3_Im),
    .O_X6_Real(O_X6_S3_Real),
    .O_X6_Im(O_X6_S3_Im),
    .O_X7_Real(O_X7_S3_Real),
    .O_X7_Im(O_X7_S3_Im),
    .O_X8_Real(O_X8_S3_Real),
    .O_X8_Im(O_X8_S3_Im),
    .O_X9_Real(O_X9_S3_Real),
    .O_X9_Im(O_X9_S3_Im),
    .O_X10_Real(O_X10_S3_Real),
    .O_X10_Im(O_X10_S3_Im),
    .O_X11_Real(O_X11_S3_Real),
    .O_X11_Im(O_X11_S3_Im),
    .O_X12_Real(O_X12_S3_Real),
    .O_X12_Im(O_X12_S3_Im),
    .O_X13_Real(O_X13_S3_Real),
    .O_X13_Im(O_X13_S3_Im),
    .O_X14_Real(O_X14_S3_Real),
    .O_X14_Im(O_X14_S3_Im),
    .O_X15_Real(O_X15_S3_Real),
    .O_X15_Im(O_X15_S3_Im)
  );

  
  Stage_4 stage_4 (
    .clk(clk),
    .X0_Real(O_X0_S3_Real),
    .X0_Im(O_X0_S3_Im),
    .X1_Real(O_X1_S3_Real),
    .X1_Im(O_X1_S3_Im),
    .X2_Real(O_X2_S3_Real),
    .X2_Im(O_X2_S3_Im),
    .X3_Real(O_X3_S3_Real),
    .X3_Im(O_X3_S3_Im),
    .X4_Real(O_X4_S3_Real),
    .X4_Im(O_X4_S3_Im),
    .X5_Real(O_X5_S3_Real),
    .X5_Im(O_X5_S3_Im),
    .X6_Real(O_X6_S3_Real),
    .X6_Im(O_X6_S3_Im),
    .X7_Real(O_X7_S3_Real),
    .X7_Im(O_X7_S3_Im),
    .X8_Real(O_X8_S3_Real),
    .X8_Im(O_X8_S3_Im),
    .X9_Real(O_X9_S3_Real),
    .X9_Im(O_X9_S3_Im),
    .X10_Real(O_X10_S3_Real),
    .X10_Im(O_X10_S3_Im),
    .X11_Real(O_X11_S3_Real),
    .X11_Im(O_X11_S3_Im),
    .X12_Real(O_X12_S3_Real),
    .X12_Im(O_X12_S3_Im),
    .X13_Real(O_X13_S3_Real),
    .X13_Im(O_X13_S3_Im),
    .X14_Real(O_X14_S3_Real),
    .X14_Im(O_X14_S3_Im),
    .X15_Real(O_X15_S3_Real),
    .X15_Im(O_X15_S3_Im),
    .O_X0_Real(O_X0_Real),
    .O_X0_Im(O_X0_Im),
    .O_X1_Real(O_X1_Real),
    .O_X1_Im(O_X1_Im),
    .O_X2_Real(O_X2_Real),
    .O_X2_Im(O_X2_Im),
    .O_X3_Real(O_X3_Real),
    .O_X3_Im(O_X3_Im),
    .O_X4_Real(O_X4_Real),
    .O_X4_Im(O_X4_Im),
    .O_X5_Real(O_X5_Real),
    .O_X5_Im(O_X5_Im),
    .O_X6_Real(O_X6_Real),
    .O_X6_Im(O_X6_Im),
    .O_X7_Real(O_X7_Real),
    .O_X7_Im(O_X7_Im),
    .O_X8_Real(O_X8_Real),
    .O_X8_Im(O_X8_Im),
    .O_X9_Real(O_X9_Real),
    .O_X9_Im(O_X9_Im),
    .O_X10_Real(O_X10_Real),
    .O_X10_Im(O_X10_Im),
    .O_X11_Real(O_X11_Real),
    .O_X11_Im(O_X11_Im),
    .O_X12_Real(O_X12_Real),
    .O_X12_Im(O_X12_Im),
    .O_X13_Real(O_X13_Real),
    .O_X13_Im(O_X13_Im),
    .O_X14_Real(O_X14_Real),
    .O_X14_Im(O_X14_Im),
    .O_X15_Real(O_X15_Real),
    .O_X15_Im(O_X15_Im)
  );

endmodule