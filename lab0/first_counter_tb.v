`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:51:27 04/04/2018
// Design Name:   counter
// Module Name:   C:/Users/CS152B/Desktop/RMJ/lab0/first_counter_tb.v
// Project Name:  lab0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module first_counter_tb;

	// Declare inputs as regs and outputs as wires
	reg clock, reset, enable, clk1Hz;;
	wire [3:0] counter_out ;
	// Initialize all variables
	initial begin
	 $display ("time\t clk reset enable counter");
	 $monitor ("%g\t %b %b %b %b",
	 $time, clock, reset, enable, counter_out);
	 clock = 1; // initial value of clock
	 reset = 0; // initial value of reset
	 enable = 0; // initial value of enable
	 #10 reset = 1; // Assert the reset
	 #100 reset = 0; // De-assert the reset
	 #10 enable = 1; // Assert enable
	 #200 enable = 0; // De-assert enable
	 
	 #5 $finish; // Terminate simulation
	end
	// Clock generator
	always begin
	 #5 clock = ~clock; // Toggle clock every 5 ticks
	end
	// Connect DUT to test bench
	counter U_counter (
	clock,
	reset,
	enable,
	counter_out
	);
      
endmodule

