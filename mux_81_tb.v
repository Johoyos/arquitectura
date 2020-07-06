`timescale 1ns/1ns
module mux_81_tb;
	reg [15:0] d0, d1, d2, d3, d4, d5, d6, d7;
	reg [2:0] s;
	wire [15:0] y;

	mux_81 test ( d0, d1, d2, d3, d4, d5, d6, d7, s , y );

	always #3 s = ~s;
	always #1 d0 = ~d0;
	always #2 d1 = ~d1;
	always #3 d2 = ~d2;
	always #4 d3 = ~d3;
	always #5 d4 = ~d4;
	always #6 d5 = ~d5;
	always #7 d6 = ~d6;
	always #8 d7 = ~d7;

	initial begin 
		d0 = 16'b000; d1 = 16'b001; d2 = 16'b010; d3 = 16'b011;
		d4 = 16'b100; d5 = 16'b101; d6 = 16'b110; d7 = 16'b111;
		s = 3'b000;
		#8 s = 3'b010;
		#16 s = 3'b100;
		#24 $finish;
	end

	initial begin 
		$dumpfile ( "mux_81.vcd" );
		$dumpvars;
	end
endmodule
