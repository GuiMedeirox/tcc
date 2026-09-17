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
load('mod_1_dobs.mat')
nobs=length(mod_1_dobs);

Ncam=3; % numero de camadas

% m=[10 390 10 10 250]'; % modelo


ab2=[ 1 2 3 4 5 6 8 10 15 20 30 40 50 60 80 100 150 200 300  400 500 600 800 1000]';% Aberturas
%ab2=[2 4 6 8 10  20 40 60 80 100 200 400 600 800 1000 2000 4000 5000 8000 ];

%Ncal=length(ab2);

SearchAgents_no=100; % Number of search agents (10 x o numero de parametros)

% iterações para média até 10[m11, m12 ...]

Max_iteration=1000; % Maximum numbef of iterations 

lb = [5.0 15.0 1.0 1.0 100.0]'; % usar o range do modelo do artigo
ub = [15.0 500.0 20.0 20.0 500.0]'; % usar o range do modelo do artigo
dim = 5;

fobj =@(x) (norm(mod_1_dobs-modelagem(x, Ncam, ab2)) ^ 2)/nobs;


for i =1:10 % 10 interações para dobs_mod_1.mat
[fval,X(i,:),Convergence_curve,Trajectories,fitness_history, position_history]=GOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
disp('Término do laço número #');
disp(i);
end
mod_1_Xmedia= mean(X); %% Média
mod_1_desvio_padrao=std(X); %% desvio padrao

