% clear all
% 
% % load music
load vinyl.mat

% noisy data
n_data = s2h(:,2);

% clean data
c_data = s2h_original(:,2);

% define length of vector
N = length(n_data);

% define initial mu
mu = 1;

% define max order
max_order = 20;

% periodogram of clean signal
pf_clean = pgm(c_data);

% initialise error vect
relative_error = zeros(max_order,1);

for i = 20:max_order
    % filter music using nlms algorithm
    [filtered, e, coefs] = lms(n_data, c_data, mu,i);

    % periodogram of filtered signal
    pf_filtered = pgm(filtered);
    
    relative_error(i) = norm(pf_clean - pf_filtered)/norm(pf_clean);
    relative_squared_error(i) = immse(filtered, c_data);
end


% % generate x-axis
% x = linspace(0, 0.5, N/2+1);
% 
% % plot pgm of output data
% figure(1)
% plot(x, pf_clean(1:N/2+1) - pf_filtered(1:N/2+1));
% xlim([0 0.05])
% ylim([-1 1])
% title('\fontsize{40}Noise in Left Channel after Filtering')
% xlabel('\fontsize{35}Normalised Frequencies (x 2\pi rad/sample)')
% ylabel('\fontsize{35}Magnitude')
% grid on;
% grid minor;

col_1 = [0.4660 0.6740 0.1880];
col_2 = [0 0.4470 0.7410];
col_3 = [0.8500 0.3250 0.0980];

% x=linspace(0, 30.5, 1345050);
% sound(filtered, FS);
% hold on
% plot(x,n_data, 'Color', col_3);
% plot(x,filtered ,'Color', col_1);
% plot(x,c_data, 'Color', col_2);
% hold off
% xlim([9.5 13.5])
% title('\fontsize{40}Analysis of Performance in Time Domain, Model Order = 100')
% legend('\fontsize{30}Corrupted Signal', '\fontsize{30}Filtered Signal', '\fontsize{30}Clean Signal')
% xlabel('\fontsize{35}Time (s)')
% ylabel('\fontsize{35}Magnitude')
% grid on
% grid minor
% a = get(gca, 'XTickLabel');
% set(gca,'XTickLabel',a,'fontsize',24)


% x = linspace(0, 0.5, N/2+1)*44100;
% col_1 = [0.4660 0.6740 0.1880];
% col_2 = [0 0.4470 0.7410];
% col_3 = [0.8500 0.3250 0.0980];
% pf_noise = pgm(s2h(:,2));
% % plot pgm of output data
% figure(6)
% hold on;
% plot(x,  mag2db(pf_clean(1:N/2+1)),  'Color', col_2)
% plot(x,  mag2db(pf_noise(1:N/2+1)), 'Color', col_3)
% plot(x,  mag2db(pf_filtered(1:N/2+1)), 'Color', col_1);
% hold off;
% xlim([0 2000])
% % ylim([0 14])
% title('\fontsize{40}Analysis of Performance in Frequency Domain, Model Order = 20')
% xlabel('\fontsize{35}Frequency (Hz)')
% ylabel('\fontsize{35}Magnitude')
% grid on;
% grid minor;
% a=get(gca,'XTickLabel');
% set(gca,'XTickLabel', a, 'fontsize', 24);
% legend( '\fontsize{30}Clean Signal', '\fontsize{30}Corrupted Signal', '\fontsize{30}Filtered Signal' )

x=linspace(0, 30.5, 1345050);
hold on
plot(x, mag2db(squared_error_nlms.^2))
plot(x, mag2db(squared_error_lms.^2))
hold off
grid on
grid minor
title('\fontsize{40}Squared Error for LMS and Normalised LMS Algorithm, Order 20')
xlabel('\fontsize{35}Time (s)')
ylabel('\fontsize{34}Squared Error (dB)')
a=get(gca,'XTickLabel');
set(gca,'XTickLabel', a, 'fontsize', 24);
legend( '\fontsize{30}Normalised LMS', '\fontsize{30}LMS')

