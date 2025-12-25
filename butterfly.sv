// Generic Butterfly 

// Combinational Block 


module butterfly(
  input [2:0] k,
  input [15:0]Data_A_Real,
  input	[15:0]Data_A_Im,
  input [15:0]Data_B_Real,
  input [15:0]Data_B_Im,
  output reg [15:0]O_A_Real,
  output reg [15:0]O_A_Im,
  output reg [15:0]O_B_Real,
  output reg [15:0]O_B_Im
);
  
  
  
  wire [31:0] Win; // Twiddle Factor From LUT
  reg [15:0] Inter_Real; // Intermediate Real with twiddle multiplied 
  reg [15:0] Inter_Im; // Intermediate Imag with twiddle multiplied 


  
  W_LUT Wk (
    .k(k),
    .W(Win)
  );// Getting W value from the k value
  
  ComplexMul Mul( 
    .A_Real(Win[31:16]), 
    .A_Im(Win[15:0]),
    .B_Real(Data_B_Real),
    .B_Im(Data_B_Im),
    .O_Real(Inter_Real),
    .O_Im(Inter_Im)
  );// Twiddle Multiplied with Data_B
  
  ComplexAdd Added_A( 
    .A_Real(Data_A_Real),
    .A_Im(Data_A_Im),
    .B_Real(Inter_Real),
    .B_Im(Inter_Im),
    .O_Real(O_A_Real),
    .O_Im(O_A_Im)
  );// Output of Data Value A
  
  ComplexAdd Added_B( 
    .A_Real(Data_A_Real),
    .A_Im(Data_A_Im),
    .B_Real(-Inter_Real),
    .B_Im(-Inter_Im),
    .O_Real(O_B_Real),
    .O_Im(O_B_Im)
  );// Output of Data value B          

  
  
endmodule
