clear all

% loading RRI data
load Anand_RRI

% store RRI time series in variable data
% only work with trial 2
% produced best results for illustrative purposes
h_data = Trial2_RRI;

% define the number of bins
bins = 15;

% obtain heart rate time series
heart_rate = 60./h_data;

% length of heart rate vector
N = length(heart_rate);

% compute histogram 
[a, b] = hist(heart_rate, bins);

% normalise by number of samples
a = a / trapz(b, a);

% plot values
bar(b, a);

% graphing settings
title('\fontsize{40}Probability Density Estimate of Original Heart Rate'); 
ylabel('\fontsize{35}Probability'); 
xlabel('\fontsize{35}Sample Value');

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24); 
