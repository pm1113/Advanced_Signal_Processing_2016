clear all

% loading RRI data
load Anand_RRI

% scaling factor
alpha = 1.0;

% size of averaging block
avg_block = 20;

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

% average the data to obtain a smoother estimate
heart_rate_avg = zeros(1, floor(N/avg_block));


for i=1:N/avg_block  
    % perform block averaging
    heart_rate_avg(i) = mean(heart_rate((i-1)* avg_block+1:i*avg_block));   
end

% remove maximum values to obtain a smooth graph
heart_rate_avg = heart_rate_avg( heart_rate_avg~=max(heart_rate_avg));
heart_rate_avg = heart_rate_avg( heart_rate_avg~=max(heart_rate_avg));
heart_rate_avg = heart_rate_avg( heart_rate_avg~=min(heart_rate_avg));

% scale the heart rate
heart_rate_avg = heart_rate_avg * alpha;

% compute histogram 
[a, b]= hist(heart_rate_avg, bins);

% normalise by number of samples
a=a/trapz(b, a);

% plot values
bar(b, a);

% graphing settings
str = sprintf('Probability Density Estimate of Heart Rate: Averaged, \alpha = %d', alpha);
title(str, 'FontSize', 40); 
ylabel('\fontsize{35}Probability'); 
xlabel('\fontsize{35}Sample Value');

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24); 
