clear all

% set default seed
rng default

% length of sequence
N = 100;

% generate random sequence
% drawn from gaussian distribution
x = randn(1, N);

% generate a_1 coefficients
a1 = 5.0 * rand(1, N) - 2.5;

% generate a_2 coefficients
a2 = 3.0 * rand(1, N) - 1.5;

% initialise vectors to hold coefficients
% of processes that are stable and unstable 
% respectively
stable = [];
unstable = [];

% run through all processes to check 
% if they are stable or unable
for i=1:N
    % Condition 1: a1 + a2 <1
    % Condition 2: a2 - a1 <1
    % Condition 3: -1 < a2 < 1
    if (a1(i)+a2(i)<1) && (a2(i)-a1(i)<1) && (a2(i)<1) && (a2(i)>-1)
        stable = [stable [a1(i);a2(i)]];
    else
        unstable = [unstable [a1(i);a2(i)]];
    end
end

% define colors for plot
blue = [0 0.4470 0.7410];
red = [0.8500 0.3250 0.0980];

% plot values
hold on;
plot(stable(1, :), stable(2, :), 'x', 'Color', blue);
plot(unstable(1, :), unstable(2, :), 'x', 'Color', red);
hold off;


% graphing settings
str = sprintf('Stability Plot for N = %d', N);
title(str, 'FontSize', 40);
xlabel('\fontsize{35}a_{1}');
ylabel('\fontsize{35}a_{2}');
legend('\fontsize{30}Stable',...
       '\fontsize{30}Unstable');

grid on
grid minor

a = get(gca, 'XTickLabel');
set(gca, 'XTickLabel', a, 'fontsize', 24);
