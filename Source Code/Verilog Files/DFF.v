`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// name - Amit Kumar, Nikhil Saraswat
// Roll- 20CS30003, 20CS10039
// COA - KGP_RISC
//////////////////////////////////////////////////////////////////////////////////
module DFF(
	in,clk,rst,out
    );
	input in,clk,rst;
	output reg out;
	
	always @(posedge clk or posedge rst) begin
		if(rst)
			out <= 1'b0;
		else
			out <= in;
	end
endmodule
