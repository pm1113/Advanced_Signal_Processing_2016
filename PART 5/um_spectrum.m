clear all


load vinyl.mat

% define length of vector
N = length(um(:,1));

pf_1 = pgm(um(:,1));
pf_2 = pgm(um(:,2));
pf_1_o = pgm(um_original(:,1));
pf_2_o = pgm(um_original(:,2));

% generate x-axis
x = linspace(0, 0.5, N/2+1);

figure(1)
plot(x, pf_1(1:N/2+1));
xlim([0 0.05])
title('\fontsize{40}Corrupted: Left Channel')
xlabel('\fontsize{35}Normalised Frequencies (x 2\pi rad/sample)')
ylabel('\fontsize{35}Magnitude')
grid on;
grid minor;

figure(2)
plot(x, pf_2(1:N/2+1));
xlim([0 0.05])
title('\fontsize{40}Corrupted: Right Channel')
xlabel('\fontsize{35}Normalised Frequencies (x 2\pi rad/sample)')
ylabel('\fontsize{35}Magnitude')
grid on;
grid minor;

figure(3)
plot(x, pf_1_o(1:N/2+1));
xlim([0 0.05])
title('\fontsize{40}Clean: Left Channel')
xlabel('\fontsize{35}Normalised Frequencies (x 2\pi rad/sample)')
ylabel('\fontsize{35}Magnitude')
grid on;
grid minor;

figure(4)
plot(x, pf_2_o(1:N/2+1));
xlim([0 0.05])
title('\fontsize{40}Clean: Right Channel')
xlabel('\fontsize{35}Normalised Frequencies (x 2\pi rad/sample)')
ylabel('\fontsize{35}Magnitude')
grid on;
grid minor;

figure(5)
plot(x, pf_1(1:N/2+1) - pf_1_o(1:N/2+1));
xlim([0 0.05])
title('\fontsize{40}Noise in Left Channel')
xlabel('\fontsize{35}Normalised Frequencies (x 2\pi rad/sample)')
ylabel('\fontsize{35}Magnitude')
grid on;
grid minor;

figure(6)
plot(x, pf_2(1:N/2+1) - pf_2_o(1:N/2+1));
xlim([0 0.05])
title('\fontsize{40}Noise in Right Channel')
xlabel('\fontsize{35}Normalised Frequencies (x 2\pi rad/sample)')
ylabel('\fontsize{35}Magnitude')
grid on;
grid minor;