module dmem(input  clk, we,
            input  [31:0] a, wd,
            output [31:0] rd);

  reg [7:0] RAM[0:255];   // no es [0:71] [31:0] [63:0]       aaaaaaaaaa aaaaaaaaaaaaa aaaaaaaaaaa aaaaaaaaaa

  assign rd = {RAM[a],RAM[a+1],RAM[a+2],RAM[a+3]}; // word aligned

  always @(posedge clk)
    if (we)
      {RAM[a],RAM[a+1],RAM[a+2],RAM[a+3]} <= wd;
endmodule
