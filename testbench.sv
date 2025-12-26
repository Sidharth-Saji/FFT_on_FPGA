`include "ComplexMul.sv"
`include "ComplexAdd.sv"

`include "butterfly.sv"
`include "parametrized_fft.sv"
 

module FFT_Testbench;

  parameter int N = 16;
  parameter int W = 16;
  parameter int fraction = 8;

  // Clock
  reg clk = 0;
  always #5 clk = ~clk;

  // Inputs
  reg signed [W-1:0] x_real [0:N-1];
  reg signed [W-1:0] x_im   [0:N-1];

  // Outputs
  wire signed [W-1:0] X_real [0:N-1];
  wire signed [W-1:0] X_im   [0:N-1];

  // File reading variables
  integer input_file;
  integer i;
  string str_value;
  real temp;

  // Instantiate FFT DUT
  fft #(
    .N(N),
    .W(W),
    .STAGES($clog2(N))
  ) dut (
    .clk(clk),
    .x_real(x_real),
    .x_im(x_im),
    .X_real(X_real),
    .X_im(X_im)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, FFT_Testbench);

    // Open input file
    input_file = $fopen("Signal.txt", "r");
    if (input_file == 0) begin
      $display("ERROR: Could not open Signal.txt");
      $finish;
    end

    // Read input samples (real only, imag = 0)
    for (i = 0; i < N; i = i + 1) begin
      $fscanf(input_file, "%s", str_value);
      $sscanf(str_value, "%f", temp);
      x_real[i] = temp * (1 << fraction);
      x_im[i]   = 0;
    end
    $fclose(input_file);

    // Wait for combinational/pipelined settling
    #20;

    // Display FFT outputs
    for (i = 0; i < N; i = i + 1) begin
      $display(
        "X[%0d] = %f + j%f",
        i,
        $signed(X_real[i]) * (1.0 / (1 << fraction)),
        $signed(X_im[i])   * (1.0 / (1 << fraction))
      );
    end

    $finish;
  end

endmodule
