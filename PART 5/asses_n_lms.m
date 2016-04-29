load lms_mu_point_5_squared_error.mat

% generate x axis
x = linspace(1, 20, 20);

% plot error vector
plot(x, log(relative_error));
hold on;
grid on;
grid minor;
title('\fontsize{40}S2H: Loss Function using Normalised LMS Algorithm');
xlabel('\fontsize{35}Order Number');
ylabel('\fontsize{35}Magnitude')
a = get(gca, 'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',24)
legend('\fontsize{30}\mu = 0.0001',...
       '\fontsize{30}\mu = 0.001',...
       '\fontsize{30}\mu = 0.01',...
       '\fontsize{30}\mu = 0.1',...
       '\fontsize{30}\mu = 0.5')