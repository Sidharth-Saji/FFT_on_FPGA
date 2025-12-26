module butterfly #(
  parameter W = 16
)(
  input  logic clk,

  input  logic signed [W-1:0] Data_A_Real,
  input  logic signed [W-1:0] Data_A_Im,
  input  logic signed [W-1:0] Data_B_Real,
  input  logic signed [W-1:0] Data_B_Im,

  input  logic signed [2*W-1:0] Win,

  output logic signed [W-1:0] O_A_Real,
  output logic signed [W-1:0] O_A_Im,
  output logic signed [W-1:0] O_B_Real,
  output logic signed [W-1:0] O_B_Im
);

  // ------------------------------------------------------------
  // Internal combinational signals
  // ------------------------------------------------------------
  logic signed [W-1:0] Inter_Real;
  logic signed [W-1:0] Inter_Im;

  logic signed [W-1:0] A_Real_c, A_Im_c;
  logic signed [W-1:0] B_Real_c, B_Im_c;

  // ------------------------------------------------------------
  // Combinational complex multiply
  // ------------------------------------------------------------
  ComplexMul Mul (
    .A_Real(Win[2*W-1:W]),
    .A_Im  (Win[W-1:0]),
    .B_Real(Data_B_Real),
    .B_Im  (Data_B_Im),
    .O_Real(Inter_Real),
    .O_Im  (Inter_Im)
  );

  // ------------------------------------------------------------
  // Combinational add/subtract
  // ------------------------------------------------------------
  ComplexAdd Added_A (
    .A_Real(Data_A_Real),
    .A_Im  (Data_A_Im),
    .B_Real(Inter_Real),
    .B_Im  (Inter_Im),
    .O_Real(A_Real_c),
    .O_Im  (A_Im_c)
  );

  ComplexAdd Added_B (
    .A_Real(Data_A_Real),
    .A_Im  (Data_A_Im),
    .B_Real(-Inter_Real),
    .B_Im  (-Inter_Im),
    .O_Real(B_Real_c),
    .O_Im  (B_Im_c)
  );

  // ------------------------------------------------------------
  // Output registers (clocked)
  // ------------------------------------------------------------
  always_ff @(posedge clk) begin
    O_A_Real <= A_Real_c;
    O_A_Im   <= A_Im_c;
    O_B_Real <= B_Real_c;
    O_B_Im   <= B_Im_c;
  end

endmodule
