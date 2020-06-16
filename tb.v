`timescale 1ns / 1ps
`include "ALU.v"
module ALU_tb();
reg [31:0] a,b;
reg [3:0] aluop;
wire [31:0] result;

initial begin
    $monitor("a=%4d,b=%4d,aluop=%4b,result=%4b",a,b,aluop,result);
    $dumpfile("alu.vcd");
    $dumpvars(0,ALU_tb);
    a<=32'd11;b<=32'd3;aluop<=4'b0000;#1
    a<=32'd11;b<=32'd3;aluop<=4'b0010;#1
    a<=32'd11;b<=32'd3;aluop<=4'b1010;#1
    a<=32'd11;b<=32'd3;aluop<=4'b0100;#1
    a<=32'd11;b<=32'd3;aluop<=4'b0101;#1
    a<=32'd11;b<=32'd3;aluop<=4'b0110;#1
    a<=32'd11;b<=32'd3;aluop<=4'b0111;#1
    $finish;
end

alu alu_tb(a,b,aluop,result);


endmodule
