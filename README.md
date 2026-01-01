# FFT_on_FPGA
Developing Parametrized Verion of FFT on Verilog - Depending on Parameter N given in tb, genvar loops will generate FFT architecture for N point Radix 2 DIT - FFT 


Files in Parametrized Version
- testbench.sv - TB
- parametrized_fft.sv - design file
- butterfly.sv - 2-point Buttefly
- ComplexAdd.sv - Complex Addition
- ComplexMul.sv - Complex Multiplication