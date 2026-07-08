function [g1,g2]= exricharsond1o1error(f,c,k,t,h)
% f: Function to evaluate
% c: Point where the derivative is evaluated
% k: Number of iterations
% t: Tau's value (step reduction factor)
% h: Step size
% g1: Richardson matrix of size (k+1) x (k+1)
% g2: Richardson error matrix



g1= zeros(k + 1, k + 1);
g2= zeros(k , k );





for i=1:k+1 
    %vamos llenando la primera columna que no pertenece aún
    %a la primera iteración del método 
    g1(i,1)=d1o1(f,c,h/t^(i-1));

end
p=1:1:k;
% p van a ser exponentes del desarrollo asintótico
% m van a ser las columnas 
% n van a ser las filas
for m=2:k+1
    for n=m:k+1
        g1(n,m)=(t^p(m-1)*g1(n,m-1)-g1(n-1,m-1))./(t^p(m-1)-1);
        g2(n-1,m-1)=abs((g1(n,m-1)-g1(n-1,m-1))./(t^p(m-1)-1));
      
    end
end