function roap = dirmod1d( rho, esp, Ncal,b)
% Objetivo: calcular a curva de resistividade aparente sobre um modelo com N camadas homogeneas e isotrópicas.
% Entrada dos parâmetros do modelo     
% Ncam = numero de camadas= size(rho,2)
% rho(i), esp(i) = resistividade e espessura das camadas listadas
%                      com profundidade crescente( vetores colunaa)
% Ncal= número de aberturas
% Nab= Número de artu !!! Use potencias inteiras de 10!!!
% Referencia: Guptsarma, D., 1982, Optimization of short digital linear 
%                filters for increased accuracy, Geophys. Prosp., 30: 501-514.
% adaptado do programa rosch1.for de Walter Medeiros
% Programador: Francisco Márcio Barboza
% Natal, 07 de outubro de 2013

a=[ -2.25811066192, -1.77758417889, -1.29705769575,  -0.81653121272, -0.33600472971,  0.14452175335, 0.62504823641,  1.10557471944,  1.58610120252, 2.06662768556,  2.54715416864,  3.02768065165,              3.50820713474,  3.98873361779,  4.46926010083,              4.94978658391,  5.43031306696,  5.91083955002,              6.39136603308 ];
f=[ 0.00097112, -0.00102152,  0.00906965, 0.01404316, 0.09012000,  0.30171582,  0.99627084, 1.36908320,  -2.99681171,  1.65463068, -0.59399277, 0.22329813,   -0.10119309,  0.05186135, -0.02748647, 0.01384932, -0.00599074,  0.00190463, -0.0003216 ];
Ncam=size(rho,1);
rho=rho;
esp=esp;
%[Ncal, b]= ab2(si,sf);
for j=1:Ncal
    s=b(j);
    soma=0;
    for i=1:19
        lambda=exp(a(i)-log(s));
       Kf= koefoed(Ncam,rho,esp,lambda);
       soma=soma+f(i)*Kf;
    end
    roap(j)=soma; %#ok<AGROW>
end
roap=roap';
end