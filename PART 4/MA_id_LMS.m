clear all;

% set default seed
rng default

% length of sequence
N = 1000;

% order of filter to estimate
order = 5;

% define step size
mu = 0.01;

% noise std deviation
noise_std = (0.01)^0.5;

% generate random samples
% input signal
x = randn(N, 1);

% filter coefficients
b = [1 2 3 2 1];
a = 1;

% filter random sequence
y = filter(b, a, x);

% generate noise
n = randn(N, 1) * noise_std;

% generate z
% teaching signal
z = y + n;


%% Teaching Signal, Estimated Signal and Error Graph
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Estimate coefficients using LMS algorithm
% Algorithm defined in LMS function
% Graph Teching signal, Estimated Signal and Error Signal on same plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% estimate using LMS function
[y_hat, error, est_coeff_mat] = lms(x, z, mu, order);

% plot values
hold on;
plot(y);
plot(y_hat);
plot(error);
hold off

% graphing settings
str = sprintf('\fontsize{40}System Identification using LMS Algorithm: \\mu = %d', mu);
title(str, 'Fontsize', 40);
xlabel('\fontsize{35}Sample Number');
ylabel('\fontsize{35}Amplitude');
legend('\fontsize{30}Reference/Teaching Signal',...
       '\fontsize{30}Estimated Signal',...
       '\fontsize{30}Error Signal');
   
grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);


%% Estimated Coefficients
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Estimate coeffcients using LMS algorithm
% Algorithm defined in LMS function
% Graph estimated coefficients
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% estimate using LMS function
[y_hat, error, est_coeff_mat] = lms(x, z, mu, order);

% plot values
plot(est_coeff_mat');

% graphing settings
% double escape to get greek characters in sprintf
str = sprintf('Evolution of Coefficients using LMS Algorithm: \\mu = %d', mu);
title(str, 'FontSize', 40);
xlabel('\fontsize{35}Sample Number');
ylabel('\fontsize{35}Weight of Coefficients');
% initialise cell to hold strings for legend
legend_str = cell(1, length(order));
for i = 1:order
    % create string for legend
    legend_str{1, i} = char(sprintf('W_{%d}', i)); 
end
legend(legend_str, 'FontSize', 40);

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);

%% Squared Error
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Estimate coeffcients using LMS algorithm
% Algorithm defined in LMS function
% Graph squared error
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% estimate using LMS function
[y_hat, error, est_coeff_mat] = nlms(x, z, mu, order);

% plot values
plot(10 * log(error.^2));

str = sprintf('Squared Error with \\mu = %.4f', mu);
title(str, 'FontSize', 40);
xlabel('\fontsize{35}Sample number');
ylabel('\fontsize{35}Magnitude (dB)');

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);
