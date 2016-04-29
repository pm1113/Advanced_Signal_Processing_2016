clear all

% load music
load vinyl.mat

% noisy data
n_data = um(:,2);

% clean data
c_data = um_original(:,2);

% define length of vector
N = length(n_data);

% define initial mu
mu = 1;

% define max order
max_order = 100;

% periodogram of clean signal
pf_clean = pgm(c_data);

% initialise error vector
relative_error = zeros(max_order,1);

for i = 100:max_order
    % filter music using nlms algorithm
    filtered = nlms(n_data, c_data, mu,i);

    % periodogram of filtered signal
    pf_filtered = pgm(filtered);
    
    relative_error(i) = norm(pf_clean - pf_filtered)/norm(pf_clean);
end

x = linspace(0, 0.5, N/2+1)*44100;
col_1 = [0.4660 0.6740 0.1880];
col_2 = [0 0.4470 0.7410];
col_3 = [0.8500 0.3250 0.0980];
pf_noise = pgm(n_data);
% plot pgm of output data
figure(6)
hold on;
plot(x,  mag2db(pf_clean(1:N/2+1)),  'Color', col_2)
plot(x,  mag2db(pf_noise(1:N/2+1)), 'Color', col_3)
plot(x,  mag2db(pf_filtered(1:N/2+1)), 'Color', col_1);
hold off;
xlim([0 2000])
% ylim([0 14])
title('\fontsize{40}Analysis of Performance in Frequency Domain, Model Order = 100')
xlabel('\fontsize{35}Frequency (Hz)')
ylabel('\fontsize{35}Magnitude')
grid on;
grid minor;
a=get(gca,'XTickLabel');
set(gca,'XTickLabel', a, 'fontsize', 24);
legend( '\fontsize{30}Clean Signal', '\fontsize{30}Corrupted Signal', '\fontsize{30}Filtered Signal' )