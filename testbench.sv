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
`include "design.sv"
 

module FFT_Testbench;


  
// Inputs
  reg clk = 0;
  reg signed [15:0] X0_Real, X0_Im, X1_Real, X1_Im, X2_Real, X2_Im, X3_Real, X3_Im, X4_Real, X4_Im, X5_Real, X5_Im, X6_Real, X6_Im, X7_Real, X7_Im, X8_Real, X8_Im, X9_Real, X9_Im, X10_Real, X10_Im, X11_Real, X11_Im, X12_Real, X12_Im, X13_Real, X13_Im, X14_Real, X14_Im, X15_Real, X15_Im;
  

  integer data[16];
  integer input_file;
  integer output_file;
  integer i;
  integer output_data[16];
  string str_value;
  real temp;
  parameter fraction = 8;
  integer fscanf_result;
  
  
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
    

    
    input_file = $fopen("Signal.txt", "r");
    
    if (input_file == 0) 
    begin
      $display("Error: Could not open file");
      $finish;
    end
    
    for (i = 0; i < 16; i = i + 1) begin
      $fscanf(input_file, "%s", str_value);// Read string from file
      $sscanf(str_value, "%f", temp);
      data[i] = temp *(1<<fraction); // Convert to fixed-point integer format (Q8.8)
    end
    
    $fclose(input_file);
	
    X0_Real = data[0]; 
    X1_Real = data[1];
    X2_Real = data[2];
    X3_Real = data[3];
    X4_Real = data[4];
    X5_Real = data[5];
    X6_Real = data[6];
    X7_Real = data[7];
    X8_Real = data[8];
    X9_Real = data[9];
    X10_Real = data[10];
    X11_Real = data[11];
    X12_Real = data[12];
    X13_Real = data[13];
    X14_Real = data[14];
    X15_Real = data[15];
 
    // Assuming No Imaginary Input
    X0_Im = 16'd0000;
    X1_Im = 16'd0000;
    X2_Im = 16'd0000;
    X3_Im = 16'd0000;
    X4_Im = 16'd0000;
    X5_Im = 16'd0000;
    X6_Im = 16'd0000;
    X7_Im = 16'd0000;
    X8_Im = 16'd0000;
    X9_Im = 16'd0000;
    X10_Im = 16'd0000;
    X11_Im = 16'd0000;
    X12_Im = 16'd0000;
    X13_Im = 16'd0000;
    X14_Im = 16'd0000;
    X15_Im = 16'd0000;



    
    #40;
    
    $display("X0_Real = %f, X0_Im = %f", $signed(O_X0_Real) * (1.0 / (1 << fraction)), $signed(O_X0_Im) * (1.0 / (1 << fraction)));
    $display("X1_Real = %f, X1_Im = %f", $signed(O_X1_Real) * (1.0 / (1 << fraction)), $signed(O_X1_Im) * (1.0 / (1 << fraction)));
    $display("X2_Real = %f, X2_Im = %f", $signed(O_X2_Real) * (1.0 / (1 << fraction)), $signed(O_X2_Im) * (1.0 / (1 << fraction)));
    $display("X3_Real = %f, X3_Im = %f", $signed(O_X3_Real) * (1.0 / (1 << fraction)), $signed(O_X3_Im) * (1.0 / (1 << fraction)));
    $display("X4_Real = %f, X4_Im = %f", $signed(O_X4_Real) * (1.0 / (1 << fraction)), $signed(O_X4_Im) * (1.0 / (1 << fraction)));
    $display("X5_Real = %f, X5_Im = %f", $signed(O_X5_Real) * (1.0 / (1 << fraction)), $signed(O_X5_Im) * (1.0 / (1 << fraction)));
    $display("X6_Real = %f, X6_Im = %f", $signed(O_X6_Real) * (1.0 / (1 << fraction)), $signed(O_X6_Im) * (1.0 / (1 << fraction)));
    $display("X7_Real = %f, X7_Im = %f", $signed(O_X7_Real) * (1.0 / (1 << fraction)), $signed(O_X7_Im) * (1.0 / (1 << fraction)));
    $display("X8_Real = %f, X8_Im = %f", $signed(O_X8_Real) * (1.0 / (1 << fraction)), $signed(O_X8_Im) * (1.0 / (1 << fraction)));
    $display("X9_Real = %f, X9_Im = %f", $signed(O_X9_Real) * (1.0 / (1 << fraction)), $signed(O_X9_Im) * (1.0 / (1 << fraction)));
    $display("X10_Real = %f, X10_Im = %f", $signed(O_X10_Real) * (1.0 / (1 << fraction)), $signed(O_X10_Im) * (1.0 / (1 << fraction)));
    $display("X11_Real = %f, X11_Im = %f", $signed(O_X11_Real) * (1.0 / (1 << fraction)), $signed(O_X11_Im) * (1.0 / (1 << fraction)));
    $display("X12_Real = %f, X12_Im = %f", $signed(O_X12_Real) * (1.0 / (1 << fraction)), $signed(O_X12_Im) * (1.0 / (1 << fraction)));
    $display("X13_Real = %f, X13_Im = %f", $signed(O_X13_Real) * (1.0 / (1 << fraction)), $signed(O_X13_Im) * (1.0 / (1 << fraction)));
    $display("X14_Real = %f, X14_Im = %f", $signed(O_X14_Real) * (1.0 / (1 << fraction)), $signed(O_X14_Im) * (1.0 / (1 << fraction)));
    $display("X15_Real = %f, X15_Im = %f", $signed(O_X15_Real) * (1.0 / (1 << fraction)), $signed(O_X15_Im) * (1.0 / (1 << fraction)));

    




    $finish;
  end

endmodule