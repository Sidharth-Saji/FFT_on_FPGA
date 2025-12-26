# FFT_on_FPGA
Developing a 128 point FFT on Verilog for ECG signal processing


Files Required for Parametrization
- W_LUT
- design.sv - main file with genvars
- complexAdd
- complexMul
- butterfly


Doubts I have 
- each butterfly uses different twiddle factors, how to give that ?? just a ROM will be enough ?? - instantiate a big rom in parametrized_fft (with externally stored twiddle factors), give w also to butterfly, to operate it properly.... DONE
- Now place genvar properly to generate butterfly for fft 