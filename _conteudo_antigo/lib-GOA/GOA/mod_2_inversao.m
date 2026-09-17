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
load('mod_2_dobs.mat')
nobs=length(mod_2_dobs);


Ncam = 5; % numero de camadas
% modelo2
% rho1=[10 50 100 20 400]'; 
% esp1=[2 15 20 25]'



ab2=[ 1 2 3 4 5 6 8 10 15 20 30 40 50 60 80 100 150 200 300  400 500 600 800 1000]';% Aberturas

%Ncal=length(ab2);

SearchAgents_no=200; % Number of search agents (10 x o numero de parametros)


% iterações para média até 10[m11, m12 ...]

Max_iteration=1000; % Maximum numbef of iterations 

lb = [1.0 30.0 50.0 10.0 200.0 0.5 10.0 10.0 10.0]'; % usar o range do modelo do artigo
ub = [20.0 60.0 150.0 40.0 600.0 5.0 20.0 30.0 30.0]'; % usar o range do modelo do artigo
dim = length(lb);

fobj =@(x) (norm(mod_2_dobs-modelagem(x, Ncam, ab2)) ^ 2)/nobs;


for i =1:10 % 10 interações para dobs_mod_1.mat
[fval,X(i,:),Convergence_curve,Trajectories,fitness_history, position_history]=GOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
disp('Interação Global Número: ');
disp(i);
end
mod_2_Xmedia= mean(X); %% Média
mod_2_desvio_padrao=std(X); %% desvio padrao


