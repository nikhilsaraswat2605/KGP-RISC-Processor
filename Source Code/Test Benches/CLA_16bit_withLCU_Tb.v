`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:00:20 10/21/2022
// Design Name:   CLA_16bit_withLCU
// Module Name:   /home/nikhil/Downloads/KGP_RISC/CLA_16bit_withLCU_Tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA_16bit_withLCU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CLA_16bit_withLCU_Tb;

	wire [15:0] sum;
	wire c_out;


	// Inputs
	reg [15:0] in1 , in2;
	reg c_in;

	// Instantiate the Unit Under Test (UUT)
	CLA_16bit_withLCU uut ( .in1(in1), .in2(in2), .c_in(c_in), .sum(sum), .c_out(c_out));

	initial begin
		$monitor ("in1 = %d, in2 = %d, c_in = %d, c_out = %d, sum = %d", in1, in2, c_in, c_out, sum);
		// Initialize Inputs
		#100;
		in1 = 16'd1; in2 = 16'd2; c_in = 0;
		

	end
      
endmodule

