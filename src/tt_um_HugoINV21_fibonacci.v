// tt_um_HugoINV21_fibonacci.v
module tt_um_HugoINV21_fibonacci (
    input  wire [7:0] ui_in,    // No usamos
    output wire [7:0] uo_out,   // Salida Fibonacci
    input  wire [7:0] uio_in,   // No usamos
    output wire [7:0] uio_out,  // No usamos -> a 0
    output wire [7:0] uio_oe,   // No usamos -> a 0
    input  wire       ena,      // Habilitador (siempre 1, no lo usamos)
    input  wire       clk,      // Reloj
    input  wire       rst_n     // Reset activo bajo
);

// Registros internos
reg [7:0] fib_interno;  // Número actual de Fibonacci
reg [7:0] prev;         // Número anterior

// Lógica secuencial con reset asíncrono (activo bajo)
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin               // Reset: inicializa los registros
        prev <= 8'd1;
        fib_interno <= 8'd0;
    end else begin                  // Funcionamiento normal
        prev <= fib_interno;
        fib_interno <= prev + fib_interno;
    end
end

// Conectar la salida
assign uo_out = fib_interno;

// Pines bidireccionales no usados: los ponemos en modo entrada (uio_oe=0) y salida a 0
assign uio_out = 8'b0;
assign uio_oe  = 8'b0;

// Evitar warnings de pines no usados: conectamos todas las entradas no usadas a un wire dummy
wire _unused = &{ena, rst_n, ui_in, uio_in, 1'b0};

endmodule