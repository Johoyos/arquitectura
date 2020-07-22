module Logic(A,B,AluOp,Result,zero);
input [31:0] A,B;
input [2:0] AluOp;
output reg [31:0] Result;
output reg zero;
always@(*)
begin
	case(AluOp)
	4'b100:
	begin
		Result=A&B;
		zero = 1'b0 ;
	end
	4'b101:
	begin
		Result=A|B;
		zero = 1'b0 ;
	end
	4'b110:
	begin
		Result= 32'bxxxx; //beq
		zero = (A==B)?1'b1:1'b0;
	end
	4'b111:
	begin
		Result= 32'bxxxx; //bneq
		zero = (A==B)?1'b0:1'b1;
	end

	endcase
end
endmodule
