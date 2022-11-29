`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// name - Amit Kumar, Nikhil Saraswat
// Roll- 20CS30003, 20CS10039
// COA - KGP_RISC
//////////////////////////////////////////////////////////////////////////////////
module CLA_4bit_augmented(in1,in2,c_in,sum,p,g);

   output p,g; 
   output [3:0] sum; //output sum
   input c_in;  //carry input
   input [3:0] in1,in2; //inputs
	
	wire [3:0] carry;   //carry wire
	wire [3:0] G, P; // wires for bitwise generate, propagate and carries
	
	// calculate bitwise generate and propagate
	assign P = in1 ^ in2;   //bitwise propagate = in1 xor in2
	assign G = in1 & in2;  //bitwise generate = in1 and in2
	
	
	// calculate block propagate and generate for next level
	assign p = P[0] & P[1] & P[2] & P[3];   // p = P[0] and P[1] and P[2] and P[3]
	assign g = (G[0] & P[3] & P[2] & P[1]) | (G[1] & P[3] & P[2]) | (G[2] & P[3]) | G[3]; // g = G[0] and P[3] and P[2] and P[1] or G[1] and P[3] and P[2] or G[2] and P[3] or G[3]
	
	// calculate final sum using propagate and carries
	assign sum = carry ^ P; // sum = carry xor P
	
	// calculate subsequent carries using generates and propagates
	assign carry[3] = (carry[0] & P[2] & P[1] & P[0]) | (G[0] & P[2] & P[1]) | (G[1] & P[2]) | G[2];    // carry[3] = carry[0] and P[2] and P[1] and P[0] or G[0] and P[2] and P[1] or G[1] and P[2] or G[2]
	assign carry[2] = (carry[0] & P[1] & P[0]) | (G[0] & P[1]) | G[1];                               // carry[2] = carry[0] and P[1] and P[0] or G[0] and P[1] or G[1]
	assign carry[1] = (P[0] & carry[0]) | G[0];                                                    // carry[1] = P[0] and carry[0] or G[0]
	assign carry[0] = c_in;                                                                     // carry[0] = c_in
	


endmodule
