`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// name - Amit Kumar, Nikhil Saraswat
// Roll- 20CS30003, 20CS10039
// COA - KGP_RISC
//////////////////////////////////////////////////////////////////////////////////
module MUX3_1(
	inp1,inp2,inp3,sel,out
    );
	 input [31:0] inp1;
	 input [31:0] inp2;
	 input [31:0] inp3;
	 input [1:0] sel;
	output reg [31:0] out;
	
	always @(*) begin
		if (sel==2'b00)
			out = inp1;
		else if (sel==2'b01)
			out = inp2;
		else
			out = inp3;
	end
	
endmodule
