clear all;

% set default seed
rng default

% length of sequence
N = 1000;

% order of filter to estimate
order = 5;

% step size to test
mu = [0.1 0.05 0.01 0.005 0.001 0.0005 0.00001];

% noise std deviation
noise_std = (0.01)^0.5;

% generate random samples
% input signal
x = randn(N, 1);

% filter coefficients
b = [1 2 3 2 1];
a = 1;

% filtered random sequence
y = filter(b, a, x);

% generate noise
n = randn(N, 1) * noise_std;

% generate z
% teaching signal
z = y + n;

% initialise error vector 
error = zeros(N, length(mu));

% initialise cell to hold strings for legend
legend_str = cell(1, length(mu));

for i = 1:length(mu)

    % estimate using LMS function
    [y_est, error(:, i), est_coeff_mat] = nlms(x, z, mu(i), order);

    % create string for legend
    legend_str{1, i} = char(sprintf('\\mu = %.5f', mu(i))); 
end

% plot values
plot(10 * log(error.^2));

% graphing settings
title('\fontsize{40}Squared-Error for Different Step Sizes');
xlabel('\fontsize{35}Sample number');
ylabel('\fontsize{35}Magnitude (dB)');
legend(legend_str, 'FontSize', 30);

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);
