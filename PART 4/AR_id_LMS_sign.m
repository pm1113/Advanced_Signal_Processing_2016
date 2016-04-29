clear all;

% set default seed
rng default

% length of sequence
N = 50000;

% order of filter to estimate
order = 2;

% step size
mu = 0.001;

% step size for adaptive step size equation
rho = 10e-5;

% generate random samples
% input signal
x = randn(N, 1);

% filter coefficients
b = 1;
a = [1 0.9 0.2];

% filter random samples
y = filter(b, a, x);

%% Teaching Signal, Estimated Signal and Error Graph
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Estimate coefficients using LMS Sign algorithm
% Algorithm defined in LMS Sign function
% Graph Teching signal, Estimated Signal and Error Signal on same plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% estimate using LMS sign function
[y_hat, error, est_coeff_mat] = lms_ar_sign(y, mu, order);

% plot values
hold on;
plot(y);
plot(y_hat);
plot(error);
hold off

% graphing settings
str = sprintf('\fontsize{40}Identification of AR(%d) process using LMS Sign Algorithm: \\mu = %d', length(a) - 1, mu);
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
% Estimate coefficients using LMS Sign algorithm
% Algorithm defined in LMS Sign function
% Graph estimated coefficients
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% estimate using LMS sign function
[y_hat, error, est_coeff_mat] = lms_ar_sign(y, mu, order);

% plot values
plot(est_coeff_mat');

% graphing settings
% double escape to get greek characters in sprintf
str = sprintf('Evolution of Coefficients using LMS Sign Algorithm: \\mu = %d', mu);
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
% Estimate coefficients using LMS Sign algorithm
% Algorithm defined in LMS Sign function
% Graph squared error
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% estimate using LMS sign function
[y_hat, error, est_coeff_mat] = lms_ar_sign(y, mu, order);

% plot values
plot(10 * log(error.^2));

str = sprintf('Squared Error with LMS Sign Algorithm: \\mu = %.4f', mu);
title(str, 'FontSize', 40);
xlabel('\fontsize{35}Sample number');
ylabel('\fontsize{35}Magnitude (dB)');

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);