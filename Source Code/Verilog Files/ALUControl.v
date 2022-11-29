`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// name - Amit Kumar, Nikhil Saraswat
// Roll- 20CS30003, 20CS10039
// COA - KGP_RISC
//////////////////////////////////////////////////////////////////////////////////
module ALUControl(
    input [5:0] opcode,
	 input [5:0] funcode,
    output reg [3:0] alucode
	 ); 
	 
	 always @(*) begin
		 if (opcode[5] == 1)
		     alucode = 4'b0;
		 else if (opcode == 6'b0)
		     alucode = funcode[3:0];
		 else if (opcode == 6'b001000 || opcode[5:4] == 2'b01)
		     alucode = 4'b0001;
		 else if (opcode == 6'b001001)
		     alucode = 4'b0101;
       else 
           alucode = 4'b0000;		 
	 end
endmodule