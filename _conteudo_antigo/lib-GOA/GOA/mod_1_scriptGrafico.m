clear
clc
Ncam=3; % numero de camadas
lr=Ncam;
lt=Ncam-1;
ab=[ 1 2 3 4 5 6 8 10 15 20 30 40 50 60 80 100 150 200 300  400 500 600 800 1000]';% Aberturas
Ncal=length(ab);
load mod_1_Xmedia.mat
X=mod_1_Xmedia'; % modelo estimado
Xv=[10 390 10 10 250]'; % modelo verdadeiro
mv=Xv'; % modelo verdadeiro
m=X'; % modelo estimado
modelr=X(1:Ncam); % modelo resistividade estimado
modelt=X(Ncam+1:end); % modelo espesura estimado

modelrv=Xv(1:Ncam); % modelo resistividade verdadeiro
modeltv=Xv(Ncam+1:end);% modelo espesura verdadeiro

%
load mod_1_dobs.mat; 
rhoa = mod_1_dobs;     %   dado observado
 roacal =dirmod1d( modelr, modelt, Ncal,ab); %Dado calculado

figure(2)
%subplot(1,6,[1 3])
hold off
loglog(ab,rhoa,'.','color','r','MarkerSize',15);
hold on
loglog(ab,roacal,'-','color','b','LineWidth',2);
set(gca,'XTick',[1 1e1 1e2 1e3]);

grid on
axis tight
xlabel('\bf \fontsize{12}\fontname{Times}AB/2(m)');
ylabel('\bf \fontsize{12}\fontname{Times}Resistividade Aparente (Ohm.m)');

leg = legend('Resistividade aparente observada (obs)','Resistividade aparente calcalculada (cal)'); 
set(leg,'Location','South','fontsize',10);
%%
    
format bank;

mmodel = [modelr',modelt'];

mmodelv = [modelrv',modeltv'];

%
r = m(1:lr); t = m(1+lr:lr+lt);
rr = [0,r];
tt = [0,cumsum(t),max(t)*10000];           
modelrr = [0,modelr'];
modeltt = [0,cumsum(modelt'),max(modelt')*10000];  
%
rv = mv(1:lr); tv = mv(1+lr:lr+lt);
rrv = [0,rv];
ttv = [0,cumsum(tv),max(tv)*10000];           
modelrrv = [0,modelrv'];
modelttv = [0,cumsum(modeltv'),max(modeltv')*10000];  



%
hold off
stairs(modelrr,modeltt,'-','color','b','LineWidth',2);
hold on
stairs(modelrrv,modelttv,'--','color','r','LineWidth',2); % mudei a ordem para aparecer na legenda


stairs(rr,tt,'-','color','b','LineWidth',2);

%verdadeiro

stairs(rrv,ttv,'--','color','r','LineWidth',2);


set(gca,'Ydir','reverse');
set(gca,'Xscale','log');
axis([10^0.5 10^3.5 0 300]); % tamanho do eixo y e x
grid on
xlabel('Resistivitidade (Ohm-m)','fontweight','bold','fontsize',12);
ylabel('Profundidade (m)','fontweight','bold','fontsize',12);
set(gca,'XTick',[1e-3 1e-2 1e-1 1 1e1 1e2 1e3 3e3]);
leg = legend('Verdadeiro','Estimado'); 
set(leg,'Location','South','fontsize',10);
%% Gráfico Convergencia
load mod_1_convergence.mat; 
it=2:1000;
hold on
plot(it,Convergence_curve(2:end),'-','color','b','LineWidth',2);
grid on
axis tight
xlabel('\bf \fontsize{12}\fontname{Times}Iteração');
ylabel('\bf \fontsize{12}\fontname{Times}Fitness');
