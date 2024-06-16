module W_LUT (
  input [2:0] k,
  output reg signed [31:0] W
);
// Using Q4.12 Format
  parameter fraction = 8;
  
  
always @(k)
  begin
    case (k)
      0: W = {16'd256, 16'd0};
      1: W = {16'd237, -16'd98};
      2: W = {16'd181, -16'd181};
      3: W = {16'd98, -16'd237};
      4: W = {16'd0, -16'd256};
      5: W = {-16'd98, -16'd237};
      6: W = {-16'd181, -16'd181};
      7: W = {-16'd237, -16'd98};
    endcase
  end
endmodule




