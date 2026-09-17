clear
clc

Ncam=3; % numero de camadas
ab2=[ 1 2 3 4 5 6 8 10 15 20 30 40 50 60 80 100 150 200 300  400 500 600 800 1000]';% quando usar o dados real alterar o AB2
load('dobs_mod_2.mat')

load('matriz_media_mod_2.mat');

xm=mean(X); %%solucao media (ver no workspace)
%xm=xm';
sd=std(X); %%desvio padrao
loglog(ab2,dobs_mod_2,'*');
hold on
rhocal=modelagem(xm, Ncam, ab2);
loglog(ab2,rhocal);