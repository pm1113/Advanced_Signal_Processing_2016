clear all

% set default seed
rng default

% length of sequence
N = 1000;

% order of moving average filter
order = 4;

% generate random sequence
% drawn from guassian distribution
x = randn(N, 1);

% filter random sequence
% moving average filter is employed
y = filter(ones(1,order), 1, x);


% calculate unbiased estimate of cross-correlation function
cor = xcorr(x, y, 'unbiased');

% generate x axis
x = linspace(-N+1,N-1,2*N-1);

% stem ccf
stem(x, cor);

% graphing settings
str = sprintf('Cross-correlation of Input and Output of MA(%d) Process', order);
title(str, 'FontSize', 40);
xlabel('\fontsize{35}\tau');
ylabel('\fontsize{35}R_x(\tau)');

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);
