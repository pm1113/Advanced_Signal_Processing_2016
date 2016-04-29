clear all

% length of random sequence
N = 512;

% generate random sequence
% drawn from gaussian distribution
x = randn(1, N);

% estimate PSD using periodogram
Px = pgm(x);

% define filter coefficients
a = 1;
b = 0.2 * [1 1 1 1 1];

% filter periodogram to improve the estimate
smooth_Pn = filter(b, a, Px);

% generate normalised frequencies
f = linspace(0, 0.5, N/2+1);

% stem smoothed PSD
stem(f, smooth_Pn(1:N/2+1));

% graphing settings
str = sprintf('Periodogram: Filtered WGN Sequence, N = %d', N);
title(str, 'FontSize', 40);
xlabel('\fontsize{35}Normalised Frequencies (x \pi rad/sample)');
ylabel('\fontsize{35}Magnitude');

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);
