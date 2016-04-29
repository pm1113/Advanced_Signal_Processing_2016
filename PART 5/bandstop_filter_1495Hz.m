clear all

% design stop band filer
bsFilt_1495 = designfilt('bandstopiir',...
                         'FilterOrder', 20,...
                         'HalfPowerFrequency1', 1464.12,...
                         'HalfPowerFrequency2', 1525.86, ...
                         'SampleRate',44100);
                     
% plot response of filter
fvtool(bsFilt_1495);

% graphing settings
title('\fontsize{40}Magnitude Response of Bandstop Filter: Centered at 1495Hz');
xlabel('\fontsize{35}Frequency (kHz)');
ylabel('\fontsize{35}Magnitude (dB)');

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);


