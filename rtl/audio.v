//-------------------------------------------------------------------------------------------------
module audio
//-------------------------------------------------------------------------------------------------
(
	input  wire      speaker,
	input  wire      mic,
	input  wire      ear,

	input  wire[7:0] spd,

	input  wire[7:0] a1,
	input  wire[7:0] b1,
	input  wire[7:0] c1,
	input  wire[7:0] a2,
	input  wire[7:0] b2,
	input  wire[7:0] c2,

	input  wire[7:0] saaL,
	input  wire[7:0] saaR,

	output wire[9:0] laudio,
	output wire[9:0] raudio
);
//-------------------------------------------------------------------------------------------------

reg[7:0] ula;
always @(*) case({ speaker, ear, mic })
	0: ula <= 8'h00;
	1: ula <= 8'h24;
	2: ula <= 8'h40;
	3: ula <= 8'h64;
	4: ula <= 8'hB8;
	5: ula <= 8'hC0;
	6: ula <= 8'hF8;
	7: ula <= 8'hFF;
endcase

//-------------------------------------------------------------------------------------------------

assign laudio = { 2'b00, ula } + { spd, 2'b00 } + { 2'b00, a1 } + { 2'b00, b1 } + { 2'b00, a2 } + { 2'b00, b2 } + { saaL, 2'b00 };
assign raudio = { 2'b00, ula } + { spd, 2'b00 } + { 2'b00, c1 } + { 2'b00, b1 } + { 2'b00, c2 } + { 2'b00, b2 } + { saaR, 2'b00 };

//-------------------------------------------------------------------------------------------------
endmodule
//-------------------------------------------------------------------------------------------------
