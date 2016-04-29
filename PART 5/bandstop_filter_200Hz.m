clear all

% design stop band filer
bsFilt_200 = designfilt('bandstopiir',...
                         'FilterOrder', 20,...
                         'HalfPowerFrequency1', 185,...
                         'HalfPowerFrequency2', 216.09, ...
                         'SampleRate',44100);
                     
% plot response of filter
fvtool(bsFilt_200);

% graphing settings
title('\fontsize{40}Magnitude Response of Bandstop Filter: Centered at 200Hz');
xlabel('\fontsize{35}Frequency (kHz)');
ylabel('\fontsize{35}Magnitude (dB)');

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);

