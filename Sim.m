% FFT size
N = 16;

% Floating input
Fs = 40;
T = 1/Fs;
L = 16;
t = (0:L-1)*T;

x = 3*sin(2*pi*2*t) + 2*sin(2*pi*4*t);

% x = exp(1j*2*pi*(0:N-1)/N);

% Convert to Q1.15
x_real = round(real(x) * 2^15);
x_imag = round(imag(x) * 2^15);

X_float = fft(x,16);

% Run fixed-point FFT
[Xr, Xi] = fft_dit_q15(x_real, x_imag);

% Convert back to float
X_fixed = (Xr + 1j*Xi) / 2^15;


% Compare
disp([X_fixed.' X_float.'])



function [X_real, X_imag] = fft_dit_q15(x_real, x_imag)
% Fixed-point radix-2 DIT FFT using Q1.15 arithmetic

    % -----------------------------
    % Parameters
    % -----------------------------
    N = length(x_real);
    stages = log2(N);

    WL = 16;
    FL = 15;
    MAX = 2^(WL-1) - 1;
    MIN = -2^(WL-1);

    % -----------------------------
    % Bit reversal
    % -----------------------------
    br = bitrevorder(1:N);
    xr = x_real(br);
    xi = x_imag(br);

    % -----------------------------
    % FFT computation
    % -----------------------------
    for s = 1:stages
        m = 2^s;
        mh = m/2;

        for k = 0:mh-1
            % Twiddle factor
            angle = -2*pi*k/m;
            Wr = round(cos(angle) * 2^FL);
            Wi = round(sin(angle) * 2^FL);

            % Saturate twiddle
            Wr = min(max(Wr, MIN), MAX);
            Wi = min(max(Wi, MIN), MAX);

            for n = k+1:m:N
                i1 = n;
                i2 = n + mh;

                % Butterfly inputs
                ar = xr(i2);
                ai = xi(i2);

                % Complex multiply (Q1.15 x Q1.15 -> Q2.30)
                tr = ar*Wr - ai*Wi;
                ti = ar*Wi + ai*Wr;

                % Scale back to Q1.15
                tr = round(tr / 2^FL);
                ti = round(ti / 2^FL);

                % Saturate
                tr = min(max(tr, MIN), MAX);
                ti = min(max(ti, MIN), MAX);

                % Butterfly
                xr(i2) = xr(i1) - tr;
                xi(i2) = xi(i1) - ti;

                xr(i1) = xr(i1) + tr;
                xi(i1) = xi(i1) + ti;
            end
        end
    end

    X_real = xr;
    X_imag = xi;
end
