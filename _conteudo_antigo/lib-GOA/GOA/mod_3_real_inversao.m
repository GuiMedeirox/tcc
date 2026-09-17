%_________________________________________________________________________%
%  Grasshopper Optimization Algorithm (GOA) source codes demo 1.0         %
%                                                                         %
%  Developed in MATLAB R2016a                                             %
%                                                                         %
%  Author and programmer: Seyedali Mirjalili                              %
%                                                                         %
%         e-Mail: ali.mirjalili@gmail.com                                 %
%                 seyedali.mirjalili@griffithuni.edu.au                   %
%                                                                         %
%       Homepage: http://www.alimirjalili.com                             %
%                                                                         %
%  Main paper: S. Saremi, S. Mirjalili, A. Lewis                          %
%              Grasshopper Optimisation Algorithm: Theory and Application %
%               Advances in Engineering Software , in press,              %
%               DOI: http://dx.doi.org/10.1016/j.advengsoft.2017.01.004   %
%                                                                         %
%_________________________________________________________________________%

% You can simply define your cost in a seperate file and load its handle to fobj 
% The initial parameters that you need are:
%__________________________________________
% fobj = @YourCostFunction
% dim = number of your variables
% Max_iteration = maximum number of generations
% SearchAgents_no = number of search agents
% lb=[lb1;lb2;...;lbn] where lbn is the lower bound of variable n 
% ub=[ub1;ub2;...;ubn] where ubn is the upper bound of variable n
% If all the variables have equal lower bound you can just
% define lb and ub as two single number numbers

% To run GOA: [Best_score,Best_pos,GOA_cg_curve]=GOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj)
%__________________________________________

clear all 
clc

%rho2=[7 10 5 30]'; % VES 2 %modelo3_real
%esp2=[10 12 60]';

Ncam=5; % numero de camadas

% m=[10 390 10 10 250]'; % modelo
dobs_real=[4.75 6.5 8.85 11 13 17.1 19.6 16.4 12.8 8.6 6.2 5.6 7.7 9.6 13.3 15 16 17.5 18 19.5];
nobs=length(dobs_real);
ab2=[2 3 4 5 6 8 10 15 20 30 40 50 80 100 150 200 250 300 400 500]';% Aberturas
%m_estimado=[rho2 ;esp2];
%Ncal=length(ab2);

SearchAgents_no=200; % Number of search agents (10 x o numero de parametros)

% iterações para média até 10[m11, m12 ...]

Max_iteration=500; % Maximum numbef of iterations 

lb =[1 1 1 1 1 1 1 1 1]'; %0.5*m_estimado; % usar o range do modelo do artigo
ub =[150 150 150 150 150 50 50 50 50 ]'; %1.5*m_estimado; % usar o range do modelo do artigo
dim = 9;

fobj =@(x) (norm(dobs_real-modelagem(x, Ncam, ab2)) ^ 2)/nobs;


for i =1:1 % 10 interações para dobs_mod_1.mat
[fval,X(i,:),Convergence_curve,Trajectories,fitness_history, position_history]=GOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
disp('Término do laço número #');
disp(i);
end
%%
mod_1_media= mean(X) %% Média
mod_1_desvio_padrao=std(X); %% desvio padrao
%%
dcalc=modelagem(X, Ncam, ab2);
loglog(ab2, dcalc);
hold on
loglog(ab2, dobs_real,'*');

%% utilizar só uma interação para plotar o gráfico
it=1:Max_iteration;
plot(it,Convergence_curve)
