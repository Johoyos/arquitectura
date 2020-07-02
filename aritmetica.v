module arith(A,B,AluOp,Result,zero);
input [31:0] A,B;
input [2:0] AluOp;
output reg [31:0] Result;
output reg zero;
always@(*)
begin
	case(AluOp)
	4'b010:
	begin
		Result=A+B;
		zero = 1'b0 ;
	end
	4'b110:
	begin
		Result=A-B;
		zero = 1'b0 ;
	end
	4'b111:
	begin
		if (B<A) begin
			Result=32'd1;
		end
		else begin
			Result=32'd0;
		end
		zero = 1'b0 ;
	end
	endcase
end

endmodule
