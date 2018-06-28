`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:22:14 04/16/2018
// Design Name:   clockDivider
// Module Name:   C:/Users/CS152B/Desktop/spring18/lab2/clockDivider_tb.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clockDivider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clockDivider_tb;

	// Inputs
	reg clkIn;
	reg reset;

	// Outputs
	wire clkOut;

	// Instantiate the Unit Under Test (UUT)
	clockDivider uut (
		.clkIn(clkIn), 
		.reset(reset), 
		.clkOut(clkOut)
	);

	initial begin
		// Initialize Inputs
		clkIn = 0;
		reset = 0;
		#10 reset = 1; // Assert the reset
		 #100 reset = 0; // De-assert the reset
        
		// Add stimulus here
	end
	
		// Add stimulus here
		// Clock generator
		always begin
		 #5 clkIn = ~clkIn; // Toggle clock every 5 ticks
		end
      
endmodule

