`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// name - Amit Kumar, Nikhil Saraswat
// Roll- 20CS30003, 20CS10039
// COA - KGP_RISC
//////////////////////////////////////////////////////////////////////////////////
module RegisterFile(
	regWrite,readAddr1,readAddr2,writeAddr,writeData,clk,rst,readData1,readData2
    );
	input regWrite;
	input [4:0] readAddr1;
	input [4:0] readAddr2;
	input [4:0] writeAddr;
	input [31:0] writeData;
	input clk;
	input rst;
	output [31:0] readData1;
	output [31:0] readData2;
	
	
	reg [31:0] r[31:0];
	
	assign readData1=r[readAddr1];
	assign readData2=r[readAddr2];
	
	always @(posedge clk or posedge rst)begin
		if (rst) begin
			r[0]=0;
			r[1]=0;
			r[2]=0;
			r[3]=0;
			r[4]=0;
			r[5]=0;
			r[6]=0;
			r[7]=0;
			r[8]=0;
			r[9]=0;
			r[10]=0;
			r[11]=0;
			r[12]=0;
			r[13]=0;
			r[14]=0;
			r[15]=0;
			r[16]=0;
			r[17]=0;
			r[18]=0;
			r[19]=0;
			r[20]=0;
			r[21]=0;
			r[22]=0;
			r[23]=0;
			r[24]=0;
			r[25]=0;
			r[26]=0;
			r[27]=0;
			r[28]=0;
			r[29]=0;
			r[30]=0;
			r[31]=0;
		end
		else if (regWrite) begin
			r[writeAddr]=writeData;
		end
	end
	
endmodule
