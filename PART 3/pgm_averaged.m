clear all

% set default seed
rng default

% length of seqeuence
N = 512;

% number of sequence
num_segs = 64;

% generate random sequences
% drawn from gaussian distribtion
x = randn(num_segs, N);

% estimate PSD using periodogram
% pgm operates on column vectors
Px = pgm(x');

% get mean of all 8 segments
Px_avg = mean(Px');

% generate normalised frequencies
f = linspace(0, 0.5, N/2+1);

% stem values
stem(f, Px_avg(1:N/2+1));

% graphing settings
str = sprintf('Averaged Peridogram: %d Segments', num_segs);
title(str, 'FontSize', 40);
xlabel('\fontsize{35}Normalised Frequencies (x 2\pi rad/sample)')
ylabel('\fontsize{35}Magnitude')

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);


