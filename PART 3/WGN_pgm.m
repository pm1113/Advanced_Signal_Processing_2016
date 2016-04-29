clear all

% set default seed
rng default

% length of time sequence
N = 512;

% generate random sequence
% drawn from gaussian distribution
x = randn(1, N);

% estimate PSD using periodogram
Px = pgm(x);

% generate normalised frequencies
f = linspace(0, 0.5, N/2+1);

% stem PSD
stem(f, Px(1:N/2+1));

% graphing settings
str = sprintf('Periogogram: WGN Sequence, N = %d', N);
title(str, 'FontSize', 40);
xlabel('\fontsize{35}Normalised Frequencies (x 2\pi rad/sample)')
ylabel('\fontsize{35}Magnitude')

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);
