clear all

% set default seed
rng default

% length of sequence
N =  1000;

% number of bins for histogram
bins = 50;

% generate time series as row vector
x = randn(1, N);

% compute histogram
[a,b]= hist(x,bins);

% normalise by number of samples
a = a/trapz(b,a);

% theoretical pdf for comparison
x = linspace(-4, 4, 2^12);
y = normpdf(x, 0, 1);

% colour of theoretical pdf
red = [0.8500 0.3250 0.0980];

% plot estimated pdf and theoretical pdf
hold on
bar(b, a);
plot(x, y, 'Color', red);
hold off

% graphing settings
str = sprintf('N = %d, %d Bins', N, bins);
title(str, 'FontSize', 40); 
xlabel('\fontsize{35}Sample Value');
ylabel('\fontsize{35}Probability'); 
 
grid on
grid minor


a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);
