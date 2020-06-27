module mux2(A,B,selector,result);
input [31:0] A,B;
input selector;
output [31:0] result;

assign result=(selector)?A:B;

endmodule
