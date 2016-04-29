clear all

% set default seed
rng default 

% number of ensembles
M = 1000;

% number of samples in each time series
N = 100;

% generate time series of random processes
% each realisation generated as a row vector
p_1 = rp1(M, N);
p_2 = rp2(M, N);
p_3 = rp2(M, N);

% compute means
% mean function will return row vector
% row vector contains mean of each column in matrix
mean_1 = mean(p_1);
mean_2 = mean(p_2);
mean_3 = mean(p_3);

% generate x axis
x = linspace(0, N-1, N);

% plot values
hold on
plot(x, mean_1);
plot(x, mean_2);
plot(x, mean_3);
hold off

% graphing settings
str = sprintf('Ensemble Mean vs Sample Number (%d Member Ensemble)', M);
title(str, 'FontSize', 40);
xlabel('\fontsize{35}Sample Number');
ylabel('\fontsize{35}Ensemble Mean');
legend('\fontsize{30}RP1',...
       '\fontsize{30}RP2',...
       '\fontsize{30}RP3');
   
grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);
