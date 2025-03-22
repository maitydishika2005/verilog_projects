`timescale 1ps/1ps
`include "SimpleSystem.v"

module SimpleSystem_tb;
reg clk;
reg rst;
reg start;
reg [3:0] X;
wire ready;
wire [3:0] Z;

SimpleSystem uut(
    .clk(clk),
    .rst(rst),
    .start(start),
    .X(X),
    .ready(ready),
    .Z(Z)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("SimpleSystem.vcd");
    $dumpvars(0,SimpleSystem_tb);
    

    clk = 0;
    rst = 1;
    start = 0;
    X=4'b0101;

    #10;
    rst =0;start=1;

    #50 ;
    start =0;
    #10;
    X= 4'b0110;
    start =1;
    #70
    $display("completed");

    $finish;

end

endmodule