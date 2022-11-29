`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// name - Amit Kumar, Nikhil Saraswat
// Roll- 20CS30003, 20CS10039
// COA - KGP_RISC
//////////////////////////////////////////////////////////////////////////////////
module CLA_32bit_withLCU( in1, in2, c_in, sum, c_out) ;
    output [31:0] sum;
    output c_out;
    input [31:0] in1 , in2;
    input c_in; 
	
	wire [3:0] P, G; // wires for connecting block propagate and generate from 4-bit CLAs to lookahead carry unit
	wire carry; // wires for connecting carries from lookahead carry unit to the 4-bit CLAs
	
	
    // 16 bit adder by using four augmented 4-bit CLAs and a lookahead carry unit

	
	CLA_16bit_withLCU cla1(.in1(in1[31:16]), .in2(in2[31:16]), .c_in(carry), .sum(sum[31:16]), .c_out(c_out));
	CLA_16bit_withLCU cla2(.in1(in1[15:0]), .in2(in2[15:0]), .c_in(c_in), .sum(sum[15:0]), .c_out(carry));

endmodule

