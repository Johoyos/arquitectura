module mux2_1(A,B,selector,Result);
input [31:0] A,B;
input selector;
output [31:0] Result;

assign Result=(selector)?A:B;

endmodule
