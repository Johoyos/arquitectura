module Logic(A,B,AluOp,Result);
input [31:0] A,B;
input [3:0] AluOp;
output reg [31:0] Result;

always@(*)
begin
	case(AluOp)
	4'b0100:
		Result=A&B;
	4'b0101:
		Result=A|B;
	4'b0110:
		Result=A^B;
	4'b0111:
		Result=~(A|B);
	endcase

end
endmodule
