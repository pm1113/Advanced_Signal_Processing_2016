clear all
load vinyl.mat

% define length of vector
N = length(um(:,1));

pf_1 = pgm(um(:,1));
pf_2 = pgm(um(:,2));
pf_1_o = pgm(um_original(:,1));
pf_2_o = pgm(um_original(:,2));

% generate x-axis
x = linspace(0, 0.5, N/2+1)*44100;

col_2 = [0 0.4470 0.7410];
col_3 = [0.8500 0.3250 0.0980];
figure(1)
hold on
plot(x, mag2db(pf_2(1:N/2+1)), 'Color', col_3);
plot(x, mag2db(pf_2_o(1:N/2+1)), 'Color', col_2);

xlim([0 2000])
% ylim([0 14])
title('\fontsize{40}Periodogram of LTE: Right Channel')
xlabel('\fontsize{35}Frequency (Hz)')
ylabel('\fontsize{35}Magnitude')
grid on;
grid minor;
a=get(gca,'XTickLabel');    
set(gca,'XTickLabel', a, 'fontsize', 24);
legend( '\fontsize{30}Corrupted Signal','\fontsize{30}Clean Signal');
