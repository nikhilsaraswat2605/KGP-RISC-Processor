`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

module InstrMem_tb;

	// Inputs
	reg clk;
	reg [9:0] addra;

	// Outputs
	wire [31:0] douta;

	// Instantiate the Unit Under Test (UUT)
	InstrMem uut (
		.clka(clk), 
		.addra(addra), 
		.douta(douta)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		addra = 0;

		// Wait 100 ns for global reset to finish
		#100;

		@(posedge clk)
		addra = 10'd0;
		
		#10; addra = 10'd0;
		#10; addra = 10'd1;
		
		// Add stimulus here
	end
	
	always
	#5 clk = ~clk;
	   
endmodule
