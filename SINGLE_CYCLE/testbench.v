`include "top.v"
module testbench();

  reg clk;
  reg reset;

  wire [31:0] writedata, dataadr;
  wire memwrite;

  // instantiate device to be tested
  top dut(clk, reset, writedata, dataadr, memwrite);

  // initialize test
  initial
    begin
	    $dumpfile("output.vcd");
	    $dumpvars(0,testbench);
	    reset <= 1; # 22; reset <= 0;
	    #300;
	    $finish;
    end

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end

  // check that 7 gets written to address 84
  always@(negedge clk)
    begin
      if(memwrite) begin
        if(dataadr === 84 & writedata === 7) begin
          $display("Simulation succeeded");
          $finish; //estaba en stop, sino el vcd nunca terminaba de salir
        end else if (dataadr !== 80) begin
          $display("Simulation failed");
          $finish;
        end
      end
    end
endmodule
