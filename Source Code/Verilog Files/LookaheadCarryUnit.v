`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:49:21 10/19/2022 
// Design Name: 
// Module Name:    LookaheadCarryUnit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
module LookaheadCarryUnit(c_in,P,G,carry,P_out,G_out);

/*
    Logic:
    
    Take c_in to be carry[0] then
    carry[i] = G[i-1] | (P[i-1] & carry[i-1]), 1 <= i <= 4
    
    Recursively expanding we get
    carry[1] = G[0] | (P[0] & carry[0]) = G[0] | (P[0] & c_in)
    carry[2] = G[1] | (P[1] & carry[1]) = G[1] | (P[1] & G[0]) | (P[1] & P[0] & c_in)
    carry[3] = G[2] | (P[2] & carry[2]) = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & c_in)
    carry[4] = G[3] | (P[3] & carry[3]) = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & c_in)
    
    Also block propogate P_out and generate G_out are calculated as
    P_out = P[3] & P[2] & P[1] & P[0]
    G_out = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0])
*/
    
    output [4:1] carry;
    output P_out , G_out;

    input c_in;
    input [3:0] P , G;

    // calculate the block propagate and generate for the next level
    assign G_out = (P[3] & P[2] & P[1] & G[0]) | G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]);
    assign P_out = P[3] & P[2] & P[1] & P[0];

    // calculate the lookahead carries using block propagate and generate from previous level
    assign carry[4] = (c_in & P[0] & P[1] & P[2] & P[3]) | G[3] | (G[2] & P[3]) | (P[2] & P[3] & G[1]) | (G[0] & P[1] & P[2] & P[3]);
    assign carry[3] = (c_in & P[0] & P[1] & P[2]) | G[2] | (G[1] & P[2]) | (G[0] & P[1] & P[2]);
    assign carry[2] = (c_in & P[0] & P[1]) | G[1] | (G[0] & P[1]);
    assign carry[1] = (c_in & P[0]) | G[0];

endmodule
