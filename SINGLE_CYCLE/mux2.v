<<<<<<< HEAD
module mux2_1(A,B,selector,Result);
    input [31:0] A,B;
    input selector;
    output [31:0] Result;

    assign Result=(selector)?A:B;
=======
module mux2(A,B,selector,result);
input [31:0] A,B;
input selector;
output [31:0] result;

assign result=(selector)?A:B;
>>>>>>> 15c2230d42dbc16202d3413857e751c15df309a9

endmodule
