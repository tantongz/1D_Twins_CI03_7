/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_main_5 (
    input [5:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] alu,
    output reg z_,
    output reg v,
    output reg n
  );
  
  
  
  wire [16-1:0] M_add_call_sum_out;
  wire [1-1:0] M_add_call_z_;
  wire [1-1:0] M_add_call_v;
  wire [1-1:0] M_add_call_n;
  reg [4-1:0] M_add_call_alufn;
  reg [16-1:0] M_add_call_a;
  reg [16-1:0] M_add_call_b;
  adder_26 add_call (
    .alufn(M_add_call_alufn),
    .a(M_add_call_a),
    .b(M_add_call_b),
    .sum_out(M_add_call_sum_out),
    .z_(M_add_call_z_),
    .v(M_add_call_v),
    .n(M_add_call_n)
  );
  
  wire [16-1:0] M_cmp_call_cmp_out;
  wire [1-1:0] M_cmp_call_z_;
  wire [1-1:0] M_cmp_call_v;
  wire [1-1:0] M_cmp_call_n;
  reg [4-1:0] M_cmp_call_alufn;
  reg [16-1:0] M_cmp_call_a;
  reg [16-1:0] M_cmp_call_b;
  cmp_27 cmp_call (
    .alufn(M_cmp_call_alufn),
    .a(M_cmp_call_a),
    .b(M_cmp_call_b),
    .cmp_out(M_cmp_call_cmp_out),
    .z_(M_cmp_call_z_),
    .v(M_cmp_call_v),
    .n(M_cmp_call_n)
  );
  
  wire [16-1:0] M_bool_call_boole_out;
  reg [4-1:0] M_bool_call_alufn;
  reg [16-1:0] M_bool_call_a;
  reg [16-1:0] M_bool_call_b;
  boole_28 bool_call (
    .alufn(M_bool_call_alufn),
    .a(M_bool_call_a),
    .b(M_bool_call_b),
    .boole_out(M_bool_call_boole_out)
  );
  
  wire [16-1:0] M_shift_call_shift_out;
  reg [4-1:0] M_shift_call_alufn;
  reg [16-1:0] M_shift_call_a;
  reg [5-1:0] M_shift_call_shift_bit;
  shift_29 shift_call (
    .alufn(M_shift_call_alufn),
    .a(M_shift_call_a),
    .shift_bit(M_shift_call_shift_bit),
    .shift_out(M_shift_call_shift_out)
  );
  
  always @* begin
    M_add_call_a = a;
    M_add_call_b = b;
    M_add_call_alufn = alufn[0+3-:4];
    M_cmp_call_alufn = alufn[0+3-:4];
    M_cmp_call_a = a;
    M_cmp_call_b = b;
    M_bool_call_a = a;
    M_bool_call_b = b;
    M_bool_call_alufn = alufn[0+3-:4];
    M_shift_call_a = a;
    M_shift_call_shift_bit = b[0+4-:5];
    M_shift_call_alufn = alufn[0+3-:4];
    
    case (alufn[4+1-:2])
      2'h0: begin
        alu = M_add_call_sum_out;
      end
      2'h1: begin
        alu = M_bool_call_boole_out;
      end
      2'h2: begin
        alu = M_shift_call_shift_out;
      end
      2'h3: begin
        alu = M_cmp_call_cmp_out;
      end
      default: begin
        alu = 1'h0;
      end
    endcase
    z_ = M_add_call_z_ | M_cmp_call_z_;
    v = M_add_call_v | M_cmp_call_v;
    n = M_add_call_n | M_cmp_call_n;
  end
endmodule
