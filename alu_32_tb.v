`timescale 1ns / 1ps

module tb_alu_32;
    //Inputs
    reg [31:0] a;
    reg [31:0] b;
    reg [3:0] operation;

    //Outputs
    wire [31:0]Result;

    alu_32 test (a, b, operation, Result);

    initial begin
        a = 32'b01; b = 32'b011; operation = 4'b0101;
        #4 $finish;
    end

    initial begin
		$dumpfile ( "alu_32.vcd" );
		$dumpvars;
	end
endmodule
