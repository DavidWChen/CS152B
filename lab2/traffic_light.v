`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:41:05 04/16/2018 
// Design Name: 
// Module Name:    traffic_light 
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
module traffic_light(
	clock , // Clock input of the design
	reset ,
	walk ,
	sensor,
	main_r,
	main_y,
	main_g,
	side_r,
	side_y,
	side_g,
	clk1Hz,
	walk_reg
    );
	 
	input wire clock, reset, walk, sensor ;
	output wire	main_r, main_y, main_g, side_r, side_y, side_g;
	output wire walk_reg;

	// Clock Divider
	output wire clk1Hz;
	wire walk_d;
	
	debouncer mod_debouncer (
	.clock(clock),
	.reset(reset),
	.button(walk),
	.out(walk_d)
	);
	
	clockDivider mod_clockDivider (
	.clkIn(clock),
	.reset(reset),
	.clkOut(clk1Hz)
	);
	
	traffic_light_fsm mod_traffic_light_fsm (
	.master_clock(clock),
	.clock(clk1Hz), 
	.reset(reset), 
	.walk(walk_d), 
	.sensor(sensor), 
	.main_r(main_r),
	.main_y(main_y),
	.main_g(main_g),
	.side_r(side_r),
	.side_y(side_y),
	.side_g(side_g),
	.walk_reg(walk_reg)
	);
	

endmodule
