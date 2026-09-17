function [Rf]=koefoed(Ncam, rho, esp, lambda)

 Rf = rho(Ncam);
%if Ncam==1
    for i=Ncam-1:-1:1
        arg = lambda*esp(i);
        auxil=1;
         if arg < 100 
            auxil=tanh(arg);
         end
         Rf=(Rf+rho(i)*auxil)/(1+Rf*auxil/rho(i));
                                  
    end
 %end
end

    
