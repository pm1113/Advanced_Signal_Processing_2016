clear all

% set default seed
rng default

% number of ensembles
M = 10;

% number of samples in each time series
N = 1000;

% generate matrix of random values
x = randn(M, N);

% compute sample mean and sample standard deviation 
% of each realisation
mean_1 = mean(x');
std_1 = std(x');


% generate theoretical sample mean 
% and theoretical standard deviation
t_mean = zeros(1, M);
t_std = ones(1, M);

% generate x axis
x = linspace(1, M, M);

% plot values
hold on
scatter(x, mean_1); 
plot(x, t_mean);
hold off

% graphing settings
title('\fontsize{40}Sample Mean vs Realisation Number');
xlabel('\fontsize{35}Realisation Number');
ylabel('\fontsize{35}Sample Mean');

legend('\fontsize{30}Sample Mean',...
       '\fontsize{30}Theoretical Mean');

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);




