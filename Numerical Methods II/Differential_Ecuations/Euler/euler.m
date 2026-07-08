function [t,y]=euler(f,a,b,y0,n)

%Euler's method for systems of differential equations
%f function
% a and b the bounds of the interval
% n number od nodes
%%% Outputs
%t interval partition
%y aproximations

h= (b-a)/n;

t= a+h*(0:n);

k= length(y0)
y=zeros(k,n+1);

y(:,1)=y0';

for i=1:n
    y(:,i+1) = y(:,i) + h*feval(f,t(i), y(:,i));
end