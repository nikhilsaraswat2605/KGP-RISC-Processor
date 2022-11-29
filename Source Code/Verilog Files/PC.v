`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// name - Amit Kumar, Nikhil Saraswat
// Roll- 20CS30003, 20CS10039
// COA - KGP_RISC
//////////////////////////////////////////////////////////////////////////////////
module PC(inp,clk,rst,out);
	 input [31:0] inp;
	 input clk;
	 input rst;
	 output reg [31:0] out;
	 
	// output reg --> in case of always
	// output --> without always
	always @(posedge clk or posedge rst) begin
		if (rst)
			out <= -32'd4;
		else out <= inp;
	end

endmodule

