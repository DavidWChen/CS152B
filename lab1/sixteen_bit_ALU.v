`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:53:48 04/06/2018 
// Design Name: 
// Module Name:    sixteen_bit_ALU 
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
module sixteen_bit_ALU(a, b, aluCtrl, overflow, s, zero);
	input [15:0] a, b ;
	input [3:0] aluCtrl ;
	output wire [15:0] s;
	output wire overflow, zero ;
	
	wire[15:0] add_result, sub_result, decr_result, incr_result, bitOR_result, bitAND_result, invert_result, asl_result, asr_result, lsl_result, lsr_result, slt_result ;

	assign bitOR_result = a | b;	// bitwise OR
	assign bitAND_result = a & b; // bitwise AND
	assign invert_result = ~a; // invert
	assign lsl_result = a << b ; // logical shift left
	assign lsr_result = a >> b ; // logical shift right
	assign asl_result = $signed(a) <<< b ; // arithmetic shift left
	assign asr_result = $signed(a) >>> b ; // arithmetic shift right
	assign slt_result = (sub_result >> 15) | zero; // grab the MSB of the subtraction
	
	
	wire[15:0] b_twos_comp ;
	assign b_twos_comp = ~b + 1 ;
	// to get zero, nor S with 0
	assign zero = ~(s[0] | s[1] | s[2] | s[3] | s[4] | s[5] | s[6] | s[7] | s[8] | s[9] | s[10] | s[11] | s[12] | s[13] | s[14] | s[15]) ;


	//TODO : Overflow
	// idea: compare carry bit to sign bit
	// DO overflow for shift operations as well !
	

	asynch_mux4 mod_asynch_mux4(
	.in0(sub_result), 
	.in1(add_result), 
	.in2(bitOR_result), 
	.in3(bitAND_result), 
	.in4(decr_result), 
	.in5(incr_result), 
	.in6(invert_result), 
	.in7(asl_result), 
	.in8(asr_result), 
	.in9(lsl_result), 
	.in10(lsr_result), 
	.in11(slt_result), 
	.sel(aluCtrl), 
	.out(s)
	);
	/*
	wire overflow_add;
	wire overflow_sub;
	wire overflow_decr;
	wire overflow_incr;
	
	*/
	
	
	
	
	wire ovf_sub = ((~((a>>15) | (b_twos_comp>>15)) & (sub_result>>15)) | ((a>>15) &(b_twos_comp>>15) & ~(sub_result>>15)));
	
	wire ovf_add =  ((~((a>>15) | (b>>15)) & (add_result>>15)) | ((a>>15) & (b>>15) & ~(add_result>>15)));
	
	wire ovf_decr =  (((a>>15) &(1) & ~(decr_result>>15)));
	
	wire ovf_incr = ((~((a>>15) | (0)) & (incr_result>>15)) );
	
	wire ovf_asl = (asl_result>>15) ^ (a>>15);
	
	overflow_mux4 mod_overflow_mux(
	.in0(ovf_sub), 
	.in1(ovf_add), 
	.in2(ovf_decr), 
	.in3(ovf_incr),
	.in4(ovf_asl) ,
	.sel(aluCtrl), 
	.out(overflow)
	);
	
	adder_explicit mod_adder_explicit(
	.result(add_result), 
	.carry(overflow_add), 
	.r1(a), 
	.r2(b), 
	.ci(1'b0)
	);
	
	adder_explicit mod_sub_explicit(
	.result(sub_result), 
	.carry(overflow_sub), 
	.r1(a), 
	.r2(b_twos_comp), 
	.ci(1'b0)
	);
	
	adder_explicit mod_decr_explicit(
	.result(decr_result), 
	.carry(overflow_decr), 
	.r1(a), 
	.r2(16'b1111111111111111), 
	.ci(1'b0)
	);
	
	adder_explicit mod_incr_explicit(
	.result(incr_result), 
	.carry(overflow_incr), 
	.r1(a), 
	.r2(16'b0000000000000001), 
	.ci(1'b0)
	);

endmodule


module overflow_mux4(in0, in1, in2, in3, in4, sel, out);
	input in0, in1, in2, in3, in4;
	input [3:0] sel;
	output reg out;
	
	always @ (sel or in0 or in1 or in2 or in3 or in4)
	begin
		if (sel == 4'b0000) begin //subtraction
			out <= in0;
		end 
		else if (sel == 4'b0001) begin //additiion
			out <= in1;
		end
		else if (sel == 4'b0100) begin//decrement
			out <= in2;
		end 
		else if (sel == 4'b0101) begin//increment
			out <= in3;
		end 
		else if (sel == 4'b1100) begin//asl
			out <= in4;
		end 
		else begin
			out <= 0;
		end
	end
endmodule


module asynch_mux4(in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, sel, out);
	input[15:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11;
	input [3:0] sel;
	output reg[15:0] out;
	
	always @ (sel or in0 or in1 or in2 or in3)
	begin
		if (sel == 4'b0000) begin //subtraction
			out <= in0;
		end 
		else if (sel == 4'b0001) begin //additiion
			out <= in1;
		end
		else if (sel == 4'b0010) begin //bitwise OR
			out <= in2;
		end 
		else if (sel == 4'b0011) begin// bitwise AND
			out <= in3;
		end 
		else if (sel == 4'b0100) begin//decrement
			out <= in4;
		end 
		else if (sel == 4'b0101) begin//increment
			out <= in5;
		end 
		else if (sel == 4'b0110) begin//invert
			out <= in6;
		end 
		else if (sel == 4'b1100) begin//arithmatic shift left
			out <= in7;
		end 
		else if (sel == 4'b1110) begin//arithmatic shift right
			out <= in8;
		end 
		else if (sel == 4'b1000) begin//logical shift left
			out <= in9;
		end 
		else if (sel == 4'b1010) begin//logical shift right
			out <= in10;
		end 
		else if (sel == 4'b1001) begin//slt
			out <= in11;
		end 
	end
endmodule


module adder_explicit (result, carry, r1, r2, ci);
// IO Port Declarations
	input [15:0] r1;
	input [15:0] r2;
	input ci;
	output [15:0] result;
	output carry;
	
	wire [15:0] r1;
	wire [15:0] r2;
	wire ci, carry;
	wire [15:0] result;
	wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15;

	addbit u0 (.a (r1[0]), .b (r2[0]), .ci (ci), .sum (result[0]), .co (c1));
	addbit u1 (.a (r1[1]), .b (r2[1]), .ci (c1), .sum (result[1]), .co (c2));
	addbit u2 (.a (r1[2]), .b (r2[2]), .ci (c2), .sum (result[2]), .co (c3));
	addbit u3 (.a (r1[3]), .b (r2[3]), .ci (c3), .sum (result[3]), .co (c4));
	addbit u4 (.a (r1[4]), .b (r2[4]), .ci (c4), .sum (result[4]), .co (c5));
	addbit u5 (.a (r1[5]), .b (r2[5]), .ci (c5), .sum (result[5]), .co (c6));
	addbit u6 (.a (r1[6]), .b (r2[6]), .ci (c6), .sum (result[6]), .co (c7));
	addbit u7 (.a (r1[7]), .b (r2[7]), .ci (c7), .sum (result[7]), .co (c8));
	addbit u8 (.a (r1[8]), .b (r2[8]), .ci (c8), .sum (result[8]), .co (c9));
	addbit u9 (.a (r1[9]), .b (r2[9]), .ci (c9), .sum (result[9]), .co (c10));
	addbit u10 (.a (r1[10]), .b (r2[10]), .ci (c10), .sum (result[10]), .co (c11));
	addbit u11 (.a (r1[11]), .b (r2[11]), .ci (c11), .sum (result[11]), .co (c12));
	addbit u12 (.a (r1[12]), .b (r2[12]), .ci (c12), .sum (result[12]), .co (c13));
	addbit u13 (.a (r1[13]), .b (r2[13]), .ci (c13), .sum (result[13]), .co (c14));
	addbit u14 (.a (r1[14]), .b (r2[14]), .ci (c14), .sum (result[14]), .co (c15));
	addbit u15 (.a (r1[15]), .b (r2[15]), .ci (c15), .sum (result[15]), .co (carry));
	

endmodule
