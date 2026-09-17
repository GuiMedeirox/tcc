function roap = modelagem(X, nCam, ab2)
X=X;
rho1 = X(1:nCam)';
esp1 = X(nCam+1:2 * nCam - 1)'; 
Ncal = length(ab2);
dcalc = modelagem(X, nCam, ab2);
loglog(ab2, dcalc);
hold on
loglog(ab2, dobs,'*');
dcalc=modelagem(X, nCam, ab2);
loglog(ab2, dcalc);
hold on
loglog(ab2, dobs,'*'); length(ab2);

roap = dirmod1d( rho1, esp1, Ncal, ab2);
end