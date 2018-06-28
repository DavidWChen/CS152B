`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:10:31 04/06/2018 
// Design Name: 
// Module Name:    one_bit_ALU 
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
module one_bit_ALU(a, b, binvert, carryIn, operation, result, carryOut);
	input a, b, binvert, carryIn ;
	input [1:0] operation ;
	
	output wire result, carryOut ;
	wire invert_result;
	wire and_result = a & invert_result;
	wire or_result = a | invert_result;
	
	//////////Modules//////////
	asynch_mux2 mod_asynch_mux2 (
	.in0(b),
	.in1(~b),
	.sel(binvert),
	.out(invert_result)
	);
	
	addbit mod_addbit (
	.a(a),
	.b(invert_result),
	.ci(carryIn),
	.sum(add_result),
	.co(carryOut)
	);

	asynch_mux3 mod_asynch_mux3 (
	.in0(and_result),
	.in1(or_result),
	.in2(add_result),
	.sel(operation),
	.out(result)
	);

endmodule


module asynch_mux2(in0, in1, sel, out);
	input in0, in1, sel;
	output out;
	reg out;
	
	always @ (sel or in0 or in1)
	begin
		if (sel == 1'b0) begin
			out <= in0;
		end else begin
			out <= in1;
		end
	end
endmodule


module asynch_mux3(in0, in1, in2, sel, out);
	input in0, in1, in2;
	input [1:0] sel;
	output reg out;
	
	always @ (sel or in0 or in1 or in2)
	begin
		if (sel == 2'b00) begin
			out <= in0;
		end 
		else if (sel == 2'b01) begin
			out <= in1;
		end
		else if (sel == 2'b10) begin
			out <= in2;
		end 
	end
endmodule


module addbit (a, b, ci, sum, co);
	input a;
	input b;
	input ci;
	output sum;
	output co;
	//Port Data types
	wire a;
	wire b;
	wire ci;
	wire sum;
	wire co;
	assign {co,sum} = a + b + ci;
endmodule 

