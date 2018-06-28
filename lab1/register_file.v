`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:01:23 04/11/2018 
// Design Name: 
// Module Name:    register_file 
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
module register_file( Ra, Rb, Rw, WrEn, busW, clk, rst, busA, busB
    );
	 
	input wire clk, rst, WrEn;
	input wire [4:0] Ra, Rb, Rw; 
	input wire [15:0] busW;
	output wire [15:0] busA, busB;
	 
	reg [15:0] Rf [31:0]; 
	reg [15:0] i;
	initial begin
		for (i=0; i<=31; i=i+1) begin
			Rf[i] <= 16'b0;
		end
	end
	
	reg [15:0] busA_i, busB_i;
	
	assign busA = busA_i;
	assign busB = busB_i;
	
	always @ (posedge clk)
	begin
		if (rst) begin
			for (i=0; i<=31; i=i+1) begin
				Rf[i] = 16'b0;
			end	
		end
		else begin
			// busA = Rf[Ra] : set busA to our Rf of Ra. 
			//	busB = Rf[Rb] : set busB to Rf of Rb 
			// while checking if WrEn is high. if so, Rf[Rw] = busW
			if (WrEn) begin
				Rf[Rw] = busW;
			end
			busA_i = Rf[Ra];
			busB_i = Rf[Rb];
		end
	end

endmodule
