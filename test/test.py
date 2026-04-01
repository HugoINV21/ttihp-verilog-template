import cocotb
from cocotb.triggers import Timer, RisingEdge
from cocotb.clock import Clock

@cocotb.test()
async def test_project(dut):
    # Generar reloj de 10 ns (100 MHz)
    clock = Clock(dut.clk, 10, units="ns")
    cocotb.start_soon(clock.start())

    # Reset: poner rst_n = 0, esperar, luego = 1
    dut.rst_n.value = 0
    await Timer(20, units="ns")
    dut.rst_n.value = 1
    await Timer(20, units="ns")

    # Verificar valor inicial después del reset (antes del primer flanco)
    initial = dut.uo_out.value.integer
    dut._log.info(f"Valor inicial: {initial}")
    assert initial == 0, f"El valor inicial debería ser 0, se obtuvo {initial}"

    # Secuencia esperada después del primer flanco de reloj
    expected = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233]

    for i, exp in enumerate(expected):
        await RisingEdge(dut.clk)
        actual = dut.uo_out.value.integer
        dut._log.info(f"Ciclo {i+1}: esperado {exp}, obtenido {actual}")
        assert actual == exp, f"En ciclo {i+1}, se esperaba {exp} pero se obtuvo {actual}"