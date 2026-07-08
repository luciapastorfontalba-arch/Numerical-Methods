function [t,y]=euler1d(f,a,b,y0,n)

%f function
% a and b the bounds of the interval
% n number od nodes
%%% Outputs
%t interval partition
%y aproximations

h= (b-a)/n;

t= a+h*(0:n);

y=[];

y(1)=y0;

for i=1:n
    y(i+1) = y(i) + h * feval(f,t(i), y(i));
end