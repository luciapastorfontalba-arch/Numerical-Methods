
function  [t,y]=rkc(f,a,b,y0,n)

% f function
% a and b bounds of the interval
% y0 initial condition vector
% n number of nodes
% t interval partitions
% y aproximations
%k1= f(tn,yn)
%k2= f(tn+h*c2, yn+h*k1*a2,1)
%k3= f(tn+h*c3, yn+h*(a2,1*k1+k2*a2,2)
%k4= f(tn+h*c4, yn+h*(a31*k1+k2*a3,2+k3*a3,3)

h= (b-a)/n;

t= a+h*(0:n);

k= length(y0)
y=zeros(k,n+1);

y(:,1)=y0';


for i=1:n
    k1=feval(f,t(i),y(:,i));
    k2 = feval(f, t(i) + h/2, y(:, i) + h/2*k1 );
    k3 = feval(f, t(i) + h/2, y(:, i) + h*(0*k1+k2/2) );
    k4 = feval(f, t(i) + h, y(:, i) + h*(0*k1+0*k2+k3) );

    y(:,i+1)=y(:,i)+h*(k1/6+k2/3+k3/3+k4/6 );
end
