module maindec(input  [5:0] op,
               output memtoreg, memwrite,
               output branch, alusrc,
               output regdst, regwrite,
               output jump,
               output [2:0] aluop);

  output reg [9:0] controls;

  assign  {regwrite, regdst, alusrc,branch, memwrite,memtoreg, jump, aluop} = controls;

  always@(*)
  begin
    case(op)
      6'b000000: controls <= 10'b1100000100; //Rtype
      6'b100011: controls <= 10'b1010010000; //LW
      6'b101011: controls <= 10'b0010100000; //SW
      6'b000100: controls <= 10'b0001000110; //BEQ
      6'b000101: controls <= 10'b0001000111; //BNEQ
      6'b001000: controls <= 10'b1010000000; //ADDI
      6'b001101: controls <= 10'b1010000001; //ORI
      6'b000010: controls <= 10'b0000001001; //J
      default:   controls <= 10'bxxxxxxxxxx; //???
    endcase
  end
endmodule
