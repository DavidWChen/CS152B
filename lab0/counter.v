`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:48:28 04/04/2018 
// Design Name: 
// Module Name:    counter 
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
module counter(
	clock , // Clock input of the design
	reset , // active high, synchronous Reset input
	enable , // Active high enable signal for counter
	counter_out // 4 bit vector output of the counter
	); // End of port list
	
	//-------------IO Ports-----------------------------
	input clock ;
	input reset ;
	input enable ;
	output [3:0] counter_out ;
	//-------------Input ports Data Type-------------------
	// By rule all the input ports should be wires
	wire clock ;
	wire reset ;
	wire enable ;
	//-------------Clock Divider-------------------
   reg [31:0] a;
	reg clk1Hz ;
   always @ (posedge clock) begin
       if (reset) begin
           a <= 32'b0;
			  counter_out <= #1 4'b0000;
       end
       else begin
			a <= (a <= 50000000) ? a + 1 : 0;  // 50000000  
			if(!a) begin// 50_000_000 is 1Hz //make a the 5 Hz counter 10000000
				if (enable == 1'b1) begin
					counter_out <= #1 counter_out + 1;
				end 
			end
		 end
   end
	//-------------Output Ports Data Type------------------
	// Output port can be a storage element (reg) or a wire
	reg [3:0] counter_out ;

endmodule
