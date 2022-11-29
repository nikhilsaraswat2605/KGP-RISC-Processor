`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// name - Amit Kumar, Nikhil Saraswat
// Roll- 20CS30003, 20CS10039
// COA - KGP_RISC
//////////////////////////////////////////////////////////////////////////////////
module MUX2_1(
    inp1,inp2,sel,out
	 );
	 input [31:0] inp1;
	 input [31:0] inp2;
	 input sel;
	 output [31:0] out;
	 assign out = sel ? inp2 : inp1 ;

endmodule
