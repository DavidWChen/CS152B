`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:00:56 04/20/2018
// Design Name:   traffic_light_fsm
// Module Name:   C:/Users/CS152B/Desktop/spring18/lab2/traffic_light_fsm_tb.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: traffic_light_fsm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module traffic_light_fsm_tb;

	// Inputs
	reg clock;
	reg reset;
	reg walk;
	reg sensor;

	// Outputs
	wire main_r;
	wire main_y;
	wire main_g;
	wire side_r;
	wire side_y;
	wire side_g;

	// Instantiate the Unit Under Test (UUT)
	traffic_light_fsm uut (
		.clock(clock), 
		.reset(reset), 
		.walk(walk), 
		.sensor(sensor), 
		.main_r(main_r), 
		.main_y(main_y), 
		.main_g(main_g), 
		.side_r(side_r), 
		.side_y(side_y), 
		.side_g(side_g)
	);

	initial begin
		// Initialize Inputs
		// Initialize Inputs
		clock = 0;
		reset = 0;
		sensor = 0;
		walk = 0;
		#10 reset = 1; // Assert the reset
		#100 reset = 0; // De-assert the reset
        
		// Add stimulus here
	end
	
		// Add stimulus here
		// Clock generator
	always begin
		#5 clock = ~clock; // Toggle clock every 5 ticks
	end

      
endmodule

