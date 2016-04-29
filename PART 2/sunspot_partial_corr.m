clear all

% fetch sunspot data
load sunspot.dat

% length of partial correlation sequence
par_corr_len = 20;

% amplitude of threshold
a = 0.2;

% store sunspot time series in variable s_data
s_data(:, 1) = sunspot(:, 2);

% normalise data
% zero mean unity variance
s_data(:, 2) = zscore(s_data(:, 1));

% length of time series
N = length(s_data(:, 1));

% initial variable to hold partial correlation value
par_corr = zeros(par_corr_len, 2);

% calculate partial correlations
for i = 1:par_corr_len
    % loop to calculate partial correlation of
    % both empirical and normalised data
    for j = 1:2
        coefs = aryule(s_data(:, j), i);
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
title('\fontsize{40}Partical Correlation for Sun Spots Time Series');
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


