`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:14:40 10/26/2022
// Design Name:   Diff
// Module Name:   /home/nikhil/Downloads/KGP_RISC/Diff_Tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Diff
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Diff_Tb;

	// Inputs
	reg [31:0] rs;
	reg [31:0] rt;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	Diff uut (
		.rs(rs), 
		.rt(rt), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		rs = 0;
		rt = 0;

		// Wait 100 ns for global reset to finish
		$monitor("rs = %d, rt = %d, out = %d", rs, rt, out);
		rs = 32'd4 ; rt=32'd2;
		#100;        
		// Add stimulus here

	end
      
endmodule

