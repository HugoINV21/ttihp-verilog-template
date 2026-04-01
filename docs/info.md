# Generador de Fibonacci

## ¿Cómo funciona?
El circuito usa dos registros de 8 bits para almacenar los dos últimos números de la serie. 
En cada flanco de subida del reloj, calcula el siguiente número como la suma de los dos anteriores.
La serie comienza con 0 y 1.

## ¿Cómo probarlo?
Conecta un reloj al pin `clk` y observa la salida en `uo_out`. Cada ciclo de reloj mostrará el siguiente número de Fibonacci.

## Hardware externo
No requiere hardware externo adicional.
