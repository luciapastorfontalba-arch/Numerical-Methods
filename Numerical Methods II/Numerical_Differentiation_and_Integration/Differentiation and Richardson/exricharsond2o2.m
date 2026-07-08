function g= exricharsond2o2(f,c,k,t,h)
% f: Function to evaluate
% c: Point where the derivative is evaluated
% k: Number of iterations
% t: Tau's value (step reduction factor)
% h: Step size
% g: Richardson matrix of size (k+1) x (k+1)

g = zeros(k + 1, k + 1); % Initialize the Richardson matrix

for i=1:k+1

    g(i,1)= d2o2(f,c,h/t.^(i-1));


end

p=2:2:2*k;  %exponentes del desarrollo

for i =2:k+1 % m columnas y j las filas
    
    for n =i:k+1
          g(n,i)= (t.^(p(i-1))*g(n,i-1)-g(n-1, i-1))./(t.^(p(i-1))-1);  % depende de g(n,i-1) y además g(n-1, i-1)

    end

end