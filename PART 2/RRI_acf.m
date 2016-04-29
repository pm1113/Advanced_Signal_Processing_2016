clear all

% loading RRI data
load Anand_RRI

% trial number
trial = 3;

% store RRI time series in variable data
% select which trial to analyse
h_data(:, 1) = Trial3_RRI;

% normalise data: zero mean unity variance
h_data(:, 2) = zscore(h_data(:, 1));

% length of time series
N = length(h_data(:, 1));

% autocorrelation of sunspot time series
corr = xcorr(h_data(:, 1), 'unbiased');

% scale corr to have a value of 1 at tau = 0
corr(:, 1) = corr(:, 1)/corr(N, 1);

% autocorrelation of normalisaed sunspot time series
corr(:, 2) = xcorr(h_data(:, 2), 'unbiased');

% scale n_corr to have a value of 1 at tau = 0
corr(:, 2) = corr(:, 2)/corr(N, 2);

% generate x axis
x = linspace(-N+1, N-1, 2*N-1);

% stem acf
stem(x, corr(:, 2));

% graphing settings
str = sprintf('Autocorrelation Function for RRI: Trial %d', trial);
title(str, 'FontSize', 40);
xlabel('\fontsize{35}\tau');
ylabel('\fontsize{35}R_{x}(\tau)');

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);

