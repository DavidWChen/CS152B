`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:00:49 04/09/2018
// Design Name:   sixteen_bit_ALU
// Module Name:   C:/Users/CS152B/Desktop/spring18/lab1/sixteen_bit_ALU_tb.v
// Project Name:  lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sixteen_bit_ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sixteen_bit_ALU_tb;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg [3:0] aluCtrl;

	// Outputs
	wire overflow;
	wire [15:0] s;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	sixteen_bit_ALU uut (
		.a(a), 
		.b(b), 
		.aluCtrl(aluCtrl), 
		.overflow(overflow), 
		.s(s), 
		.zero(zero)
	);

	initial begin
		// Addition test
		a = 4;
		b = 5;
		aluCtrl = 4'b0001;

		#10
		
		// Subtraction
		a = 1;
		b = 2;
		aluCtrl = 4'b0000;
		
		#10
      
		// Bitwise OR
		a = 0;
		b = 1;
		aluCtrl = 4'b0010;
		
		#10
      
		// Bitwise AND
		a = 0;
		b = 1;
		aluCtrl = 4'b0011;
		
		#10

		// Decrement
		a = 0;
		b = 1;
		aluCtrl = 4'b0100;
		
		#10
		
		// Increment
		a = 0;
		b = 1;
		aluCtrl = 4'b0101;
		
		#10
		
		// Invert
		a = 0;
		b = 1;
		aluCtrl = 4'b0110;
		
		#10
		
		// ASL
		a = -1;
		b = 1;
		aluCtrl = 4'b1100;
		
		#10
		
		// ASR
		a = -1;
		b = 1;
		aluCtrl = 4'b1110;
		
		#10
		
		// LSL
		a = -1;
		b = 1;
		aluCtrl = 4'b1000;
		
		#10
		
		// LSR
		a = -1;
		b = 1;
		aluCtrl = 4'b1010;
		
		#10
		
		// SLT
		a = -1;
		b = 1;
		aluCtrl = 4'b1001;
		
		#10
		
		// SLT: test 2
		a = 5;
		b = 1;
		aluCtrl = 4'b1001;
		
		#10
		
		// SLT: test 3
		a = 1;
		b = 1;
		aluCtrl = 4'b1001;
		
		// Demonstrate overflows
		
		#10
		//////////////ADD TESTING////////////////
		//add test OVERFLOW=true : int_max + 1
		a = 16'b0111111111111111;
		b = 16'b0000000000000001;
		aluCtrl = 4'b0001;
		
		#10
		//add test OVERFLOW=false : -1 + 1
		a = 16'b1111111111111111;
		b = 16'b0000000000000001;
		aluCtrl = 4'b0001;
		
		#10
		//////////////SUB TESTING////////////////
		//sub test OVERFLOW=true : int_min - 1
		a = 16'b1000000000000000;
		b = 16'b0000000000000001;
		aluCtrl = 4'b0000;
		
		#10
		//sub test OVERFLOW=false : 0 - 1
		a = 16'b0000000000000000;
		b = 16'b0000000000000001;
		aluCtrl = 4'b0000;
		
		#10
		//////////////INCR TESTING////////////////
		//incr test OVERFLOW=true : int_max ++
		a = 16'b0111111111111111;
		b = 1;
		aluCtrl = 4'b0101;
		
		#10
		//incr test OVERFLOW=false : -1 ++
		a = 16'b1111111111111111;
		b = 1;
		aluCtrl = 4'b0101;
		
		#10
		//////////////DECR TESTING////////////////
		//decr test OVERFLOW=true : int_min --
		a = 16'b1000000000000000;
		b = 1;
		aluCtrl = 4'b0100;
		
		#10
		//decr test OVERFLOW=false : 0 --
		a = 16'b0000000000000000;
		b = 1;
		aluCtrl = 4'b0100;
		
		#10
		//////////////ASL TESTING////////////////
		//asl test OVERFLOW=true : int_min <<< 1
		a = 16'b1000000000000000;
		b = 1;
		aluCtrl = 4'b1100;
		
		#10
		
		// SLT: test 3
		a = 16'b1000000000000000;
		b = 1;
		aluCtrl = 4'b1001;
		
		
	end
      
endmodule

