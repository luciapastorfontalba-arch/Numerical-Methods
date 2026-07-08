clc 
clear
format long

f=@(t) (t+log(t))./(1+t).^2

% aproximar a la primera derivada de orden 1 con Richarson en el punto 2 y
%su error

[frichard, error] = exricharsond1o1error(f,3,3,2,1/2)
%%

f=@(t) t*log(t^2-1);

[frichard, error] = exricharsond1o1error(f,2,3,2,0.1)