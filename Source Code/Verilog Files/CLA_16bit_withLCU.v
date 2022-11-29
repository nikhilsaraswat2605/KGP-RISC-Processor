`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// name - Amit Kumar, Nikhil Saraswat
// Roll- 20CS30003, 20CS10039
// COA - KGP_RISC
//////////////////////////////////////////////////////////////////////////////////
module CLA_16bit_withLCU( in1, in2, c_in, sum, c_out) ;
    output [15:0] sum;
    output c_out ;
		wire p , g;
    input [15:0] in1 , in2;
    input c_in; 
	
    wire [3:0] P, G; // wires for connecting block propagate and generate from 4-bit CLAs to lookahead carry unit
	wire [4:1] carry; // wires for connecting carries from lookahead carry unit to the 4-bit CLAs
	
	
    // 16 bit adder by using four augmented 4-bit CLAs and a lookahead carry unit
	CLA_4bit_augmented cla4(.in1(in1[15:12]), .in2(in2[15:12]), .c_in(carry[3]), .sum(sum[15:12]), .p(P[3]), .g(G[3]));
	CLA_4bit_augmented cla3(.in1(in1[11:8]), .in2(in2[11:8]), .c_in(carry[2]), .sum(sum[11:8]), .p(P[2]), .g(G[2]));
	CLA_4bit_augmented cla2(.in1(in1[7:4]), .in2(in2[7:4]), .c_in(carry[1]), .sum(sum[7:4]), .p(P[1]), .g(G[1]));
	CLA_4bit_augmented cla1(.in1(in1[3:0]), .in2(in2[3:0]), .c_in(c_in), .sum(sum[3:0]), .p(P[0]), .g(G[0]));
	
	LookaheadCarryUnit lcu(.c_in(c_in), .P(P), .G(G), .carry(carry), .P_out(p), .G_out(g));
	
	assign c_out = carry[4];


endmodule
