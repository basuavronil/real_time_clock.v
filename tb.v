`timescale 1ns/1ps

module tb();
    reg clk, rst;
    wire [3:0] s1, s10, m1, m10, h1, h10;
   //instantiation
    dut Z(
        .clk(clk),
        .rst(rst),
        .s1(s1),
        .s10(s10),
        .m1(m1),
        .m10(m10),
        .h1(h1),
        .h10(h10)
    );
  always #1 clk = ~ clk;
  
    initial begin
        clk = 0;
        rst = 0;
        $monitor("%0t %0d  %0d :  %0d  %0d :  %0d  %0d", $time, h10, h1, m10, m1, s10, s1);
        #10;       
        rst = 1;
        #90000000;
        $finish;
    end

endmodule
