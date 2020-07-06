module alu_32(a, b, operation, Result);
    // Inputs
    input [31:0] a;
    input [31:0] b;
    input [3:0] operation;
    output reg [31:0] Result;

    always@(a or b or operation)
        begin
            case (operation)
                4'b0000:  Result = a + b;   // ADD
                4'b0101:  Result = b - a;   // OR
                4'b0110:  Result = a - b;   // Addition
                4'b1000:  Result = a & b;   // AND
                4'b1001:  Result = b | a;   // OR
                4'b1100:  Result = a ^ b;   // XOR
                4'b1101:  Result = b;       // B
                4'b1010:  Result = a & ~b;   // AND
                4'b1011:  Result = ~b | a;   // OR
                4'b1110:  Result = a ^ ~b;   // XOR
                4'b1111:  Result = ~b;       // NOT B
            endcase
        end
endmodule
