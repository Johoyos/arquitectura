`include "flopr.v"
`include "adder.v"
`include "sl2.v"
`include "mux2.v"
`include "regfile.v"
`include "signext.v"
`include "alu.v"


module datapath();
  //next PC logic
  flopr #(32) pcreg(clk, reset, pcnext, pc);
  adder       pcadd1(pc, 32'b100, pcplus4);
  sl2         immsh(signimm, signimmsh);
  adder       pcadd2(pcplus4, signimmsh, pcbranch);
  mux2 #(32)  pcbrmux(pcplus4, pcbranch, pcsrc,pcnextbr);
  mux2 #(32)  pcmux(pcnextbr, {pcplus4[31:28],instr[25:0], 2'b00,jump}, pcnext);


  //register file logic

  regfile     rf(clk, regwrite, instr[25:21],
                 instr[20:16], writereg,
                 result, srca, writedata);
  mux2 #(5)   wrmux(instr[20:16], instr[15:11],
                    regdst, writereg);
  mux2 #(32)  resmux(aluout, readdata,
                     memtoreg, result);
  signext     se(instr[15:0], signimm);

  // ALU logic
  mux2 #(32)  srcbmux(writedata, signimm, alusrc,
                      srcb);
  alu         alu(.a(srca), .b(srcb), .f(alucontrol),
                  .y(aluout), .zero(zero));


  //y el flopenr?
endmodule