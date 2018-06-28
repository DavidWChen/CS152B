`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:22:29 04/11/2018
// Design Name:   register_file
// Module Name:   C:/Users/CS152B/Desktop/spring18/lab1/register_file_tb.v
// Project Name:  lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: register_file
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module register_file_tb;

	// Inputs
	reg [4:0] Ra;
	reg [4:0] Rb;
	reg [4:0] Rw;
	reg WrEn;
	reg [15:0] busW;
	reg clk;
	reg rst;

	// Outputs
	wire [15:0] busA;
	wire [15:0] busB;

	// Instantiate the Unit Under Test (UUT)
	register_file uut (
		.Ra(Ra), 
		.Rb(Rb), 
		.Rw(Rw), 
		.WrEn(WrEn), 
		.busW(busW), 
		.clk(clk), 
		.rst(rst), 
		.busA(busA), 
		.busB(busB)
	);

	initial begin
		// Initialize Inputs
		Ra = 0;
		Rb = 0;
		Rw = 0;
		WrEn = 0;
		busW = 0;
		clk = 0;
		rst = 0;

		clk = 1; // initial value of clock
		rst = 0; // initial value of reset
		
		#10 rst = 1; // Assert the reset
		#10 rst = 0; // De-assert the reset
		
		busW = 16'b1;
		WrEn = 1;
		Rw = 5'b1;
		
		#10
		
		WrEn = 0;
		Ra = 5'b1;		
		
		#10
		
		// Write and read updated value in same clock
		busW = 16'b0000000000000101;
		WrEn = 1;
		Rw = 5'b01111;
		Rb = 5'b01111;		
		
		#10 rst = 1; // Assert the reset
		WrEn = 0;
		#10 rst = 0; // De-assert the reset
		
		// Write into reg
		busW = 16'b0000000000000101;
		WrEn = 1;
		Rw = 5'b11111;
		
		#10 $finish; // Terminate simulation
		
		end
		
		// Clock generator
		always begin
			#5 clk = ~clk; // Toggle clock every 5 ticks
		end
   
      
endmodule

