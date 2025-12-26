module fft #(
  parameter int N ,              // Must be power of 2
  parameter int W ,
  parameter int STAGES
)(
  input clk, 
  input  logic signed [W-1:0] x_real [0:N-1],
  input  logic signed [W-1:0] x_im   [0:N-1],
  output logic signed [W-1:0] X_real [0:N-1],
  output logic signed [W-1:0] X_im   [0:N-1]
);

  // ------------------------------------------------------------
  // Stage storage
  // ------------------------------------------------------------
  wire signed [W-1:0] stage_real [0:STAGES][0:N-1];
  wire signed [W-1:0] stage_im   [0:STAGES][0:N-1];

  // ------------------------------------------------------------
  // Twiddle factor LUT (Q8.8)
  // Size = N/2
  // ------------------------------------------------------------
  localparam int TW = N/2;

  wire signed [31:0] W_LUT [0:TW-1];

  // Example: N = 16 twiddles
  assign W_LUT[0] = {16'sd256,   16'sd0};
  assign W_LUT[1] = {16'sd236,  -16'sd98};
  assign W_LUT[2] = {16'sd181, -16'sd181};
  assign W_LUT[3] = {16'sd98,  -16'sd236};
  assign W_LUT[4] = {16'sd0,   -16'sd256};
  assign W_LUT[5] = {-16'sd98, -16'sd236};
  assign W_LUT[6] = {-16'sd181,-16'sd181};
  assign W_LUT[7] = {-16'sd236,-16'sd98};

  // ------------------------------------------------------------
  // Generate FFT structure
  // ------------------------------------------------------------

    //   genvar i, s, j, b;

    //   generate

    //     // Input stage
    //     for (i = 0; i < N; i++) begin : INPUT_MAP
    //       assign stage_real[0][i] = x_real[i];
    //       assign stage_im[0][i]   = x_im[i];
    //     end

    //     // FFT stages
    //     for (s = 0; s < STAGES; s++) begin : STAGE_LOOP
    //       localparam int SPAN = 1 << (s + 1);
    //       localparam int HALF = 1 << s;

    //       for (j = 0; j < N; j += SPAN) begin : GROUP_LOOP
    //         for (b = 0; b < HALF; b++) begin : BF_LOOP
    //           localparam int IDX_A = j + b;
    //           localparam int IDX_B = j + b + HALF;
    //           localparam int KVAL  = b * (N >> (s + 1));

    //           butterfly #(.W(W)) bf (
    //             .clk(clk),
    //             .Win        ( W_LUT[KVAL] ),
    //             .Data_A_Real(stage_real[s][IDX_A]),
    //             .Data_A_Im  (stage_im[s][IDX_A]),
    //             .Data_B_Real(stage_real[s][IDX_B]),
    //             .Data_B_Im  (stage_im[s][IDX_B]),
    //             .O_A_Real   (stage_real[s+1][IDX_A]),
    //             .O_A_Im     (stage_im[s+1][IDX_A]),
    //             .O_B_Real   (stage_real[s+1][IDX_B]),
    //             .O_B_Im     (stage_im[s+1][IDX_B])
    //           );
    //         end
    //       end
    //     end



    //     // Output stage
    //     for (i = 0; i < N; i++) begin : OUTPUT_MAP
    //       assign X_real[i] = stage_real[STAGES][i];
    //       assign X_im[i]   = stage_im[STAGES][i];
    //     end

    //   endgenerate

endmodule
