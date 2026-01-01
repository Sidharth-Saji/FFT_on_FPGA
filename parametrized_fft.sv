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

  // -----------------------------------  -------------------------
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

      genvar i, s, j, b;

      generate

        // Input stage with bit-reversal
        for (i = 0; i < N; i = i + 1) begin : INPUT_MAP
          localparam integer REV = bit_reverse(i, STAGES);
          assign stage_real[0][REV] = x_real[i];
          assign stage_im[0][REV]   = x_im[i];
        end

        // FFT stages
        for (s = 0; s < STAGES; s++) begin : STAGE_LOOP

          localparam int GROUP = (N/(2**(s+1)));

          for (j = 0; j < GROUP; j ++) begin : GROUP_LOOP        


            for (b = 0; b < (2**s); b++) begin : BF

              localparam int IDX_A = (j*(2**(s+1))) + b;
              localparam int IDX_B = (j*(2**(s+1))) + b + (2**s);
              localparam int KVAL  = (2**(STAGES-s-1))*b;

              butterfly #(.W(W)) bf (
                .clk(clk),
                .Win        ( W_LUT[KVAL] ),
                .Data_A_Real(stage_real[s][IDX_A]),
                .Data_A_Im  (stage_im[s][IDX_A]),
                .Data_B_Real(stage_real[s][IDX_B]),
                .Data_B_Im  (stage_im[s][IDX_B]),
                .O_A_Real   (stage_real[s+1][IDX_A]),
                .O_A_Im     (stage_im[s+1][IDX_A]),
                .O_B_Real   (stage_real[s+1][IDX_B]),
                .O_B_Im     (stage_im[s+1][IDX_B])
              );

            end
          end
        end



        // Output stage
        for (i = 0; i < N; i++) begin : OUTPUT_MAP
          assign X_real[i] = stage_real[STAGES][i];
          assign X_im[i]   = stage_im[STAGES][i];
        end

      endgenerate

endmodule



function integer bit_reverse;
  input integer val;
  input integer width;
  integer j;
  begin
    bit_reverse = 0;
    for (j = 0; j < width; j = j + 1) begin
      bit_reverse = (bit_reverse << 1) | (val & 1);
      val = val >> 1;
    end
  end
endfunction