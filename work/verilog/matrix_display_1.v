/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module matrix_display_1 (
    input clk,
    input rst,
    input [63:0] green,
    input [63:0] red,
    output reg [7:0] r_red,
    output reg [7:0] r_green,
    output reg [7:0] col
  );
  
  
  
  
  localparam FLIP = 5'h10;
  
  wire [4-1:0] M_counter_r_value;
  counter_20 counter_r (
    .clk(clk),
    .rst(rst),
    .value(M_counter_r_value)
  );
  
  reg [3:0] cur_col;
  
  integer i;
  
  always @* begin
    r_red = 8'hff;
    r_green = 8'hff;
    col = 8'h00;
    cur_col = M_counter_r_value;
    col[(cur_col)*1+0-:1] = 1'h1;
    for (i = 1'h0; i <= 3'h7; i = i + 1) begin
      r_red[(i)*1+0-:1] = ~red[(i)*8+(3'h7 - cur_col)*1+0-:1];
      r_green[(i)*1+0-:1] = ~green[(i)*8+(3'h7 - cur_col)*1+0-:1];
    end
  end
endmodule
