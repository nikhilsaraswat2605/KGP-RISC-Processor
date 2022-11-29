`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////

module RISC_Tb;

	// Inputs
	reg clk;
	reg rst;
	// Instantiate the Unit Under Test (UUT)
	RISC uut (
		.clk(clk), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#2;
		rst = 0;
		#3;
		#5000;
		$finish;
		// Add stimulus here
	end
	
	always @(*) begin
		if (uut.RFile.r[1] == 1) begin
			$monitor("Content of return value register $v0: %d", uut.RFile.r[2]);
			$finish;
		end
	end
	
	always
	#5 clk = ~clk;
      
endmodule
