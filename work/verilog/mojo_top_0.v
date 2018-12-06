/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    input right_btn,
    input left_btn,
    input up_btn,
    input down_btn,
    input reset_btn,
    input start_btn,
    output reg [7:0] r_red,
    output reg [7:0] r_green,
    output reg [7:0] col,
    output reg [7:0] led
  );
  
  
  
  reg rst;
  
  wire [8-1:0] M_mat_dis_r_red;
  wire [8-1:0] M_mat_dis_r_green;
  wire [8-1:0] M_mat_dis_col;
  reg [64-1:0] M_mat_dis_green;
  reg [64-1:0] M_mat_dis_red;
  matrix_display_1 mat_dis (
    .clk(clk),
    .rst(rst),
    .green(M_mat_dis_green),
    .red(M_mat_dis_red),
    .r_red(M_mat_dis_r_red),
    .r_green(M_mat_dis_r_green),
    .col(M_mat_dis_col)
  );
  
  wire [2-1:0] M_ctrl_sel_level;
  wire [1-1:0] M_ctrl_sel_display;
  wire [1-1:0] M_ctrl_sel_start;
  wire [1-1:0] M_ctrl_sel_state;
  wire [1-1:0] M_ctrl_sel_map;
  wire [1-1:0] M_ctrl_sel_check;
  wire [1-1:0] M_ctrl_check_win;
  wire [6-1:0] M_ctrl_alufn;
  wire [2-1:0] M_ctrl_sel_new_pos;
  wire [3-1:0] M_ctrl_state_output;
  reg [1-1:0] M_ctrl_r;
  reg [2-1:0] M_ctrl_d;
  reg [3-1:0] M_ctrl_state;
  control_2 ctrl (
    .r(M_ctrl_r),
    .d(M_ctrl_d),
    .state(M_ctrl_state),
    .sel_level(M_ctrl_sel_level),
    .sel_display(M_ctrl_sel_display),
    .sel_start(M_ctrl_sel_start),
    .sel_state(M_ctrl_sel_state),
    .sel_map(M_ctrl_sel_map),
    .sel_check(M_ctrl_sel_check),
    .check_win(M_ctrl_check_win),
    .alufn(M_ctrl_alufn),
    .sel_new_pos(M_ctrl_sel_new_pos),
    .state_output(M_ctrl_state_output)
  );
  
  wire [16-1:0] M_chk_r0;
  wire [16-1:0] M_chk_r1;
  wire [16-1:0] M_chk_r2;
  reg [1-1:0] M_chk_check_win;
  reg [16-1:0] M_chk_value;
  check_3 chk (
    .clk(clk),
    .check_win(M_chk_check_win),
    .value(M_chk_value),
    .r0(M_chk_r0),
    .r1(M_chk_r1),
    .r2(M_chk_r2)
  );
  
  wire [16-1:0] M_alu_alu;
  wire [1-1:0] M_alu_z_;
  wire [1-1:0] M_alu_v;
  wire [1-1:0] M_alu_n;
  reg [6-1:0] M_alu_alufn;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  alu_main_4 alu (
    .alufn(M_alu_alufn),
    .a(M_alu_a),
    .b(M_alu_b),
    .alu(M_alu_alu),
    .z_(M_alu_z_),
    .v(M_alu_v),
    .n(M_alu_n)
  );
  
  wire [2-1:0] M_data_mem_call_level_adr;
  wire [64-1:0] M_data_mem_call_red;
  wire [64-1:0] M_data_mem_call_green;
  wire [16-1:0] M_data_mem_call_r0;
  wire [36-1:0] M_data_mem_call_curr_map;
  wire [6-1:0] M_data_mem_call_curr_ep;
  wire [6-1:0] M_data_mem_call_curr_tp;
  reg [1-1:0] M_data_mem_call_sel_map;
  reg [2-1:0] M_data_mem_call_level_adr_i;
  reg [1-1:0] M_data_mem_call_sel_start;
  reg [16-1:0] M_data_mem_call_r0_i;
  reg [6-1:0] M_data_mem_call_new_tp_i;
  data_mem_5 data_mem_call (
    .clk(clk),
    .sel_map(M_data_mem_call_sel_map),
    .level_adr_i(M_data_mem_call_level_adr_i),
    .sel_start(M_data_mem_call_sel_start),
    .r0_i(M_data_mem_call_r0_i),
    .new_tp_i(M_data_mem_call_new_tp_i),
    .level_adr(M_data_mem_call_level_adr),
    .red(M_data_mem_call_red),
    .green(M_data_mem_call_green),
    .r0(M_data_mem_call_r0),
    .curr_map(M_data_mem_call_curr_map),
    .curr_ep(M_data_mem_call_curr_ep),
    .curr_tp(M_data_mem_call_curr_tp)
  );
  
  wire [6-1:0] M_decoder_new_tp;
  reg [6-1:0] M_decoder_curr_tp;
  reg [36-1:0] M_decoder_mapdata;
  reg [2-1:0] M_decoder_sel_new_pos;
  matrix_decoder_6 decoder (
    .curr_tp(M_decoder_curr_tp),
    .mapdata(M_decoder_mapdata),
    .sel_new_pos(M_decoder_sel_new_pos),
    .new_tp(M_decoder_new_tp)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_7 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_right_edge_detector_out;
  reg [1-1:0] M_right_edge_detector_in;
  edge_detector_8 right_edge_detector (
    .clk(clk),
    .in(M_right_edge_detector_in),
    .out(M_right_edge_detector_out)
  );
  wire [1-1:0] M_left_edge_detector_out;
  reg [1-1:0] M_left_edge_detector_in;
  edge_detector_8 left_edge_detector (
    .clk(clk),
    .in(M_left_edge_detector_in),
    .out(M_left_edge_detector_out)
  );
  wire [1-1:0] M_up_edge_detector_out;
  reg [1-1:0] M_up_edge_detector_in;
  edge_detector_8 up_edge_detector (
    .clk(clk),
    .in(M_up_edge_detector_in),
    .out(M_up_edge_detector_out)
  );
  wire [1-1:0] M_down_edge_detector_out;
  reg [1-1:0] M_down_edge_detector_in;
  edge_detector_8 down_edge_detector (
    .clk(clk),
    .in(M_down_edge_detector_in),
    .out(M_down_edge_detector_out)
  );
  wire [1-1:0] M_reset_edge_detector_out;
  reg [1-1:0] M_reset_edge_detector_in;
  edge_detector_8 reset_edge_detector (
    .clk(clk),
    .in(M_reset_edge_detector_in),
    .out(M_reset_edge_detector_out)
  );
  wire [1-1:0] M_start_edge_detector_out;
  reg [1-1:0] M_start_edge_detector_in;
  edge_detector_8 start_edge_detector (
    .clk(clk),
    .in(M_start_edge_detector_in),
    .out(M_start_edge_detector_out)
  );
  localparam START_state = 3'd0;
  localparam WAIT_state = 3'd1;
  localparam CHECKA_state = 3'd2;
  localparam CHECKB_state = 3'd3;
  localparam CHECKWIN_state = 3'd4;
  localparam WIN_state = 3'd5;
  
  reg [2:0] M_state_d, M_state_q = START_state;
  reg [1:0] M_level_d, M_level_q = 1'h0;
  reg [1:0] M_reg_d_d, M_reg_d_q = 1'h0;
  reg [1:0] M_reg_c_d, M_reg_c_q = 1'h0;
  reg M_reg_r_d, M_reg_r_q = 1'h0;
  
  always @* begin
    M_state_d = M_state_q;
    M_reg_r_d = M_reg_r_q;
    M_level_d = M_level_q;
    M_reg_d_d = M_reg_d_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    r_red = M_mat_dis_r_red;
    r_green = M_mat_dis_r_green;
    col = M_mat_dis_col;
    M_ctrl_state = 1'h0;
    M_ctrl_d = M_reg_d_q;
    M_ctrl_r = M_reg_r_q;
    M_level_d = 1'h0;
    M_data_mem_call_level_adr_i = M_level_q;
    M_chk_value = M_alu_alu;
    M_chk_check_win = M_ctrl_check_win;
    M_data_mem_call_sel_start = M_ctrl_sel_start;
    M_data_mem_call_sel_map = M_ctrl_sel_map;
    M_decoder_sel_new_pos = M_ctrl_sel_new_pos;
    M_data_mem_call_r0_i = M_chk_r0;
    M_decoder_curr_tp = M_data_mem_call_curr_tp;
    M_decoder_mapdata = M_data_mem_call_curr_map;
    M_data_mem_call_new_tp_i = M_decoder_new_tp;
    M_alu_alufn = M_ctrl_alufn;
    M_alu_a = M_ctrl_sel_check ? M_chk_r1 : M_data_mem_call_curr_ep;
    M_alu_b = M_ctrl_sel_check ? M_chk_r2 : M_data_mem_call_curr_tp;
    led = 8'h00;
    led = M_ctrl_sel_new_pos;
    
    case (M_state_q)
      START_state: begin
        M_ctrl_state = 1'h0;
        if (M_start_edge_detector_out) begin
          M_state_d = WAIT_state;
        end
      end
      WAIT_state: begin
        M_ctrl_state = 1'h1;
        if (M_reg_d_q != 1'bz) begin
          M_state_d = CHECKB_state;
        end
      end
      CHECKA_state: begin
        M_ctrl_state = 2'h2;
        M_state_d = WAIT_state;
      end
      CHECKB_state: begin
        M_ctrl_state = 2'h3;
        M_state_d = WAIT_state;
      end
      CHECKWIN_state: begin
        M_ctrl_state = 3'h4;
        M_reg_d_d = 1'bz;
        if (M_start_edge_detector_out) begin
          if (M_data_mem_call_r0 == 2'h2) begin
            M_state_d = WIN_state;
          end else begin
            if (M_data_mem_call_r0 == 1'h1) begin
              M_state_d = WAIT_state;
              M_reg_r_d = 1'h1;
            end else begin
              M_state_d = WAIT_state;
            end
          end
        end
      end
      WIN_state: begin
        M_ctrl_state = 3'h5;
      end
    endcase
    M_right_edge_detector_in = right_btn;
    M_left_edge_detector_in = left_btn;
    M_up_edge_detector_in = up_btn;
    M_down_edge_detector_in = down_btn;
    M_reset_edge_detector_in = reset_btn;
    M_start_edge_detector_in = start_btn;
    if (M_right_edge_detector_out) begin
      M_reg_d_d = 2'h3;
    end
    if (M_left_edge_detector_out) begin
      M_reg_d_d = 2'h2;
    end
    if (M_up_edge_detector_out) begin
      M_reg_d_d = 1'h1;
    end
    if (M_down_edge_detector_out) begin
      M_reg_d_d = 1'h0;
    end
    M_reg_r_d = 1'h0;
    if (M_reset_edge_detector_out) begin
      M_reg_r_d = 1'h1;
    end
    M_mat_dis_red = M_data_mem_call_red;
    M_mat_dis_green = M_data_mem_call_green;
  end
  
  always @(posedge clk) begin
    M_level_q <= M_level_d;
    M_reg_d_q <= M_reg_d_d;
    M_reg_c_q <= M_reg_c_d;
    M_reg_r_q <= M_reg_r_d;
    M_state_q <= M_state_d;
  end
  
endmodule
