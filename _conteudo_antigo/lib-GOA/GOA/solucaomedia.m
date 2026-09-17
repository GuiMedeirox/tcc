clear
clc

Ncam=3; % numero de camadas
ab2=[ 1 2 3 4 5 6 8 10 15 20 30 40 50 60 80 100 150 200 300  400 500 600 800 1000]';
load('dobs1.mat')

load('x1.mat');
x1=x;
load('x2.mat');
x2=x;
load('x3.mat');
x3=x;

X=[x1;x2;x3];
xm=mean(X); %%solucao media (ver no workspace)
xm=xm';
sd=std(X) %%desvio padrao
loglog(ab2,dobs1,'*');
hold on
rhocal=modelagem(xm, Ncam, ab2);
loglog(ab2,rhocal);