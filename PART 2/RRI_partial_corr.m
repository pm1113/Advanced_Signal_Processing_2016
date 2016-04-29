clear all

% loading RRI data
load Anand_RRI

% length of partial correlation sequence
par_corr_len = 20;

% amplitude of threshold
a = 0.1;

% trial number
trial = 3;

% store RRI time series in variable data
% select which trial to analyse
h_data(:, 1) = Trial3_RRI;

% normalise data: zero mean unity variance
h_data(:, 2) = zscore(h_data(:, 1));

% define the length of the vector data
N = length(h_data(:, 1));

% initial variable to hold partial correlation value
par_corr = zeros(par_corr_len, 2);

% calculate partial correlations
for i = 1:par_corr_len
    % loop to calculate partial correlation of
    % both empirical and normalised data
    for j = 1:2
        coefs = aryule(h_data(:, j), i);
        % take negative value because aryule returns
        % negated value of coefficients
        par_corr(i, j) = -coefs(i+1);
    end
end

% generate x axis
x = linspace(1, par_corr_len, par_corr_len);

% equations for threshold
y = a*ones(par_corr_len, 1);

% define color of plot
gold = [0.9290 0.6940 0.1250];

% plot values
hold on;
stem(x, par_corr);
plot(x, y, '--', 'Color', gold);
plot(x, -y, '--', 'Color', gold);
hold off;

% graphing settings
str = sprintf('Partical Correlation for RRI Data: Trial %d', trial);
title(str, 'FontSize', 40);
xlabel('\fontsize{35}\tau')
ylabel('\fontsize{35}R_{x}(\tau)')
legend('\fontsize{30}Emperical Data',...
       '\fontsize{30}Zero-Mean Data',...
       '\fontsize{30}Threshold');
   
grid on 
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);
axis([1 par_corr_len -1 1])
