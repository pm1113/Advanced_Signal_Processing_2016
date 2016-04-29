clear all

% fetch sunspot data
load sunspot.dat

% length of time series
N = 20;

% store sunspot time series in variable s_data
s_data(:, 1) = sunspot(:, 2);

% normalise data
% zero mean unity variance
s_data(:, 2) = zscore(s_data(:, 1));

% autocorrelation of sunspot time series
corr(:, 1) = xcorr(s_data(1:N, 1), 'unbiased');

% scale corr to have a value of 1 at tau = 0
corr(:, 1) = corr(:, 1)/corr(N, 1);

% autocorrelation of normalisaed sunspot time series
corr(:, 2) = xcorr(s_data(1:N, 2), 'unbiased');

% scale corr to have a value of 1 at tau = 0
corr(:, 2) = corr(:, 2)/corr(N, 2);

% generate x axis
x = linspace(-N + 1, N - 1, 2 * N - 1);

% stem correlations
stem(x,corr);


% graphing settings
str = sprintf('Autocorrelation Function for Sun Spots Time Series, N = %d', N);
title(str, 'FontSize', 40);
xlabel('\fontsize{35}\tau')
ylabel('\fontsize{35}R_{x}(\tau)')
legend('\fontsize{30}Emperical Data',...
       '\fontsize{30}Zero-Mean Data');

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24)
axis([0 N-1 -1.5 1.5])


