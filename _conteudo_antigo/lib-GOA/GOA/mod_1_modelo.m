clc
clear all

Ncam=3; % numero de camadas
ab2=[ 1 2 3 4 5 6 8 10 15 20 30 40 50 60 80 100 150 200 300  400 500 600 800 1000]';% Aberturas
%ab2=[2 4 6 8 10  20 40 60 80 100 200 400 600 800 1000 2000 4000 5000 8000 ];
Ncal=length(ab2);

% rho1=[ 2500 100 300]'; % modelo
%esp1=[2 25]'; % espessuras
rho1=[ 10 390 10]'; % modelo1
esp1=[10 250]'; % espessuras1

roap1 = dirmod1d( rho1, esp1, Ncal,ab2);
%%loglog(ab2,roap1,'o')

X = [rho1; esp1];

roap2 = modelagem(X', Ncam, ab2);

mod_1_dobs = roap2 + 0.025 * randn(size(roap2)) .* roap2;
%% para testar o gráfico
loglog(ab2, roap1,'o');
hold on
loglog(ab2, mod_1_dobs,'*');
