`include "logic.v"
`include "aritmetica.v"
`include "mux2.v"
module alu(A,B,AluOp,Result);
    input [31:0] A,B;
    input [3:0] AluOp;
    output [31:0] Result;
    wire [31:0] logic_result,arith_result;

    Logic Logic(A,B,AluOp,logic_result);
    arith arith(A,B,AluOp,arith_result);
    mux2_1 mux(logic_result,arith_result,AluOp[2],Result);
endmodule
