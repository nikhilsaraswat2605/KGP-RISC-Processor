`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:48:19 10/21/2022
// Design Name:   CLA_32bit_withLCU
// Module Name:   /home/nikhil/Downloads/KGP_RISC/CLA_32bit_withLCU_Tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA_32bit_withLCU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CLA_32bit_withLCU_Tb;

	wire [31:0] sum;
	wire c_out;


	// Inputs
	reg [31:0] in1 , in2;
	reg c_in;

	// Instantiate the Unit Under Test (UUT)
	CLA_32bit_withLCU uut ( .in1(in1), .in2(in2), .c_in(c_in), .sum(sum), .c_out(c_out));

	initial begin
		$monitor ("in1 = %d, in2 = %d, c_in = %d, c_out = %d, sum = %d", in1, in2, c_in, c_out, sum);
		// Initialize Inputs
		#100;
		in1 = 32'd2147483648; in2 = 32'd1073741824; c_in = 0;
		#100;
		in1 = 32'd214748348; in2 = 32'd1073741824; c_in = 0;
		#100;
		in1 = 32'd2147483648; in2 = 32'd103741824; c_in = 0;
		#100;
		in1 = 32'd147483648; in2 = 32'd3741824; c_in = 0;
		#100;
		in1 = 32'd2183648; in2 = 32'd1073741824; c_in = 0;
		#100;
		in1 = 32'd2147483648; in2 = 32'd1073724; c_in = 0;
		#100;
		in1 = 32'd2147448; in2 = 32'd1073741824; c_in = 0;
		#100;
		in1 = 32'd2147483648; in2 = 32'd1073824; c_in = 0;
		#100;
		in1 = 32'd2147483648; in2 = 32'd1071824; c_in = 0;
		#100;
		in1 = 32'd2147483648; in2 = 32'd2147483648; c_in = 0;
		

	end
      
endmodule

