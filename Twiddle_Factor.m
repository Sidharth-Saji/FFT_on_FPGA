% FFT length (must be power of 2)
N = 16;

% Twiddle indices used in radix-2 FFT
j = 0:(N/2 - 1);

% Floating-point twiddle factors
W = exp(-1i * 2 * pi * j / N);

% Convert to Q1.15 fixed-point
W_real_q15 = fi(real(W), 1, 16, 15);
W_imag_q15 = fi(imag(W), 1, 16, 15);

% Combine as complex fixed-point (optional)
W_q15 = complex(W_real_q15, W_imag_q15);

% Display
disp('Real part (Q1.15):');
disp(W_real_q15*2^15)

disp('Imag part (Q1.15):');
disp(W_imag_q15*2^15)

% bin_real = bin(W_real_q15);
% bin_imag = bin(W_imag_q15);
% disp(bin_real)
% disp(bin_imag)