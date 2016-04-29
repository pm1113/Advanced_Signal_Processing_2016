clear all

% load s2h music
load vinyl.mat

% length of vector
N = length(s2h(:, 1));

% estimate PSD using periodogram
pf_1 = pgm(s2h(:, 1));
pf_2 = pgm(s2h(:, 2));
pf_1_o = pgm(s2h_original(:, 1));
pf_2_o = pgm(s2h_original(:, 2));

% generate frequency axis
x = linspace(0, 0.5, N/2+1)*44100;

%% S2H Left Channel Corrupted
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Stairway to Heave
% Left Channel
% Corrupted Channel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% plot values
plot(x, pf_1(1:N/2+1));

% graphing settings
title('\fontsize{40}Corrupted Stairway To Heaven: Left Channel')
xlabel('\fontsize{35}Frequency (Hz)')
ylabel('\fontsize{35}Magnitude')

grid on
grid minor

a = get(gca, 'XTickLabel');    
set(gca, 'XTickLabel', a, 'fontsize', 24);

xlim([0 2000]);
ylim([0 14]);

%% S2H Right Channel Corrupted
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Stairway to Heave
% Right Channel
% Corrupted Channel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% plot values
plot(x, pf_2(1:N/2+1));

% graphing settings
title('\fontsize{40}Corrupted Stairway To Heaven: Right Channel')
xlabel('\fontsize{35}Frequency (Hz)')
ylabel('\fontsize{35}Magnitude')

grid on
grid minor

a = get(gca, 'XTickLabel');    
set(gca, 'XTickLabel', a, 'fontsize', 24);

xlim([0 2000]);
ylim([0 14]);

%% S2H Left Channel Clean
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Stairway to Heave
% Left Channel
% Clean Channel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% plot values
plot(x, pf_1_o(1:N/2+1));

% graphing settings
title('\fontsize{40}Clean Stairway To Heaven: Left Channel')
xlabel('\fontsize{35}Frequency (Hz)')
ylabel('\fontsize{35}Magnitude')

grid on
grid minor

a = get(gca, 'XTickLabel');    
set(gca, 'XTickLabel', a, 'fontsize', 24);

xlim([0 2000]);
ylim([0 14]);

%% S2H Right Channel Clean
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Stairway to Heave
% Right Channel
% Clean Channel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% plot values
plot(x, pf_2_o(1:N/2+1));

% graphing settings
title('\fontsize{40}Clean Stairway To Heaven: Right Channel')
xlabel('\fontsize{35}Frequency (Hz)')
ylabel('\fontsize{35}Magnitude')

grid on
grid minor

a = get(gca, 'XTickLabel');    
set(gca, 'XTickLabel', a, 'fontsize', 24);

xlim([0 2000]);
ylim([0 14]);

%% S2H Left Channel Only Noise
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Stairway to Heave
% Left Channel
% Only Noise Channel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% plot values
plot(x, pf_1(1:N/2+1) - pf_1_o(1:N/2+1));

% graphing settings
title('\fontsize{40}Stairway To Heaven: Noise in Left Channel')
xlabel('\fontsize{35}Frequency (Hz)')
ylabel('\fontsize{35}Magnitude')

grid on
grid minor

a = get(gca, 'XTickLabel');    
set(gca, 'XTickLabel', a, 'fontsize', 24);

xlim([0 2000]);
ylim([0 14]);

%% S2H Left Channel Only Noise
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Stairway to Heave
% Left Channel
% Only Noise Channel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% plot values
plot(x, pf_2(1:N/2+1) - pf_2_o(1:N/2+1));

% graphing settings
title('\fontsize{40}Stairway To Heaven: Noise in Right Channel')
xlabel('\fontsize{35}Frequency (Hz)')
ylabel('\fontsize{35}Magnitude')

grid on
grid minor

a = get(gca, 'XTickLabel');    
set(gca, 'XTickLabel', a, 'fontsize', 24);

xlim([0 2000]);
ylim([0 14]);