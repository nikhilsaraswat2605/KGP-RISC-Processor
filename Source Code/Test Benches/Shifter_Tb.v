`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:25:52 11/06/2021
// Design Name:   Shifter
// Module Name:   /home/parth/5th-Sem/Computer-Organization-and-Architecture-Laboratory/KGP-RISC/Shifter_tb.v
// Project Name:  KGP-RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Shifter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Shifter_Tb;


	// Outputs
	wire [31:0] out;

	// Inputs
	reg type;
	reg dir;
	reg [4:0] shamt;
	reg [31:0] a;

	// Instantiate the Unit Under Test (UUT)
	Shifter uut (
		.shamt(shamt), 
		.type(type), 
		.a(a), 
		.out(out),
		.dir(dir) 
	);

	initial begin
		// Initialize Inputs
		shamt = 0;
		a = 32'd2147483648;
		type = 0;
		dir = 0;

		// Wait 100 ns for global reset to finish
		#100;
		$monitor("input = %d, output = %d", a, out);
		
		shamt = 5'd3; #10;
		dir = 1; shamt = 5'd1; #10;
		dir = 1; shamt = 5'd1; type = 1; #10;
		
        
		// Add stimulus here

	end
endmodule