clear all

% fetch sunspot data
load sunspot.dat

% models to test
models = [1 2 10];

% store sunspot time series in variable s_data
s_data(:, 1) = sunspot(:, 2);

% normalise data 
% zero mean unity variance
s_data(:, 2) = zscore(s_data(:, 1));

% length of time series
N = length(s_data(:, 1));

% initialise maxtrix to hold
% model based estimates
h_models = zeros(N, length(models));

% initialise cell to hold strings for legend
legend_str = cell(1, 1+length(models));
legend_str{1, 1} = char('Periodogram Method');

for i = 1:length(models)
    % use aryule function to determine coefficients as well as estimated error
    [a, noise_var] = aryule(s_data(:, 2), models(i));

    % generate model based estimate of PSD
    [h(:, i), w] = freqz(noise_var^(1/2), a, length(s_data(:, 2))/2);
    
    % create string for legend
    legend_str{1, i+1} = char(sprintf('Model - Based Method: Order %d', models(i))); 
    
end

% estimate PSD using periodogram
Ps = pgm(s_data(:, 2));

% generate normalised frequencies
f = linspace(0, 0.5, N/2+1);

% define colors
colors = [0.8500 0.3250 0.0980]; 
colors = [colors; 0 0.4470 0.7410]; 
colors = [colors; 0.9290 0.6940 0.1250]; 
colors = [colors; 0.4940 0.1840 0.5560]; 
colors = [colors; 0.4660 0.6740 0.1880];
   
% % set linewidth
linewidth = 1;


hold on
plot(f, Ps(1:N/2+1), 'Color', colors(1,:));
for i = 1:length(models)
    plot(w/(2*pi), abs(h(:, i)).^2, 'Color', colors(i+1, :), 'LineWidth', linewidth);
end
hold off

% graphing settings
title('\fontsize{40}PSD Estimate of Sunspot Time Series');
xlabel('\fontsize{35}Normalised Frequencies (x 2\pi rad/sample)');
ylabel('\fontsize{35}Magnitude');
legend(legend_str, 'FontSize', 30);

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);

