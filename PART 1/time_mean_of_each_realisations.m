clear all
M=4;
N=1000;

col_1=[0    0.4470    0.7410];
col_2=[ 0.8500    0.3250    0.0980];
col_3=[0.9290    0.6940    0.1250];

v=rp1(M,N);
m = mean(v');
figure(1)
plot((1:1:4),m,'-o', 'Color', col_1);
grid on;
grid minor;
title('\fontsize{40}RP1: Sample Mean Across Ensembles');
xlabel('\fontsize{35}Realisation Number');
ylabel('\fontsize{35}Sample Mean');
axis([1, 4, 9.5, 10.5]);
ax=gca;
ax.XTick = [1 2 3 4];
ax.YTick = [9.5 9.7 9.9 10.1 10.3 10.5];
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',24)


% 
v=rp2(M,N);
m = mean(v');
figure(2)
plot((1:1:4),m,'-o', 'Color', col_2)
grid on;
grid minor;
title('\fontsize{40}RP2: Sample Mean Across Ensembles');
xlabel('\fontsize{35}Realisation Number');
ylabel('\fontsize{35}Sample Mean');
axis([1, 4, 0, 1]);
ax=gca;
ax.XTick = [1 2 3 4];
ax.YTick = [0 0.2 0.4 0.6 0.8 1.0];
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',24)



v=rp3(M,N);
m = mean(v');
figure(3)
plot((1:1:4),m,'-o', 'Color', col_3)
grid on;
grid minor;
title('\fontsize{40}RP3: Sample Mean Across Ensembles');
xlabel('\fontsize{35}Realisation Number');
ylabel('\fontsize{35}Sample Mean');
axis([1, 4, 0, 1]);
ax=gca;
ax.XTick = [1 2 3 4];
ax.YTick = [0 0.2 0.4 0.6 0.8 1.0];
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',24)


