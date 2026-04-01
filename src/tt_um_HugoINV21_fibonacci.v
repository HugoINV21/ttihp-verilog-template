
module tt_um_HugoINV21_fibonacci (
    input clk,
    output reg [7:0] fib
);

reg [7:0] a = 0, b = 1;

always @(posedge clk) begin
    a <= b;
    b <= a + b;
    fib <= a;
end

endmodule

/* 
 * Do not change Module name 
*/



