function r=SimpsonComp(f,a,b,n)

%f function to evaluate 
%a lower bound of the interval
%b upper bound of the interval
%n actual number of nodes

if mod(n, 2) == 1
    
    h=(b-a)/(n-1);
    

    nod_impar= a+h:2*h:a+(n-2)*h;
    nod_par= a+2*h:2*h:a+(n-3)*h;
    nod_par_eval=feval(f,nod_par);
    nod_impar_eval=feval(f,nod_impar);
    r=(h/3)*(feval(f,a) + 2*sum(nod_par_eval)+4*sum(nod_impar_eval)+ feval(f,b));

else
   disp('No se puede ejecutar el método: n debe ser par');
        r = NaN; % <--- ASIGNA UN VALOR (Not a Number) para evitar el error
        return;

end