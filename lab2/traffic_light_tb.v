`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:14:34 04/16/2018
// Design Name:   traffic_light
// Module Name:   C:/Users/CS152B/Desktop/spring18/lab2/traffic_light_tb.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: traffic_light
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module traffic_light_tb;

	// Inputs
	reg clock;
	reg reset;
	reg walk;
	reg sensor;

	// Outputs
	wire led;

	// Instantiate the Unit Under Test (UUT)
	traffic_light uut (
		.clock(clock), 
		.reset(reset), 
		.walk(walk), 
		.sensor(sensor), 
		.led(led)
	);

	initial begin
		// Initialize Inputs
		 clock = 0; // initial value of clock
		 reset = 0; // initial value of reset
		 #10 reset = 1; // Assert the reset
		 #100 reset = 0; // De-assert the reset
		walk = 0;
		sensor = 0;
		end
		// Add stimulus here
		// Clock generator
		always begin
		 #5 clock = ~clock; // Toggle clock every 5 ticks
		end
      
endmodule

