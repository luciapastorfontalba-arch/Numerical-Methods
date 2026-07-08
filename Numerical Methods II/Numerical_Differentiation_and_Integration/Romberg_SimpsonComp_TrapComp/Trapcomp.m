function r=Trapcomp(f,a,b,n)
%f function to evaluate 
%a lower bound of the interval
%b upper bound of the interval
%n actual number of nodes

h=(b-a)/(n-1);
nodos=a+h:h:a+(n-2)*h;
%nodes=a+h:h:b-h

nodos_eval= feval(f,nodos);
r= h*(feval(f,a)/2 + sum(nodos_eval)+ feval(f,b)/2);