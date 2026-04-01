`default_nettype none

module tt_um_HugoINV21_fibonacci (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);

reg [7:0] a;
reg [7:0] b;
reg [7:0] fib;

assign uo_out = fib;

// No usamos IOs bidireccionales
assign uio_out = 8'b0;
assign uio_oe  = 8'b0;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        a   <= 8'd0;
        b   <= 8'd1;
        fib <= 8'd0;
    end else begin
        a   <= b;
        b   <= a + b;
        fib <= a;
    end
end

endmodule



