module mux2#(parameter WIDTH=32)(A,B,selector,result);
input [WIDTH-1:0] A,B;
input selector;
output [WIDTH-1:0] result;

assign result=(selector)?A:B;

endmodule
