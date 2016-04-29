clear all

% set default seed
rng default

% define size of sequence
N = 1000;

% generate random sequence
% drawn from gaussian distribution
y = randn(1, N);

% calculate unbiased estimate of autocorrelation function
cor = xcorr(y, 'unbiased');

% generate x axis
x = linspace(-N+1, N-1, 2*N-1);

% stem acf
stem(x, cor);

% graphing settings
title('\fontsize{40}Unbiased Estimate of Autocorrelation Function of White Guassian Noise');
xlabel('\fontsize{35}\tau');
ylabel('\fontsize{35}R_x(\tau)')

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);


