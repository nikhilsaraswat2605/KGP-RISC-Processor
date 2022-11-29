`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// name - Amit Kumar, Nikhil Saraswat
// Roll- 20CS30003, 20CS10039
// COA - KGP_RISC
//
//////////////////////////////////////////////////////////////////////////////////
module BranchControl(opcode,fZero,fSign,fCarry,out);
	
	 input fSign;
	 input fCarry;
	 output out;
    input [5:0] opcode;
	 input fZero;

	
	 wire b, bZero, bNZero, bSign, bCarry, bNCarry;
	 
	 assign b = (opcode == 6'b101011) |(opcode == 6'b101000) | (opcode == 6'b100000); 
	 assign bZero = (opcode == 6'b110001) & fZero;
	 assign bCarry = (opcode == 6'b101001) & fCarry;
	 assign bNCarry = (opcode == 6'b101010) & ~fCarry;
	 assign bNZero = (opcode == 6'b110010) & ~fZero;
	 assign bSign = (opcode == 6'b110000) & fSign;

	 
	 assign out = b | bZero | bNZero | bSign | bCarry | bNCarry;	 
	 
endmodule