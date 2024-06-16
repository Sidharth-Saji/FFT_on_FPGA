`include "W_LUT.sv"
`include "ComplexMul.sv"
`include "ComplexAdd.sv"

`include "butterfly.sv"
`include "point_2.sv"
`include "point_4.sv"
`include "point_8.sv"
`include "point_16.sv"


`include "Stage_1.sv"
`include "Stage_2.sv"
`include "Stage_3.sv"
`include "Stage_4.sv"




module FFT_Testbench;


  
  // Inputs
  reg clk = 0;
  reg signed [15:0] X0_Real, X0_Im, X1_Real, X1_Im, X2_Real, X2_Im, X3_Real, X3_Im, X4_Real, X4_Im, X5_Real, X5_Im, X6_Real, X6_Im, X7_Real, X7_Im, X8_Real, X8_Im, X9_Real, X9_Im, X10_Real, X10_Im, X11_Real, X11_Im, X12_Real, X12_Im, X13_Real, X13_Im, X14_Real, X14_Im, X15_Real, X15_Im;
  
  // Outputs
  wire signed [15:0] O_X0_Real, O_X0_Im, O_X1_Real, O_X1_Im, O_X2_Real, O_X2_Im, O_X3_Real, O_X3_Im, O_X4_Real, O_X4_Im, O_X5_Real, O_X5_Im, O_X6_Real, O_X6_Im, O_X7_Real, O_X7_Im, O_X8_Real, O_X8_Im, O_X9_Real, O_X9_Im, O_X10_Real, O_X10_Im, O_X11_Real, O_X11_Im, O_X12_Real, O_X12_Im, O_X13_Real, O_X13_Im, O_X14_Real, O_X14_Im, O_X15_Real, O_X15_Im;
  
  // Instantiate DUT
  FFT dut (
    .clk(clk),
    .X0_Real(X0_Real),
    .X0_Im(X0_Im),
    .X1_Real(X1_Real),
    .X1_Im(X1_Im),
    .X2_Real(X2_Real),
    .X2_Im(X2_Im),
    .X3_Real(X3_Real),
    .X3_Im(X3_Im),
    .X4_Real(X4_Real),
    .X4_Im(X4_Im),
    .X5_Real(X5_Real),
    .X5_Im(X5_Im),
    .X6_Real(X6_Real),
    .X6_Im(X6_Im),
    .X7_Real(X7_Real),
    .X7_Im(X7_Im),
    .X8_Real(X8_Real),
    .X8_Im(X8_Im),
    .X9_Real(X9_Real),
    .X9_Im(X9_Im),
    .X10_Real(X10_Real),
    .X10_Im(X10_Im),
    .X11_Real(X11_Real),
    .X11_Im(X11_Im),
    .X12_Real(X12_Real),
    .X12_Im(X12_Im),
    .X13_Real(X13_Real),
    .X13_Im(X13_Im),
    .X14_Real(X14_Real),
    .X14_Im(X14_Im),
    .X15_Real(X15_Real),
    .X15_Im(X15_Im),
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
  

    

  always #5 clk <= ~clk;
  
  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars();
    
    X0_Real = 16'd256; X0_Im = 16'd0000;
    X1_Real = 16'd512; X1_Im = 16'd0000;
    X2_Real = 16'd0; X2_Im = 16'd0000;
    X3_Real = 16'd0; X3_Im = 16'd0000;
    X4_Real = 16'd0; X4_Im = 16'd0000;
    X5_Real = 16'd0; X5_Im = 16'd0000;
    X6_Real = 16'd0; X6_Im = 16'd0000;
    X7_Real = 16'd0; X7_Im = 16'd0000;
    X8_Real = 16'd0; X8_Im = 16'd0000;
    X9_Real = 16'd0; X9_Im = 16'd0000;
    X10_Real = 16'd0; X10_Im = 16'd0000;
    X11_Real = 16'd0; X11_Im = 16'd0000;
    X12_Real = 16'd0; X12_Im = 16'd0000;
    X13_Real = 16'd0; X13_Im = 16'd0000;
    X14_Real = 16'd0; X14_Im = 16'd0000;
    X15_Real = 16'd0; X15_Im = 16'd0000;

    
    #40;
    
    $display("X0_Real = %d, X0_Im = %d", $signed(O_X0_Real), $signed(O_X0_Im));
    $display("X1_Real = %d, X1_Im = %d", $signed(O_X1_Real), $signed(O_X1_Im));
    $display("X2_Real = %d, X2_Im = %d", $signed(O_X2_Real), $signed(O_X2_Im));
    $display("X3_Real = %d, X3_Im = %d", $signed(O_X3_Real), $signed(O_X3_Im));
    $display("X4_Real = %d, X4_Im = %d", $signed(O_X4_Real), $signed(O_X4_Im));
    $display("X5_Real = %d, X5_Im = %d", $signed(O_X5_Real), $signed(O_X5_Im));
    $display("X6_Real = %d, X6_Im = %d", $signed(O_X6_Real), $signed(O_X6_Im));
    $display("X7_Real = %d, X7_Im = %d", $signed(O_X7_Real), $signed(O_X7_Im));
    $display("X8_Real = %d, X8_Im = %d", $signed(O_X8_Real), $signed(O_X8_Im));
    $display("X9_Real = %d, X9_Im = %d", $signed(O_X9_Real), $signed(O_X9_Im));
    $display("X10_Real = %d, X10_Im = %d", $signed(O_X10_Real), $signed(O_X10_Im));
    $display("X11_Real = %d, X11_Im = %d", $signed(O_X11_Real), $signed(O_X11_Im));
    $display("X12_Real = %d, X12_Im = %d", $signed(O_X12_Real), $signed(O_X12_Im));
    $display("X13_Real = %d, X13_Im = %d", $signed(O_X13_Real), $signed(O_X13_Im));
    $display("X14_Real = %d, X14_Im = %d", $signed(O_X14_Real), $signed(O_X14_Im));
    $display("X15_Real = %d, X15_Im = %d", $signed(O_X15_Real), $signed(O_X15_Im));

    
    $finish;
  end

endmodule