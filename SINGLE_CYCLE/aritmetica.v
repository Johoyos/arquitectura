module arith(A,B,AluOp,Result);
input [31:0] A,B; 
input [3:0] AluOp;
output reg [31:0] Result;

always@(*)
begin
	case(AluOp)
	4'b0000: 
		Result=A+B;
	4'b0010:
		Result=A-B;
	4'b1010:
		if (B<A) begin
			Result=32'd1;
		end
		else begin
			Result=32'd0;
		end
	endcase
end

endmodule
