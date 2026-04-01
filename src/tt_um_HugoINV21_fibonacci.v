module tt_um_HugoINV21_fibonacci (
    input  wire [7:0] ui_in,   // No usamos entradas
    output wire [7:0] uo_out,  // Aquí va nuestra salida Fibonacci
    input  wire [7:0] uio_in,  // No usamos
    output wire [7:0] uio_out, // No usamos
    output wire [7:0] uio_oe,  // No usamos
    input  wire       ena,     // Habilitador (ignoramos, ponemos 1)
    input  wire       clk,     // Reloj principal
    input  wire       rst_n    // Reset activo bajo (opcional)
);

// Nuestro módulo Fibonacci original (sin testbench)
reg [7:0] fib_interno;
reg [7:0] prev;

initial begin
    prev = 8'd1;
    fib_interno = 8'd0;
end

always @(posedge clk) begin
    prev <= fib_interno;
    fib_interno <= prev + fib_interno;
end

// Conectar la salida
assign uo_out = fib_interno;

// Si no usamos reset, lo ignoramos con una directiva para evitar warnings
// (opcional) wire _unused = &{rst_n, ena, ui_in, uio_in};

endmodule
