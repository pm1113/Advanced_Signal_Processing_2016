clear all

% set default seed
rng default

% length of sequence
N = 1000;

% column vector of random values
% drawn from uniform distribution
x = rand(N, 1);

% plot time series
plot(x);

% graphing settings
title('\fontsize{40}plot(X)');
xlabel('\fontsize{35}Sample Number');
ylabel('\fontsize{35}x[N]');

grid on
grid minor

axis([0, N-1, 0, 1]);
a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);