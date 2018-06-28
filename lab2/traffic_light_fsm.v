`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:18:02 04/18/2018 
// Design Name: 
// Module Name:    traffic_light_fsm 
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
module traffic_light_fsm(
	master_clock,
	clock, 
	reset, 
	walk, 
	sensor, 
	main_r,
	main_y,
	main_g,
	side_r,
	side_y,
	side_g,
	walk_reg
		);
		
	input wire master_clock, clock, reset, walk, sensor;
	output reg main_r, main_y, main_g, side_r, side_y, side_g ;
	
	parameter SIZE = 3 ;
	
	parameter STATE_1 = 3'b000,
				 STATE_2 = 3'b001, 
				 STATE_3 = 3'b010,
				 STATE_4 = 3'b011,
				 STATE_5 = 3'b100,
				 STATE_6 = 3'b101,
				 STATE_7 = 3'b110,
				 STATE_8 = 3'b111;
				 
	reg [SIZE-1:0] state;
	reg [SIZE-1:0] next_state;
	
	reg [2:0] counter;
	output reg walk_reg;
	
	initial begin
		counter = 0;
		walk_reg = 0;
	end
	
	always @ (state or walk_reg or sensor)
	begin 
		next_state <= 3'b000;
		case(state)
			STATE_1 : 
				if (sensor == 1'b1 && counter == 3'b110) begin
					next_state <= STATE_3;
				end 
				else if (sensor == 1'b0 && counter == 3'b110) begin
					next_state <= STATE_2;
				end 
				else begin
					next_state <= STATE_1;
				end
			STATE_2 : 
				if (counter == 3'b110) begin
					next_state <= STATE_4;
				end 
				else begin
					next_state <= STATE_2;
				end
			STATE_3 : 
				if (counter == 3'b011) begin
					next_state <= STATE_4;
				end 
				else begin
					next_state <= STATE_3;
				end
			STATE_4 : 
				if (counter == 3'b010 && walk_reg == 1'b1) begin
					next_state <= STATE_6;
				end 
				else if (counter == 3'b010 && walk_reg == 1'b0) begin
					next_state <= STATE_5;
				end
				else begin
					next_state <= STATE_4;
				end
			STATE_5 : 
				if (sensor == 1'b1 && counter >= 3'b110) begin
					next_state <= STATE_8;
				end
				else if (sensor == 1'b0 && counter >= 3'b110) begin
					next_state <= STATE_7;
				end
				else begin
					next_state <= STATE_5;
				end
			STATE_6 : 
				if (counter == 3'b011) begin
						next_state <= STATE_5;
				end 
				else begin
						next_state <= STATE_6;
				end
			STATE_7 : 
				if (counter == 3'b010) begin
						next_state <= STATE_1;
				end 
				else begin
						next_state <= STATE_7;
				end
			STATE_8 : 
				if (counter == 3'b011) begin
						next_state <= STATE_7;
				end 
				else begin
						next_state <= STATE_8;
				end
			default : next_state <= STATE_1;
		endcase
	end
	
	
	always @ (posedge clock)
	begin 
		if (reset == 1'b1) begin
			state = STATE_1;
			counter = 0;
		end 
		else begin
			if (state != next_state)
			begin
				counter = 0;
				state = next_state;
			end
			counter = counter + 1;
		end
	end
	
	always @ (posedge master_clock)
	begin
		if (reset == 1'b1) begin
			walk_reg <= 0;
		end 
		else begin
			if (walk == 1'b1) begin
				walk_reg <= 1'b1;
			end
			if (state == STATE_6 && next_state == STATE_5) begin
				walk_reg <= 1'b0;
			end
			
		end
	end
	
	
	always @ (posedge clock)
	begin : OUTPUT_LOGIC
		if (reset == 1'b1) begin
			main_r <= 1'b0;
			main_y <= 1'b0;
			main_g <= 1'b0;
			side_r <= 1'b0;
			side_y <= 1'b0;
			side_g <= 1'b0;
		end
		else begin
			case(state)
				 STATE_1 : 
					 begin
						main_r <= 1'b0;
						main_y <= 1'b0;
						main_g <= 1'b1;
						side_r <= 1'b1;
						side_y <= 1'b0;
						side_g <= 1'b0;
					 end
				 STATE_2 : 
					 begin
						main_r <= 1'b0;
						main_y <= 1'b0;
						main_g <= 1'b1;
						side_r <= 1'b1;
						side_y <= 1'b0;
						side_g <= 1'b0;
					 end
				 STATE_3 : 
					 begin
						main_r <= 1'b0;
						main_y <= 1'b0;
						main_g <= 1'b1;
						side_r <= 1'b1;
						side_y <= 1'b0;
						side_g <= 1'b0;
					 end
				 STATE_4 : 
					 begin
						main_r <= 1'b0;
						main_y <= 1'b1;
						main_g <= 1'b0;
						side_r <= 1'b1;
						side_y <= 1'b0;
						side_g <= 1'b0;
					 end
				 STATE_5 : 
					 begin
						main_r <= 1'b1;
						main_y <= 1'b0;
						main_g <= 1'b0;
						side_r <= 1'b0;
						side_y <= 1'b0;
						side_g <= 1'b1;
					 end
				 STATE_6 : 
					 begin
						main_r <= 1'b1;
						main_y <= 1'b0;
						main_g <= 1'b0;
						side_r <= 1'b1;
						side_y <= 1'b0;
						side_g <= 1'b0;
					 end
				 STATE_7 : 
					 begin
						main_r <= 1'b1;
						main_y <= 1'b0;
						main_g <= 1'b0;
						side_r <= 1'b0;
						side_y <= 1'b1;
						side_g <= 1'b0;
					 end
				 STATE_8 : 
					 begin
						main_r <= 1'b1;
						main_y <= 1'b0;
						main_g <= 1'b0;
						side_r <= 1'b0;
						side_y <= 1'b0;
						side_g <= 1'b1;
					 end
				 default : 
				 begin
						main_r <= 1'b0;
						main_y <= 1'b0;
						main_g <= 1'b0;
						side_r <= 1'b0;
						side_y <= 1'b0;
						side_g <= 1'b0;
				 end
			endcase
		end
	end // End Of Block OUTPUT_LOGIC
endmodule // End of Module arbiter


