`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:48:20 04/06/2018
// Design Name:   one_bit_ALU
// Module Name:   C:/Users/CS152B/Desktop/spring18/lab1/one_bit_ALU_tb.v
// Project Name:  lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: one_bit_ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module one_bit_ALU_tb;

	// Inputs
	reg a;
	reg b;
	reg binvert;
	reg carryIn;
	reg [1:0] operation;

	// Outputs
	wire result;
	wire carryOut;

	// Instantiate the Unit Under Test (UUT)
	one_bit_ALU uut (
		.a(a), 
		.b(b), 
		.binvert(binvert), 
		.carryIn(carryIn), 
		.operation(operation), 
		.result(result), 
		.carryOut(carryOut)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		binvert = 0;
		carryIn = 0;
		operation = 0;

		// Wait 100 ns for global reset to finish
		#100;
		a = 1;
		b = 0;
		binvert = 1;
		carryIn = 0;
		operation = 2;
        
		// Add stimulus here

	end
      
endmodule

