clear all

% fetch sunspot data
load sunspot.dat

% max order to calculate MDL, AIC and Loss function for
order = 30;

% store sunspot time series in variable s_data
s_data(:, 1) = sunspot(:, 2);

% normalise data
% zero mean unity variance
s_data(:, 2) = zscore(s_data(:, 1));

% length of time series
N = length(s_data(:, 1));

% initialise variable to hold estimated coefficients
coefs = zeros(order, order+1);

% intialise variable to hold estimated noise variance
e = zeros(order, 1);

% initialise variable to hold minimum description length (MLD)
MDL = zeros(order, 1);

% initialise variable to hold Akaike information criterion (AIC)
AIC = zeros(order, 1);

% for loop to run through all orders
for i = 1:order
    
    % use aryule function to obtain
    % AR coefficients
    % estimate of noise variance
    [coefs(i, 1:i+1), e(i, 1)] = aryule(s_data(:, 2), i);
    
    % use estimated noise variance to calculate MDL
    % MDL = log(E) + i*log(N)/N
    % where i is the number of estimated parameters (model order)
    % where N is the number of estimated data points
    MDL(i, 1) = log(e(i, 1)) + i * log(N) / N;
    
    % use estimated noise variance to calculate AIC
    % AIC = log(E) + 2*i/N
    % where i is the number of estimated parameters (model order)
    % where N is the number of estimated data points
    AIC(i, 1) = log(e(i,1)) + 2 * i / N;    
    
end

% generate x axis
x = linspace(1, order, order);

% set Line Width
line_width = 2;

% plot values
hold on;
plot(x, MDL, 'LineWidth', line_width);
plot(x, AIC, 'LineWidth', line_width); 
plot(x, log(e), 'LineWidth', line_width); 
hold off;

% graphing settings
title('\fontsize{30}Model Order Selection Criteria');
xlabel('\fontsize{24}Model Order')
ylabel('\fontsize{24}Magnitude')
legend( '\fontsize{20}Minimum Description Length (MDL)',...
        '\fontsize{20}Akaike Information Criterion (AIC)',...
        '\fontsize{20}Loss Function');

grid on 
grid minor

a = get(gca, 'XTickLabel');
set(gca,'XTickLabel', a, 'fontsize', 24);

