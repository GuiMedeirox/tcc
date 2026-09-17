clear
clc
load('matriz_media.mat');
load('dobs_mod_1.mat')
Ncam=3; % numero de camadas
lr=Ncam;
lt=Ncam-1;
ab=[ 1 2 3 4 5 6 8 10 15 20 30 40 50 60 80 100 150 200 300  400 500 600 800 1000]';% Aberturas
Ncal=length(ab);
xm=mean(X); %%solucao media (ver no workspace)
%m=X';
modelr=xm(1:Ncam);
modelt=xm(Ncam+1:end);
%

rhoa = dobs_mod_1;     %   Dado observado
roacal =modelagem( xm, Ncam,ab); % Dado calculado

figure(2)
subplot(1,6,[1 3])
hold off
loglog(ab,rhoa,'.','color','r','MarkerSize',15);
hold on
loglog(ab,roacal,'-','color','b','LineWidth',2);
set(gca,'XTick',[1 1e1 1e2 1e3]);
grid on
axis tight
xlabel('\bf \fontsize{10}\fontname{Times}AB/2(m)');
ylabel('\bf \fontsize{10}\fontname{Times}Rho (Ohm.m)');

leg = legend('Rho observado','Rho calculado'); 
set(leg,'Location','South','fontsize',8);
pause(0.001)
  



format bank;

mmodel = [modelr',modelt'];



r = m(1:lr); t = m(1+lr:lr+lt);
rr = [0,r];
tt = [0,cumsum(t),max(t)*10000];           
modelrr = [0,modelr'];
modeltt = [0,cumsum(modelt'),max(modelt')*10000];  

subplot(1,6,[5 6]);
hold off
stairs(modelrr,modeltt,'--','color','r','LineWidth',2);
hold on
stairs(rr,tt,'b','LineWidth',2);
set(gca,'Ydir','reverse');
set(gca,'Xscale','log');
axis([10^0.5 1000 0 100]);
grid on
xlabel('Resistivity (Ohm-m)','fontweight','bold','fontsize',10);
ylabel('Depth (m)','fontweight','bold','fontsize',10);
set(gca,'XTick',[1e-3 1e-2 1e-1 1 1e1 1e2 1e3]);
title('\bf \fontsize{12} \fontname{Times}Model');
leg = legend('Real','LM'); set(leg,'Location','South','fontsize',8);