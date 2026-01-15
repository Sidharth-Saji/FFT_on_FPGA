module ComplexMul(
  input signed [15:0] A_Real,
  input signed [15:0] B_Real,
  input signed [15:0] A_Im,
  input signed [15:0] B_Im,
  output reg signed [15:0] O_Real,
  output reg signed [15:0] O_Im
);
  
  
  parameter fraction = 15;
  
  // Using Q8.8 Format to store multiplied output
  wire [31:0] temp_r_r;
  wire [31:0] temp_i_i;
  wire [31:0] temp_r_i;
  wire [31:0] temp_i_r;
  
  
  assign temp_r_r = (A_Real * B_Real);
  assign temp_i_i = (A_Im * B_Im);
  assign temp_r_i = (A_Real * B_Im);
  assign temp_i_r = (A_Im * B_Real);
  
  
  always @*
  begin
    O_Real <= (temp_r_r - temp_i_i)>>fraction;
    O_Im <= (temp_r_i + temp_i_r)>>fraction;
  end

endmodule
