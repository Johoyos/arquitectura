module aludec(input  [5:0] funct,
              input  [2:0] aluop,
              output reg [2:0] alucontrol);

always@(*)
begin

    case(aluop)
      3'b000: alucontrol <= 3'b010;  // add
      3'b001: alucontrol <= 3'b101;  // ori
      3'b110: alucontrol <= 3'b110;  // beq
      3'b111: alucontrol <= 3'b111;  // bne
      3'b100: case(funct)            // RTYPE
          6'b100000: alucontrol <= 3'b010; // ADD
          6'b100010: alucontrol <= 3'b011; // SUB
          6'b100100: alucontrol <= 3'b100; // AND
          6'b100101: alucontrol <= 3'b101; // OR
          6'b101010: alucontrol <= 3'b001; // SLT
          default:   alucontrol <= 3'bxxx; // ???
        endcase
    endcase
end
endmodule
