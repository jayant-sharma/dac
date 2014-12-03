`timescale 100ps / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:58:48 09/30/2013 
// Design Name: 
// Module Name:    dac 
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
module dac #( 
	parameter RES = 8
)( 
	input 					clk,
	input 					rst,
	input 	  [RES-1:0]	dac_in,
	output reg 				dac_out
);
	
wire [RES+1:0] Dadder;
wire [RES+1:0] Sadder;
reg  [RES+1:0] Slatch;

assign Dadder = dac_in + {{2{Slatch[RES+1]}}, 8'h00}; 
assign Sadder = Dadder + Slatch;

initial begin
	Slatch <= 0;
	dac_out <= 1'b0;
end

always@(posedge clk or posedge rst) begin
	if(rst) begin
		Slatch <= 0;
		dac_out <= 1'b0;
	end
	else begin
		Slatch <= Sadder;
		dac_out <= Slatch[RES+1];
	end
end

tb uuttb();

endmodule

/*
reg [RES+1:0] d_adder;
reg [RES+1:0] s_adder;
reg [RES+1:0] s_latch;
reg [RES+1:0] d_casc;
reg [RES-1:0] v_in;
reg [RES-1:0] counter;

always@(s_latch)
	d_casc <= {s_latch[RES+1], s_latch[RES+1]} << RES;
	
always@(v_in or d_casc)
	d_adder <= v_in + d_casc;
	
always@(d_adder or s_latch)
	s_adder <= d_adder + s_latch;
						
always@( posedge clk or posedge rst) begin
	if(rst)begin
		s_latch <= 10'b01_0000_0000;
		dac_out <= 1'b0;
		counter <= 8'b0;
		v_in <= 0;
	end
	else  begin
		v_in <= v_in + 1;
		s_latch <= s_adder;
		dac_out <= s_latch[RES+1];
	end				
end
*/
