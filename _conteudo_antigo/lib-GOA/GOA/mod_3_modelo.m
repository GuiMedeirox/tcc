%% Primeiro a ser rodado
clc
clear all

%rho1=[5 2.1 0.7 6]'; %VES 1%  modelo3_real
%rho1=[5 2.1 0.7 8]'; % VES 1 %modelo3_real
%esp1=[5 15 20]'; % espessuras 1
rho2=[7 10 5 30]'; % VES 2 %modelo3_real
esp2=[10 12 60]'; % espessuras 2
%rho3=[2.9 1.2 3 10.2]';  % VES 3 %modelo3_real
%esp3=[5 10 60]'; % espessuras 3
dobs_real=[4.75 6.5 8.85 11 13 17.1 19.6 16.4 12.8 8.6 6.2 5.6 7.7 9.6 13.3 15 16 17.5 18 19.5];
%rho1=[4.75 6.5 8.85 11 13 17.1 19.6 16.4 12.8 8.6 6.2 5.6 7.7 9.6 13.3 15 16 17.5 18 19.5]'
Ncam=length(esp2)+1; % numero de camadas
%ab2=[ 1 2 3 4 5 6 8 10 15 20 30 40 50 60 80 100 150 200 300  400 500 600 800 1000]';% Aberturas
ab2=[2 3 4 5 6 8 10 15 20 30 40 50 80 100 150 200 250 300 400 500];
Ncal=length(ab2);


hold on
%roap1 = dirmod1d( rho1, esp1, Ncal,ab2);
roap2 = dirmod1d( rho2, esp2, Ncal,ab2);
%roap3 = dirmod1d( rho3, esp3, Ncal,ab2);
%loglog(ab2,roap1,'-','color','r','LineWidth',2)
loglog(ab2,roap2,'-','color','b','LineWidth',2)
loglog(ab2,dobs_real,'o','color','r','LineWidth',2)
%loglog(ab2,roap3,'-','color','g','LineWidth',2)


box off
grid on
%axis([0 1000 0 20])
xlabel('\bf \fontsize{10}\fontname{Times}AB/2(m)');
ylabel('\bf \fontsize{10}\fontname{Times}Resistividade (Ohm.m)');
 
%%
x=0:0.2:100;
y=2*x.^2;
plot (x,y);
title ('Linear/Linear');
xlabel ('x');
ylabel ('y');
grid on;

%%
%ex_plot_08-escala-semilogx
 
x=0:0.2:100;
y=2*x.^2;
semilogy (x,y);
title ('Linear/Linear');
xlabel ('x');
ylabel ('y');
grid on;

%mod_3_dobs = roap2 + 0.025 * randn(size(roap2)) .* roap2;%% adição do ruído
%% para testar o gráfico
loglog(ab2, roap1,'o');
hold on
loglog(ab2, mod_3_dobs,'*');