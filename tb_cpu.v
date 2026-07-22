`timescale 1ns/1ps
module tb_cpu;
reg clk, rst;
cpu dut(.clk(clk),.rst(rst));

initial clk = 0;
always #5 clk = ~clk; // 100MHz clock

initial begin
    $monitor("Time=%0t PC=%0d R1=%0d R2=%0d R3=%0d Mem[50]=%0d",
              $time, dut.pc, dut.reg_file[1], dut.reg_file[2], dut.reg_file[3], dut.data_mem[50]);
    rst = 1; 
    #12 rst = 0; 
    #100 $finish;
end
endmodule