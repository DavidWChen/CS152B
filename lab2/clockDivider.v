`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:55:59 04/16/2018 
// Design Name: 
// Module Name:    clockDivider 
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
//////////////////////////////////////////////////////////////////////////////////
module clockDivider(
	clkIn,
	reset,
	clkOut
    );
	input clkIn, reset;
	output reg clkOut;
	
	initial begin
		clkOut = 0;
	end
	
	reg [31:0] a;
   always @ (posedge clkIn) begin
       if (reset) begin
           a <= 32'b0;
			  clkOut <= 0;	  
       end
       else begin
			a <= (a <= 50000000) ? a + 1 : 0;  
			if(!a) begin// 50_000_000 is 1Hz
				clkOut <= ~clkOut;
			end
		 end
   end
endmodule
