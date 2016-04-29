clear all

% loading RRI data
load Anand_RRI

% store RRI data as time series in variable data
% select trial number
data(1, :) = Trial2_RRI;

% select trial number
trial = 2;

% number of segments
num_segs = 5;

% zero pad signal with 2^15 variables to smooth out PSD estimate
to_pad = 2^15;

% length of data
N = length(data(1, :));

% normalise data
% zero mean unity variance
data(2, :) = zscore(data(1, :));

% window length 
window_length = floor(N/num_segs);


%% No averaging, no zero-padding
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% estimate PSD using periodogram
% No zero-padding 
% No averaging
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)

% obtain PSD estimate using periodogram method
Pf = pgm(data(2, :));

% generate normalised frequencies
freq = linspace(0, 1, N/2);

% plot values
plot(freq, Pf(1:N/2));

% graphing settings
str = sprintf('Standard Peridogram for RRI Data: Trial %d', trial);
title(str, 'FontSize', 40)
xlabel('\fontsize{35}Normalised Frequencies (x \pi rad/sample)')
ylabel('\fontsize{35}Magnitude')

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);

%% No averaging, Zero-Padded
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% periodogram estimate of PSD 
% Zero-padding 
% No averaging
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)

% sequence of zeros to pad
z  = zeros(1, to_pad);

% pad zeros
data_zero_padded(1, :) = [data(2, :) z];

% estimate PSD using periodogram
Pf = pgm(data_zero_padded);

% update length of vector
N = length(data_zero_padded);

% generate frequence axis
freq = linspace(0, 1, N/2);

% plot values
plot(freq, Pf(1:N/2));

% graphing settings
str = sprintf('Standard Peridogram for RRI Data: Trial %d, Zero-Padded', trial);
title(str, 'FontSize', 40)
xlabel('\fontsize{35}Normalised Frequencies (x \pi rad/sample)')
ylabel('\fontsize{35}Magnitude')

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);


%% Averaged, Zero-Padded
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% periodogram estimate of PSD 
% Zero-padding 
% Averaging
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3)

% initialise variable to hold data that is split up
Pf = zeros(num_segs, to_pad+window_length);


% number of iterations depends on number of segments
for i = 1:num_segs
    
    % split data based on window lengths
    Pf(i, 1:window_length) = data(2, (i-1)*window_length+1:i*window_length);
    
    % estimate PSD using periodogram
    Pf(i, :) = pgm(Pf(i, :));
    
end

% average out all PSD estimates that were obtained
Pf = mean(Pf);

% update length of vector
N = length(Pf);

% generate normalised frequncies
freq = linspace(0, 1, N/2);

% plot values
plot(freq, Pf(1:N/2));

% graphing settings
str = sprintf('Averaged Peridogram: Trial %d, %d Segments', trial, num_segs);
title(str, 'FontSize', 40)
xlabel('\fontsize{35}Normalised Frequencies (x \pi rad/sample)')
ylabel('\fontsize{35}Magnitude')

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);

