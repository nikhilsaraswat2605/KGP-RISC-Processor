`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// name - Amit Kumar, Nikhil Saraswat
// Roll- 20CS30003, 20CS10039
// COA - KGP_RISC
//////////////////////////////////////////////////////////////////////////////////
module ALU(a,b,op,shamt,result,fZero,fSign,fCarry);

	 input [3:0]  op;
	 input [4:0] shamt;
	 output fSign;
	 output reg fCarry; 
	 output reg [31:0] result;
	 output fZero;
    input [31:0] a;
	 input [31:0] b;


	 // used for complement
	 wire [31:0] bInv, selB; 	
	
	 wire [31:0] rA, rAdd, rAnd, rXor, rShift, rDiff; // results for different operations
	 

	 assign rAnd = b & a;                           // and-op
	 assign rXor = a ^ b;                           // xor-op
	 
	 wire [4:0] shiftIn; // shift-register input b/w shamt or b
	 assign shiftIn = op[2] ? shamt : b[4:0]; // if op[2] == 1 shiftInput = shamt else b[4:0]


	 wire [31:0] const1, selA;
	 assign const1 = 32'd1;
	 assign selA = op[2] ? const1 : a;

	 assign selB = op[2] ? bInv : b;
	 assign bInv = ~b;

	 
	 assign rA = a;                                 // forward a itself
	 CLA_32bit_withLCU A1(selA, selB, 0,  rAdd, cOut);              // adder / complement
	 Diff Diff1(a, b, rDiff);

	 Shifter S(shiftIn, a, op[1], op[0], rShift);   // shift-op
	
	 always @(*) begin 
	     if (op[3] == 1)
		     result = rShift;
		  else if (op == 4'b0001) begin
			  fCarry = cOut;
		     result = rAdd;
		  end
		  else if (op == 4'b0010)
		     result = rAnd;
		  else if (op == 4'b0011)
		     result = rXor;
		  else if (op == 4'b0101)
			  result = rAdd;
			else if (op == 4'b0100)
				result = rDiff;
		  else
		     result = rA;
	 end
	 
	assign fSign = result[31];
	assign fZero = (result == 32'b0);

endmodule