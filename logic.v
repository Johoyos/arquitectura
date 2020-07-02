module Logic(A,B,AluOp,Result,zero);
input [31:0] A,B;
input [2:0] AluOp;
output reg [31:0] Result;
output reg zero;
always@(*)
begin
	case(AluOp)
	4'b000:
	begin
		Result=A&B;
		zero = 1'b0 ;
	end
	4'b001:
	begin
		Result=A|B;
		zero = 1'b0 ;
	end
	endcase

end
endmodule
