`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 		 Intan Technologies, LLC
// 
// Design Name: 	 RHS2000 Rhythm Interface
// Module Name:    RAM_bank
// Project Name:   Opal Kelly FPGA/USB RHS2000 Interface
// Target Devices: 
// Tool versions: 
// Description: 	 Dual-port 8192 x 16 bit RAM bank for storing strings of MOSI command half-words
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

// Dual-port RAM: Port A is used for writing to the RAM from the USB interface.
//                Port B is configured to be read-only, used by the RHS2000 SPI interface.

module RAM_bank(
	input wire 				   clk_A,
	input wire  				clk_B,
	input wire  [12:0] 		RAM_addr_A,
	input wire  [12:0] 		RAM_addr_B,
	input	wire  [15:0] 		RAM_data_in,
	output wire [15:0]	   RAM_data_out_A,
	output wire [15:0]	   RAM_data_out_B,
	input	wire				   RAM_we,
	input wire				   reset
);

	RAM_block_8192x16 RAM_block_0(
		.clk_A(clk_A),
		.clk_B(clk_B),
		.RAM_addr_A(RAM_addr_A),
		.RAM_addr_B(RAM_addr_B),
		.RAM_data_in(RAM_data_in),
		.RAM_data_out_A(RAM_data_out_A),
		.RAM_data_out_B(RAM_data_out_B),
		.RAM_we(RAM_we),
		.reset(reset)
	);

endmodule


module RAM_block_8192x16(
	input wire 				   clk_A,
	input wire  				clk_B,
	input wire  [12:0] 		RAM_addr_A,
	input wire  [12:0] 		RAM_addr_B,
	input	wire  [15:0] 		RAM_data_in,
	output reg  [15:0]	   RAM_data_out_A,
	output reg  [15:0]	   RAM_data_out_B,
	input	wire				   RAM_we,
	input wire				   reset
);

	wire [2:0] RAM_bank_sel_A, RAM_bank_sel_B;
	
	assign RAM_bank_sel_A = RAM_addr_A[12:10];
	assign RAM_bank_sel_B = RAM_addr_B[12:10];

	wire [15:0] RAM_data_out_A_0, RAM_data_out_A_1, RAM_data_out_A_2, RAM_data_out_A_3, RAM_data_out_A_4, RAM_data_out_A_5, RAM_data_out_A_6, RAM_data_out_A_7, RAM_data_out_A_8, RAM_data_out_A_9, RAM_data_out_A_10, RAM_data_out_A_11, RAM_data_out_A_12, RAM_data_out_A_13, RAM_data_out_A_14, RAM_data_out_A_15;
	wire [15:0] RAM_data_out_B_0, RAM_data_out_B_1, RAM_data_out_B_2, RAM_data_out_B_3, RAM_data_out_B_4, RAM_data_out_B_5, RAM_data_out_B_6, RAM_data_out_B_7, RAM_data_out_B_8, RAM_data_out_B_9, RAM_data_out_B_10, RAM_data_out_B_11, RAM_data_out_B_12, RAM_data_out_B_13, RAM_data_out_B_14, RAM_data_out_B_15;
	
	always @(*)
		case(RAM_bank_sel_A)
			3'd0: RAM_data_out_A <= RAM_data_out_A_0;
			3'd1: RAM_data_out_A <= RAM_data_out_A_1;
			3'd2: RAM_data_out_A <= RAM_data_out_A_2;
			3'd3: RAM_data_out_A <= RAM_data_out_A_3;
			3'd4: RAM_data_out_A <= RAM_data_out_A_4;
			3'd5: RAM_data_out_A <= RAM_data_out_A_5;
			3'd6: RAM_data_out_A <= RAM_data_out_A_6;
			3'd7: RAM_data_out_A <= RAM_data_out_A_7;
		endcase
			
	always @(*)
		case(RAM_bank_sel_B)
			3'd0: RAM_data_out_B <= RAM_data_out_B_0;
			3'd1: RAM_data_out_B <= RAM_data_out_B_1;
			3'd2: RAM_data_out_B <= RAM_data_out_B_2;
			3'd3: RAM_data_out_B <= RAM_data_out_B_3;
			3'd4: RAM_data_out_B <= RAM_data_out_B_4;
			3'd5: RAM_data_out_B <= RAM_data_out_B_5;
			3'd6: RAM_data_out_B <= RAM_data_out_B_6;
			3'd7: RAM_data_out_B <= RAM_data_out_B_7;
		endcase

	RAM_1024x16bit RAM_block_0(
		.clk_A(clk_A),
		.clk_B(clk_B),
		.RAM_addr_A(RAM_addr_A),
		.RAM_addr_B(RAM_addr_B),
		.RAM_data_in(RAM_data_in),
		.RAM_data_out_A(RAM_data_out_A_0),
		.RAM_data_out_B(RAM_data_out_B_0),
		.RAM_we(RAM_we & (RAM_bank_sel_A == 3'd0)),
		.reset(reset)
	);
		
	RAM_1024x16bit RAM_block_1(
		.clk_A(clk_A),
		.clk_B(clk_B),
		.RAM_addr_A(RAM_addr_A),
		.RAM_addr_B(RAM_addr_B),
		.RAM_data_in(RAM_data_in),
		.RAM_data_out_A(RAM_data_out_A_1),
		.RAM_data_out_B(RAM_data_out_B_1),
		.RAM_we(RAM_we & (RAM_bank_sel_A == 3'd1)),
		.reset(reset)
	);
		
	RAM_1024x16bit RAM_block_2(
		.clk_A(clk_A),
		.clk_B(clk_B),
		.RAM_addr_A(RAM_addr_A),
		.RAM_addr_B(RAM_addr_B),
		.RAM_data_in(RAM_data_in),
		.RAM_data_out_A(RAM_data_out_A_2),
		.RAM_data_out_B(RAM_data_out_B_2),
		.RAM_we(RAM_we & (RAM_bank_sel_A == 3'd2)),
		.reset(reset)
	);
		
	RAM_1024x16bit RAM_block_3(
		.clk_A(clk_A),
		.clk_B(clk_B),
		.RAM_addr_A(RAM_addr_A),
		.RAM_addr_B(RAM_addr_B),
		.RAM_data_in(RAM_data_in),
		.RAM_data_out_A(RAM_data_out_A_3),
		.RAM_data_out_B(RAM_data_out_B_3),
		.RAM_we(RAM_we & (RAM_bank_sel_A == 3'd3)),
		.reset(reset)
	);
		
	RAM_1024x16bit RAM_block_4(
		.clk_A(clk_A),
		.clk_B(clk_B),
		.RAM_addr_A(RAM_addr_A),
		.RAM_addr_B(RAM_addr_B),
		.RAM_data_in(RAM_data_in),
		.RAM_data_out_A(RAM_data_out_A_4),
		.RAM_data_out_B(RAM_data_out_B_4),
		.RAM_we(RAM_we & (RAM_bank_sel_A == 3'd4)),
		.reset(reset)
	);
		
	RAM_1024x16bit RAM_block_5(
		.clk_A(clk_A),
		.clk_B(clk_B),
		.RAM_addr_A(RAM_addr_A),
		.RAM_addr_B(RAM_addr_B),
		.RAM_data_in(RAM_data_in),
		.RAM_data_out_A(RAM_data_out_A_5),
		.RAM_data_out_B(RAM_data_out_B_5),
		.RAM_we(RAM_we & (RAM_bank_sel_A == 3'd5)),
		.reset(reset)
	);
		
	RAM_1024x16bit RAM_block_6(
		.clk_A(clk_A),
		.clk_B(clk_B),
		.RAM_addr_A(RAM_addr_A),
		.RAM_addr_B(RAM_addr_B),
		.RAM_data_in(RAM_data_in),
		.RAM_data_out_A(RAM_data_out_A_6),
		.RAM_data_out_B(RAM_data_out_B_6),
		.RAM_we(RAM_we & (RAM_bank_sel_A == 3'd6)),
		.reset(reset)
	);
		
	RAM_1024x16bit RAM_block_7(
		.clk_A(clk_A),
		.clk_B(clk_B),
		.RAM_addr_A(RAM_addr_A),
		.RAM_addr_B(RAM_addr_B),
		.RAM_data_in(RAM_data_in),
		.RAM_data_out_A(RAM_data_out_A_7),
		.RAM_data_out_B(RAM_data_out_B_7),
		.RAM_we(RAM_we & (RAM_bank_sel_A == 3'd7)),
		.reset(reset)
	);

endmodule
