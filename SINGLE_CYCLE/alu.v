`include "logic.v"
`include "aritmetica.v"
module alu(A,B,AluOp,Result,zero);
input [31:0] A,B;
input [2:0] AluOp;
output [31:0] Result;
wire [31:0] logic_result,arith_result;
output zero;
wire zeroL , zeroA ;
Logic Logic(A,B,AluOp,logic_result,zeroL);
arith arith(A,B,AluOp,arith_result,zeroA);

assign Result =(AluOp[2])? logic_result:arith_result;
assign zero = (AluOp[2])? zeroL:zeroA;

endmodule
