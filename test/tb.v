// test/tb.v
`default_nettype none

module tb;
    reg  clk;
    reg  rst_n;
    wire [7:0] uo_out;

    // Instancia de tu diseño
    tt_um_HugoINV21_fibonacci uut (
        .ui_in (8'b0),
        .uo_out(uo_out),
        .uio_in(8'b0),
        .uio_out(),
        .uio_oe (),
        .ena   (1'b1),
        .clk   (clk),
        .rst_n (rst_n)
    );

    // Generador de reloj
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Estímulos y monitor
    initial begin
        rst_n = 0;
        #20 rst_n = 1;   // liberar reset después de 20 ns

        $display("Serie de Fibonacci:");
        $monitor("Tiempo=%0t, fib=%d", $time, uo_out);
        #300;
        $finish;
    end
endmodule