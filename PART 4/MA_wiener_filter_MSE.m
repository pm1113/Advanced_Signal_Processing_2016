clear all

% set default seed
rng default

% length of sequence
N = 1000;

% noise std deviation
noise_std = (1)^0.5;

% max order to calculate MSE for
max_order = 10;

% generate random sequence
% input signal
x = randn(N, 1);

% filter coefficients
b = [1 2 3 2 1];
a = 1;

% filtered random sequence
y(:, 1) = filter(b,a,x);

% normalise data 
% zero mean unity variance
y(:, 2) = zscore(y(:, 1));

% generate noise
n = randn(N, 1) * noise_std;

% generate z
% teaching signal
z = y(:, 2) + n;

% initialise vector to hold MSE
MSE = zeros(1, max_order);

for i = 1:max_order
    
    % set order number
    order  =  i;
    
    % obtain auto correlation of input sequence x
    % only perform multiply-accumulat for the required lags
    x_acf = xcorr(x, x, order-1);

    % truncate auto correlation to remove unrequired lags
    x_acf = x_acf(order:end);

    % form auto correlation matrix
    Rxx = toeplitz(x_acf,conj(x_acf)); 

    % obtain cross correlation of teching signal and input seqeunce
    zx_ccf = xcorr(z,x,order-1);

    % truncate cross correlation to remove unrequired lags
    pzx = zx_ccf(order:end);

    % calculate wopt
    wopt = Rxx\pzx;

    % output using estimated coefficients
    y_hat = filter(wopt, 1, x);
    
    % calculate MSE and store them in a MSE vector
    MSE(i) = immse(y(:, 2), y_hat);
end

% generate x axis
x = linspace(0, max_order-1, max_order);

% plot values
plot(x, MSE)

% graphing settings
title('\fontsize{40}Mean-Square Error Using Optimal Coefficients');
xlabel('\fontsize{35}N_{w}');
ylabel('\fontsize{35}Mean-Squared Error');

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);
