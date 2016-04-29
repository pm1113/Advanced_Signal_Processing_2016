clear all

% set default seed
rng default

% length of sequence
N = 1064;

% generate random samples
x = randn(1, N);

% filter coefficients
a = [1 0.9];
b = 1;

% filter random sequence
y = filter(b, a, x);

% discard first 40 samples to remove transient effects
y = y(41:end);

% calculate cross correlation
% only perform calculation for tau = -1,
% tau = 0 and tau = 1
y_acf = xcorr(y, 1, 'unbiased');

% estimate parameter a1
a1 = - y_acf(3)/y_acf(2);

% estimate input noise power
noise_var = y_acf(2) + a1 * y_acf(3);

% generate model based estimate of PSD
[h, w] = freqz(noise_var^(1/2), [1 a1], 512);

% obtain ideal PSD of filtered signal
[ideal_h, ideal_w] = freqz(b, a, 512);

% estimate PSD using periodogram
Pn = pgm(y);

% set line width
linewidth = 2;

% plot values
hold on
plot(ideal_w/(2*pi), abs(ideal_h).^2, 'LineWidth', linewidth);
plot(w/(2*pi), Pn(1:(N-40)/2));
plot(w/(2*pi), abs(h).^2, 'LineWidth', linewidth);
hold off

title('\fontsize{40}Comparison of Model Based PSD Estimate');
xlabel('\fontsize{35}Normalised Frequencies (x 2\pi rad/sample)')
ylabel('\fontsize{35}Magnitude')
legend('\fontsize{30}Exact PSD',...
       '\fontsize{30}Estimated PSD: Periodogram Method',...
       '\fontsize{30}Estimated PSD: Model - Based Method');
 
grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);

