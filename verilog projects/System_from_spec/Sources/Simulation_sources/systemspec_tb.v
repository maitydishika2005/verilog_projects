`timescale 1ps/1ps
//`include "systemspec.v"

module systemspec_tb;

reg clk;
reg rst;
reg start;
reg a;
reg b;
reg [3:0] x;
wire ready;
wire [3:0] z;

systemspec uut(
    .clk(clk),
    .rst(rst),
    .start(start),
    .x(x),
    .ready(ready),
    .z(z),
    .a(a),
    .b(b)
);

always #5 clk = ~clk;

initial begin
   // $dumpfile("systemspec.vcd");
    //$dumpvars(0,systemspec_tb);
    //$dumpvars(1, uut);

    clk=0;
    rst=1;
    start=0;
    a=0;b=0;
    x=4'b0000;
    
    #10;
    a=0;b=1;
    rst=0;start=1;x=4'b0110;
    #50;
    start=0;
    a=1;b=0;
    #7;start=1;x=4'b0101;
    #50;
    a=1;b=1;start=0;
    #10;
    start=1;x=4'b1011;
    #60;
    rst=1;
    #10;

    $display("finished");
    $finish;
end
endmodule