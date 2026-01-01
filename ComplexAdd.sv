	
// Q8.8 Addition
module ComplexAdd(
  input signed [15:0] A_Real,
  input signed [15:0] B_Real,
  input signed [15:0] A_Im,
  input signed [15:0] B_Im,
  output reg signed [15:0] O_Real,
  output reg signed [15:0] O_Im
);
  
// Using Q8.8 Format
  always @*
  begin
    O_Real <= A_Real + B_Real;
    O_Im <= A_Im + B_Im;
  end

endmodule