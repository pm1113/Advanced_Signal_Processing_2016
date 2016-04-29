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

% obtain ideal PSD of filtered signal
[h, w] = freqz(b, a, 512);

% estimate PSD using periodogram
Pn = pgm(y);

% set linewidth
linewidth = 2;

% plot values
hold on
plot(w/(2*pi), abs(h).^2, 'LineWidth', linewidth);
plot(w/(2*pi), Pn(1:(N-40)/2));
hold off

% graphing settings
title('\fontsize{40}PSD of Signal produced using AR(1) Process');
xlabel('\fontsize{35}Normalised Frequencies (x 2\pi rad/sample)')
ylabel('\fontsize{35}Magnitude')
legend('\fontsize{30}Exact PSD',...
       '\fontsize{30}Estimated PSD: Periodogram Method');
 
grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);
