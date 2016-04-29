clear all

% set default seed
rng default

% load dial pad frequencies table
load dial_pad_freqs

% noise standard deviation
std_n = 10;

% sampling frequency
Fs = 32768;

% length of time domain signal
t = 5.25;

% generate random integers from 0 to 9
r = randi([0 9], 1, 8);

% append 020 to the phone number that is generated
r = [0 2 0 r];

% create axis to generate sine wave that is 0.25 seconds long
% 8192 samples in 0.25 correspond to a sampling rate of 32768
x = linspace(0, 0.25, 8192);

% initialise vector to generate singal
y = [];

% generate signal for 10 numbers and 10 blanks
for i=1:10
    
    % generate signal for ith number
    temp1 = sin(2 * pi * freqs(1, r(i)+1) * x) + sin(2 * pi * freqs(2, r(i)+1) * x); 
    
    % generate blank for ith blank after ith number
    temp2 = zeros(1, 8192);
    
    % append data to vector y
    y = [y temp1 temp2];
    
end

% generate signal for 11th number
temp1 = sin(2 * pi * freqs(1, r(11)+1) * x) + sin(2 * pi * freqs(2, r(11)+1) *x);

% append data to vector y
y = [y temp1];

% generate noise
n = randn(1, Fs * t) * std_n;

% add noise to signal
y = y + n;


%% time domain signal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot time domain signal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1);

% generate x axis
% signal is 5.25 seconds long with a sampling rate of 32768Hz
x = linspace(0, 5.25, 172032);
plot(x, y);

% graphing settings
title('\fontsize{40}Time Domain Representation of Signal Generated from Dial Tone Pad');
xlabel('\fontsize{35}Time(s)')
ylabel('\fontsize{35}Amplitude')

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);
% limit axis to view only first 2 numbers and 1st blank
axis([0 0.75 -2 2]);

%% spectrogram
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spectrogram generated from signal y
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% hanning window is used: each segment is 8192 samples long
% 0 samples overlap
% evaluate fft at 8192 frequencies for each window
% sampling rate of 32768Hz 
figure(2);
spectrogram(y, hann(8192), 0, 8192, 32768, 'yaxis');

% graphing settings
ylim([0.250 1.750])
title('\fontsize{40}Spectrogram of Dial Tone Signal');
xlabel('\fontsize{35}Time (secs)');

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);


%% fft of selected segments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fft of selected segments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3);
[s, f, t] = spectrogram(y, hann(8192), 0, 8192, 32768);

% plot values
hold on
plot(f, mag2db(abs(s(:, 11))), 'LineWidth', 1);
plot(f, mag2db(abs(s(:, 9))), 'LineWidth', 1);
hold off

% graphing settings

title('\fontsize{40}Magnitude spectrum of selected segments of Dial Tone Signals')
xlabel('\fontsize{35}Frequency(Hz)')
ylabel('\fontsize{35}Magnitude(dB)')
legend('\fontsize{30}Number 1',...
       '\fontsize{30}Number 9');

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);
xlim([0 2000]);



