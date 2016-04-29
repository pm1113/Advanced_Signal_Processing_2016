clear all;

% set default seed
rng default

% length of sequence
N = 1000;

% order of filter to estimate
order = 5;

% noise std variance
noise_std = (10)^0.5;

% generate random sequence
% input signal
x = randn(N, 1);

% filter coefficients
b = [1 2 3 2 1];
a = 1;

% filtered random sequence
y(:, 1) = filter(b, a, x);

% normalise data 
% zero mean unity variance
y(:, 2) = zscore(y(:, 1));

% generate noise
n = randn(N, 1) * noise_std;

% generate z
% teaching signal
z = y(:, 2) + n;

% obtain auto correlation of input sequence x
% only perform multiply-accumulat for the required lags
x_acf = xcorr(x, x, order-1);

% truncate auto correlation to remove unrequired lags
x_acf = x_acf(order:end);

% form auto correlation matrix
Rxx = toeplitz(x_acf, conj(x_acf)); 

% obtain cross correlation of teaching signal and input seqeunce
zx_ccf = xcorr(z, x, order-1);

% truncate cross correlation to remove unrequired lags
pzx = zx_ccf(order:end);

% calculate wopt
wopt = Rxx\pzx;

% display optimal coefficients
disp(wopt);
