function [r]=d1o1(f,c,h)
%f function
% c point where the derivative is calculated
%r approximation
% instead of r = f(c+h)-f(c))./h;

r= ( feval(f,c+h)- feval(f,c))./h;