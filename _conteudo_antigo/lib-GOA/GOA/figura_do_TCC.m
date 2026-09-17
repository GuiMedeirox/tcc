clc
clear all


Ncam=3; % numero de camadas
ab2=[ 1 2 3 4 5 6 8 10 15 20 30 40 50 60 80 100 150 200 300  400 500 600 800 1000]';% Aberturas
%ab2=[2 4 6 8 10  20 40 60 80 100 200 400 600 800 1000 2000 4000 5000 8000 ];
Ncal=length(ab2);
% modelo
rho1=[ 120 50 800]';

esp1=[12 30]'; % espessuras

roap1 = dirmod1d( rho1, esp1, Ncal,ab2);

%loglog(ab2,roap1,'o')

%%%
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create loglog
loglog(ab2,roap1,'Marker','*','LineStyle','none');

% Create ylabel
ylabel({'Resistividade aparente (Ωm)'});

% Create xlabel
xlabel({'Espaçamento AB/2 (m)'});

box(axes1,'on');
% Set the remaining axes properties
set(axes1,'XMinorTick','on','XScale','log','YMinorTick','on','YScale','log');
grid on
axis([0 1000 0 1000])
