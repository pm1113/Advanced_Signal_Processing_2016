clear all

% set default seed
rng default 

% number of ensembles
M = 4;

% number of samples in each time series
N = 1000;

% generate time series of random processes
% each realisation generated as a row vector
p_1 = rp1(M, N);
p_2 = rp2(M, N);
p_3 = rp2(M, N);

% compute sample means
% mean function will return row vector
% row vector contains mean of each column in matrix
means(1, :) = mean(p_1');
means(2, :) = mean(p_2');
means(3, :) = mean(p_3');


% generate x axis
x = linspace(1, M, M);

% colors for graph
blue = [0 0.4470 0.7410];
green = [0.9290 0.6940 0.1250];
red = [0.8500 0.3250 0.0980];
colors(1, :) = blue;
colors(2, :) = green; 
colors(3, :) = red;


% graphing settings
for i=1:3
    subplot(3, 1, i);
    
    % plot values
    plot(x, means(i, :), 'Color', colors(i,:));
    str = sprintf('RP%d', i);
    title(str, 'FontSize', 30);
    xlabel('\fontsize{20}Realisation Number');
    ylabel('\fontsize{20}Sample Mean');
    
    grid on
    grid minor
    
    a = get(gca, 'XTickLabel');
    set(gca, 'XTickLabel', a, 'fontsize', 24); 
end

