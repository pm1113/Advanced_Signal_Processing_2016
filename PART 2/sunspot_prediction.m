clear all

% fetch sunspot data
load sunspot.dat

% define prediction horizon
K = 10;

% models used to predict
models = [1 2 10];

% store sunspot time series in variable s_data
s_data(:, 1) = sunspot(:, 2);

% normalise data
% zero mean unity variance
s_data(:, 2) = zscore(s_data(:, 1));

% length of time series
N = length(s_data(:, 1));

% initialise maxtrix to hold predictions
predictions = zeros(N, length(models));

% initialise cell to hold strings for legend
legend_str = cell(1, 1+length(models));
legend_str{1, 1} = char('Empirical Data');

for i = 1: length(models)
    % use ar function to generate ar idpoly model 
    % needed for predict function
    m = ar(s_data(:, 2), models(i), 'yw');

    % make a K-step prediction
    predictions(:, i) = predict(m, s_data(:, 2), K);
    
    % create string for legend
    legend_str{1, i+1} = char(sprintf('AR(%d)', models(i))); 
end

% generate x axis
x = linspace(1, N, N);


% plot values
hold on
plot(x, s_data(:, 2));
plot(x, predictions);
hold off;

% graphing setting
str = sprintf('Prediction Horizon = %d', K);
title(str, 'FontSize', 40);
xlabel('\fontsize{35}Sample Number');
ylabel('\fontsize{35}Magnitude');
legend(legend_str, 'FontSize', 30);

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);

