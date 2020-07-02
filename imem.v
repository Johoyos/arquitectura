module imem(input  [5:0]  a,
            output [31:0] rd);

  reg [31:0] RAM[0:17]; //haciendo la matriz de 32 bits x 18 lineas

  initial
    begin
      $readmemh("memfile.dat",RAM); // initialize memory
    end

  assign rd = RAM[a]; // word aligned
endmodule
