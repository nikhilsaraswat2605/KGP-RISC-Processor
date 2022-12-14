`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// name - Amit Kumar, Nikhil Saraswat
// Roll- 20CS30003, 20CS10039
// COA - KGP_RISC
//////////////////////////////////////////////////////////////////////////////////
module Adder(a,b,sum,carry);
	 input [31:0] a;
	 input [31:0] b;
	 output [31:0] sum;
	 output carry;
	 assign {carry,sum} =a+b;

endmodule
