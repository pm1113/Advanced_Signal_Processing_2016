clear all

% load the data
load vinyl.mat

% store data in variable
% process left channel
dataIn = s2h(:, 1);

% load filters
load bsFilters.mat

% filter the data
dataOut = filter(bsFilt_1495, dataIn);

% play filtered music
% sound(dataOut, FS)

% length of vector
N = length(s2h(:,1));

% generate x-axis
x = linspace(0, 0.5, N/2+1)*44100;


%% Periodogram of Input 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Estimate PSD of Input Signal using Periodogram
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% estimate PSD using periodogram
Pf_input = pgm(dataIn);

% plot values
plot(x, Pf_input(1:N/2+1));

% graphing settings
title('\fontsize{40}Corrupted: Left Channel')
xlabel('\fontsize{35}Frequency (x 2\pi rad/sample)')
ylabel('\fontsize{35}Magnitude')

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);

xlim([0 0.05*FS])

%% Periodogram of Output
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Estimate PSD of Output Signal using Periodogram
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% estimate PSD of output using periodogram
Pf_output = pgm(dataOut);

% plot values
plot(x, Pf_output(1:N/2+1));

% Graphing Setting
title('\fontsize{40}Filtered: Left Channel')
xlabel('\fontsize{35}Frequencies (x 2\pi rad/sample)')
ylabel('\fontsize{35}Magnitude')

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);

xlim([0 0.05*FS])

%% Compare PSD of Input, Output and Reference Clean Signal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compare the PSD of the Input, Output and Reference Signal
% plot in Log scale to magnify differences
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% estimate PSD of clean signal using Periodogram
Pf_clean = pgm(s2h_original(:, 1));

% define colors for plot
col_1 = [0.4660 0.6740 0.1880];
col_2 = [0 0.4470 0.7410];
col_3 = [0.8500 0.3250 0.0980];

% plot values
hold on
plot(x,  mag2db(Pf_clean(1:N/2+1)),  'Color', col_2)
plot(x,  mag2db(Pf_input(1:N/2+1)), 'Color', col_3)
plot(x,  mag2db(Pf_output(1:N/2+1)), 'Color', col_1);
hold off

% Graphing Settings
title('\fontsize{40}Comparison of Periodograms');
xlabel('\fontsize{35}Frequency (Hz)');
ylabel('\fontsize{35}Magnitude');
legend('\fontsize{30}Clean Signal',...
       '\fontsize{30}Corrupted Signal',...
       '\fontsize{30}Filtered Signal' );
   
grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);

xlim([0 0.05*FS])
ylim([-300 100])
