module D_FF (
    input wire d, clr, set, clk, load,
    output reg q
);
always @(posedge clk or posedge clr or posedge set or posedge load) begin
    if (clr) begin
        q <= 1'b0;
    end else if (set) begin
        q <= 1'b1;
    end else if (load) begin
        q <= d;
    end else begin
        q <= q; // Retain the current value
    end
end
endmodule

module tribuf(
    input ip, control,
    output op
);
assign op = control ? ip : 1'bz;
endmodule

module Loadreg4bit (
    input wire clk,
    input wire rst,
    input wire set,
    input wire load,
    input wire [3:0] d,
    output wire [3:0] q
);
D_FF dff1(.clk(clk), .d(d[0]), .q(q[0]), .clr(rst), .load(load), .set(set));
D_FF dff2(.clk(clk), .d(d[1]), .q(q[1]), .clr(rst), .load(load), .set(set));
D_FF dff3(.clk(clk), .d(d[2]), .q(q[2]), .clr(rst), .load(load), .set(set));
D_FF dff4(.clk(clk), .d(d[3]), .q(q[3]), .clr(rst), .load(load), .set(set));
endmodule

module cu(
    input start, a, b, clk, rst,
    output wire [4:0] T
);
wire [4:0] d;

// One-hot encoding
assign d[0] = ~start & (T[0] | T[2]);
assign d[1] = (start & T[0]) | (~a & ~b & T[1]);
assign d[2] = (~a & b & T[1]) | (start & T[2]) | (~b & T[3]) | T[4];
assign d[3] = a & T[1];
assign d[4] = b & T[3];

D_FF dff1(.clk(clk), .d(d[0]), .q(T[0]), .clr(1'b0), .load(1'b1), .set(rst));
D_FF dff2(.clk(clk), .d(d[1]), .q(T[1]), .clr(rst), .load(1'b1), .set(1'b0));
D_FF dff3(.clk(clk), .d(d[2]), .q(T[2]), .clr(rst), .load(1'b1), .set(1'b0));
D_FF dff4(.clk(clk), .d(d[3]), .q(T[3]), .clr(rst), .load(1'b1), .set(1'b0));
D_FF dff5(.clk(clk), .d(d[4]), .q(T[4]), .clr(rst), .load(1'b1), .set(1'b0));
endmodule

module du(
    input clk, rst,
    input wire [3:0] x,
    input wire [4:0] T,
    output wire [3:0] y
);
wire [3:0] A;
wire load;

// Input expressions of register A
assign A[3] = (x[3] & T[1]) | (T[3] | T[4]) & y[0];
assign A[2] = (x[2] & T[1]) | (T[3] | T[4]) & y[3];
assign A[1] = (x[1] & T[1]) | (T[3] | T[4]) & y[2];
assign A[0] = (x[0] & T[1]) | (T[3] | T[4]) & y[1];

assign load = (T[1] | T[3] | T[4]);

Loadreg4bit regA (
    .clk(clk),
    .rst(rst),
    .set(1'b0),
    .d(A),
    .load(load),
    .q(y)
);
endmodule

module systemspec (
    input start, a, b, rst, clk,
    input wire [3:0] x,
    output wire [3:0] z,
    output wire ready
);
wire [4:0] T;
wire [3:0] y;
wire negclk;

assign negclk = ~clk;

cu controlunit(
    .start(start), .a(a), .b(b), .clk(clk), .rst(rst),
    .T(T)
);

du dataunit(
    .clk(negclk), .rst(rst),
    .x(x), .T(T), .y(y)
);

tribuf buf1(.ip(y[3]), .control(T[2]), .op(z[3]));
tribuf buf2(.ip(y[2]), .control(T[2]), .op(z[2]));
tribuf buf3(.ip(y[1]), .control(T[2]), .op(z[1]));
tribuf buf4(.ip(y[0]), .control(T[2]), .op(z[0]));

assign  ready = T[2];
endmodule